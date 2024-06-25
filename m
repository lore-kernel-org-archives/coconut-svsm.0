Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1719321831;
 bh=rFnE+670IYUq/4YLNRigphfighjev25aWb4w1HUcXsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKySkS9h7vIZDY0+2N3cahxnWoxGHiHDknyl3zCgkJum6rwOvSti7+kScap81ZUOj
 dql2v7xfEpSnD2iB6GekQoooB1YWsr5QxyqzJ+EbxhqN5TwiZJxB43wPKil7kd6twB
 QfKu01h34NzogILSow206tKQZpirrFi7+/YerxMVA6qpTyHSUV5iQ8mqSLcEvhy7TR
 8iYukubZKI+3QuL7ScAu0AGTTufZZQCtbwDcB76tBreBV3FNkDyGytvNTQ9+6ai/DH
 jLdhvK1dKNBLFntS9R7d6vqx0Kk3baBbtE4LXxq1PqKiEecyN0UDYLB30zZKkuggWp
 k1YZ8e6PPB14g==
Date: Tue, 25 Jun 2024 15:23:50 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZnrE5mwLESZ_dXTb@8bytes.org>
References: <ZmmTSnSFmUn5RRgh@8bytes.org>
 <BL3PR11MB6458E28A04F55ED9CF5E8B648DC92@BL3PR11MB6458.namprd11.prod.outlook.com>
 <ZnVRLVfuVkWD_xea@suse.de>
 <BL3PR11MB645868B39332B94AC83DF56B8DD42@BL3PR11MB6458.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR11MB645868B39332B94AC83DF56B8DD42@BL3PR11MB6458.namprd11.prod.outlook.com>
Subject: Re: [svsm-devel] X86-64 Syscall API/ABI Document
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Cc: "Rodel, Jorg" <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi Chuanxiao,

On Mon, Jun 24, 2024 at 02:50:31AM +0000, Dong, Chuanxiao wrote:
> I see. So still taking vcpu as an example, user space process first
> use THREAD_CREATE to create a vcpu thread but this vcpu thread runs on
> the current CPU. The vcpu thread uses VCPU_CREATE syscall to get a
> vcpu_obj and uses WAIT_FOR_EVENT(vcpu_obj) syscall to schedule it to
> the CPU where the vcpu_obj is bound to, and then performs the VM enter
> on the right CPU.

Right, this is how thread-cpu affinity is designed to work.


> When the BATCH syscall returns, if the user_data in the SysCallIn is
> the same with the user_data in the corresponding SysCallOut, means
> kernel has forwarded the user_data to SysCallOut which represents this
> sub syscall is completed. Is this understanding correct?

Yes, but note that no syscall can be considered complete until the
actual BATCH syscall returns.

> Makes sense. So the SET_MEM_STATE can fail to change page
> shared/private state due to the page is MMAP, until such page is
> MUNMAP.

Correct, the COCONUT kernel needs to track which PHYSMEM pages are
mapped and fail PSC on them.

> Yes. As this is related a process to use object handles created by
> another process, it appears that there is no policy restricting
> syscall operations on the object handle exclusively to the process
> that created it, and the object handle is unique globally, is this
> correct?

An object handle itself is not global, but local to the process
acquiring it. It will proably be just an index into an in-kernel array.

What an object handle points to is usually global, but depending on what
it points to there can be multiple handles to the same object (e.g.
files) or just one (e.g. VM, VCPUs).

Passing object handles to new processes will be semantically equivalent
to closing the handle in the originating process and open it again in
the new process.

There must be direct way via the EXEC syscall for this as the new
process can not open some handles directly. E.g. a handle for an mmio
range needs a vm handle to be created, but there can only be one handle
per vm at any time.

> Does this mean, for MMIO_EVENT, it can take any valid range as input
> parameters, no matter it is MMIO or RAM, and for IOIO_EVENT, it can
> take any valid IO port range as input parameters?

I don't see why not, if it is a RAM range there will be no events
reported, as the hardware will not generate them. Also, any limitation
here would need to trust information from the HV on where the MMIO
regions actually are.

> Actually I also want to understand the mappable area provided by an
> evt_obj. As it is mappable area, suppose it can be MMAP(). So
> wondering how this mappable area be used?

The idea is to use it for sharing information related to the event. E.g.
the for a VCPU obj the area will contain information about the last exit
reason. For MMIO it will contain information about the actual access
which triggered the event.

> So MMIO_EVENT/IOIO_EVENT syscalls tell the kernel that, the range
> specified in the syscalls is emulated by some user-space process. If
> an MMIO/IOIO address is located in this range, the corresponding
> user-space process should be waked up, right?

Correct.

> BTW, what we though is when MMIO/IOIO event happens, vcpu thread exits
> from the guest mode and decodes the instruction to get the MMIO
> address and data (if it is an MMIO write), then waked up the device
> model process. I think this matches with what you described here.
> Please let me know if it is not.

Yes, that is the envisioned flow. After an exit from the guest the
COCONUT kernel runs and decodes the event. In case of an MMIO or IOIO
event it will also decode the instruction and look up the event which
needs to be triggered. Once triggered, the user-space process running
the device model wakes up and handles the event.

> How the device model process to get the detailed request? I guess it
> is via the mappable area provided by the evt_obj, but not sure so
> would like to raise the above questions about the mappable area.

Yes, information about the actual event will be stored in the mmap'ed
area of the event object.

> Any consideration for updating CPU state in the device model process?
> Taking the MMIO reading as an example, the reading data may be written
> back to the vCPU register, or VM's memory (depending on the
> instruction). My understanding is that this is part of
> the instruction decoding. The device model process can emulate the
> MMIO/IOIO request and provide the emulated data to the process which
> did the instruction decoding, and that process can write the data back
> via the instruction decoder.

Correct, the plan is that the COCONUT kernel does the state updates for
MMIO and IOIO events.

> Does the "main VM management process" represent the vCPU threads?

The main VM management process drives a VM and starts separate threads
for each VCPU. All of these will be in one process within the same
address space.

> Additional question is how to make the binary aware of the platform?
> Though some compiling option or some syscall?

There will be initial support for writing binaries for the COCONUT
platform. This will include a basic library around the system calls,
platform setup code, memory allocator and so on.

All of this will hopefully flow into making COCONUT a Rust platform
target, so that binaries can be written using Rust standard library
support. But in the beginning there will only be a special library crate
to build binaries against.

> I suppose when GET/SET_STATE(VMSA_GPA), the kernel mode will return
> all the CPU states defined in the VMSA page by coping data from one
> page to another, is this correct? For TDX, this is more expensive
> because reading one VMCS field will require sending one tdcall to TDX
> module. For example, if user mode only wants to know CR0, it is better
> for TDX to just send one tdcall to read the CR0 field instead of
> sending many tdcalls to read all the CPU state from VMCS field to
> construct the VMSA page.

Okay, it might make sense to have a more fine-grained state access. That
should not be a problem, on the AMD platform these calls can be batched
and still update as many state as desired with one user/kernel
transition.

> Indeed, we can think more about the way for the device to process to
> inject an IRQ. SET_STATE might be an option.

SET_STATE is bound to the VCPU object, which is not accessible in the
device emulation process. From the model that evolves here an IRQ event
object which can be triggered from a separate process would make more
sense.

> Sure. As some of the L1's MSR are not used by svsm, we "passthrough"
> such MSR to the VM to simplify the MSR emulation. When VM accesses
> such MSR, the vmexit is handled by reading from/writing to the
> corresponding L1's MSR.
> Here is the list of "passthrough" MSR we made for TDP guest:
> https://github.com/intel-staging/td-partitioning-svsm/blob/svsm-tdp/kernel/src/tdx/vmsr.rs#L595

Okay, whether these are switched on L1/L2 transitions should be
transparent to user-space. User-space can change them via the SET_STATE
call and the kernel handles the details.

> > 
> > Other options would be:
> > 
> > 	* Let the COCONUT kernel forward MMIO and IOIO requests for
> > 	  which it has no handler to the host and use the result for
> > 	  emulation
> > 	* Re-inject these events as #VC/#VE execeptions into the guest
> > 	  OS and let it deal with it.
> > 
> > The right approach probably also depends on wether the OS runs in englightened or paravisor mode.
> 
> For the either enlightened or paravisor mode, is the 1st option workable for both? If so, looks like the 1st option is better as it is more efficient.

Yes, the first option works for both and is also the most efficient.

Regards,

	Joerg
