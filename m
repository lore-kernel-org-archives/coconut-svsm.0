Return-Path: <chuanxiao.dong@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D61491C890D
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Jun 2024 09:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719385977; x=1750921977;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=buUr3/kYzzlg+pM4eESljnClNL/7gPMirNlWMwzZizk=;
 b=he6uaHSe9D97x1Hxf+YMkSAw39XMZdbEP2oluPBl+5Mz5WdpU3UZFGD9
 mIErzKVIT4gVXcoxFPln7DPO1ypt3rXk1cMcDOFUngFJ1tpxNlIMLHzew
 6Y1LM8DVL359kPvkSLQUNYFefV6+ct8QvxJZVDIwN1LexeocVyvFHpdct
 7S1lrnajcCB+rcKDoccFieenJQFp53hL0QirYX0uiIYn5uLSdB7vEgQZF
 b9NSgGsKOrJzvJvMInWSM2vu+7WKMBq7WDmh7qqCq2qeVUiiW9wbc9BuQ
 S6bSwayyguOGEcLCIQJF/p0n/t0zXM0zWLEUN23ffMRThpjmZ+Gk6PcLK A==;
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Date: Wed, 26 Jun 2024 07:12:50 +0000
Message-ID: <BL3PR11MB6458613E204B08CDD15FB7548DD62@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <ZmmTSnSFmUn5RRgh@8bytes.org>
 <BL3PR11MB6458E28A04F55ED9CF5E8B648DC92@BL3PR11MB6458.namprd11.prod.outlook.com>
 <ZnVRLVfuVkWD_xea@suse.de>
 <BL3PR11MB645868B39332B94AC83DF56B8DD42@BL3PR11MB6458.namprd11.prod.outlook.com>
 <ZnrE5mwLESZ_dXTb@8bytes.org>
In-Reply-To: <ZnrE5mwLESZ_dXTb@8bytes.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] X86-64 Syscall API/ABI Document
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: "Rodel, Jorg" <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi Joerg,

> -----Original Message-----
> From: J=F6rg R=F6del <joro@8bytes.org>
> Sent: Tuesday, June 25, 2024 9:24 PM
> To: Dong, Chuanxiao <chuanxiao.dong@intel.com>
> Cc: Rodel, Jorg <jroedel@suse.de>; svsm-devel@coconut-svsm.dev
> Subject: Re: [svsm-devel] X86-64 Syscall API/ABI Document
>=20
> Hi Chuanxiao,
>=20
> On Mon, Jun 24, 2024 at 02:50:31AM +0000, Dong, Chuanxiao wrote:
> > I see. So still taking vcpu as an example, user space process first
> > use THREAD_CREATE to create a vcpu thread but this vcpu thread runs on
> > the current CPU. The vcpu thread uses VCPU_CREATE syscall to get a
> > vcpu_obj and uses WAIT_FOR_EVENT(vcpu_obj) syscall to schedule it to
> > the CPU where the vcpu_obj is bound to, and then performs the VM enter
> > on the right CPU.
>=20
> Right, this is how thread-cpu affinity is designed to work.
>=20
>=20
> > When the BATCH syscall returns, if the user_data in the SysCallIn is
> > the same with the user_data in the corresponding SysCallOut, means
> > kernel has forwarded the user_data to SysCallOut which represents this
> > sub syscall is completed. Is this understanding correct?
>=20
> Yes, but note that no syscall can be considered complete until the actual=
 BATCH syscall returns.

Sure, definitely.

>=20
> > Makes sense. So the SET_MEM_STATE can fail to change page
> > shared/private state due to the page is MMAP, until such page is
> > MUNMAP.
>=20
> Correct, the COCONUT kernel needs to track which PHYSMEM pages are mapped=
 and fail PSC on them.
>=20
> > Yes. As this is related a process to use object handles created by
> > another process, it appears that there is no policy restricting
> > syscall operations on the object handle exclusively to the process
> > that created it, and the object handle is unique globally, is this
> > correct?
>=20
> An object handle itself is not global, but local to the process acquiring=
 it. It will proably be just an index
> into an in-kernel array.
>=20
> What an object handle points to is usually global, but depending on what =
it points to there can be
> multiple handles to the same object (e.g.
> files) or just one (e.g. VM, VCPUs).
>=20
> Passing object handles to new processes will be semantically equivalent t=
o closing the handle in the
> originating process and open it again in the new process.
>=20
> There must be direct way via the EXEC syscall for this as the new process=
 can not open some handles
> directly. E.g. a handle for an mmio range needs a vm handle to be created=
, but there can only be one
> handle per vm at any time.

Does this mean, although the vm_obj for a specific vm-index cannot be opene=
d directly via VM_OPEN() again if such vm_obj is already opened, there can =
be multiple vm_obj copies (no via VM_OPEN) at the same so that processes or=
 threads can use the same vm_obj at the same time?

Probably also needs to consider for the THREAD_CREATE syscall? One possible=
 scenario might be, the main VM process gets the vm_obj via VM_OPEN() and c=
reates multiple vcpu threads via THREAD_CREATE(). Then when a vcpu thread g=
ets the corresponding vcpu_obj via VCPU_CREATE(), the vm_obj will be needed=
 by this vcpu thread. Another possible example might be, if the private/sha=
re memory conversion events from the VM is handled by the vcpu thread, then=
 SET_MEM_STATE() might be used by the vcpu thread, which also needs the vm_=
obj.

>=20
> > Does this mean, for MMIO_EVENT, it can take any valid range as input
> > parameters, no matter it is MMIO or RAM, and for IOIO_EVENT, it can
> > take any valid IO port range as input parameters?
>=20
> I don't see why not, if it is a RAM range there will be no events reporte=
d, as the hardware will not
> generate them. Also, any limitation here would need to trust information =
from the HV on where the
> MMIO regions actually are.

When the guest uses "movs" instruction to access a MMIO, two addresses can =
be decoded (one is MMIO address and the other is RAM address) from the inst=
ruction. In this case, if this RAM address is also monitored by the user-sp=
ace via MMIO_EVENT(), I guess kernel can report a RAM event if it wants, bu=
t we can implement to let kernel ignore the monitoring for the RAM address.=
  =20

>=20
> > Actually I also want to understand the mappable area provided by an
> > evt_obj. As it is mappable area, suppose it can be MMAP(). So
> > wondering how this mappable area be used?
>=20
> The idea is to use it for sharing information related to the event. E.g.
> the for a VCPU obj the area will contain information about the last exit =
reason. For MMIO it will
> contain information about the actual access which triggered the event.

Got it. So seems like the mappable area of a vcpu or MMIO/IOIO object shoul=
d have some pre-defined format, so that the user-space can understand the m=
apping length and how to get the data from it.

>=20
> > So MMIO_EVENT/IOIO_EVENT syscalls tell the kernel that, the range
> > specified in the syscalls is emulated by some user-space process. If
> > an MMIO/IOIO address is located in this range, the corresponding
> > user-space process should be waked up, right?
>=20
> Correct.
>=20
> > BTW, what we though is when MMIO/IOIO event happens, vcpu thread exits
> > from the guest mode and decodes the instruction to get the MMIO
> > address and data (if it is an MMIO write), then waked up the device
> > model process. I think this matches with what you described here.
> > Please let me know if it is not.
>=20
> Yes, that is the envisioned flow. After an exit from the guest the COCONU=
T kernel runs and decodes the
> event. In case of an MMIO or IOIO event it will also decode the instructi=
on and look up the event which
> needs to be triggered. Once triggered, the user-space process running the=
 device model wakes up and
> handles the event.

Then once the COCONUT kernel triggers event and wakes up (equivalent callin=
g TRIGGER_EDGE(mmio/ioio_obj) but in kernel-space) the user-space device mo=
del process which has called WAIT_FOR_EVENT(mmio/ioio_obj), it starts to wa=
it for the MMIO/IOIO event in the kernel-space (equivalent calling WAIT_FOR=
_EVENT (mmio/ioio_obj) but in kernel-space). After the user-space device mo=
del process completes the event handling, it will wake up the waiting COCON=
UT kernel thread via the TRIGGER_EDGE(mmio/ioio_obj), is this correct?

>=20
> > How the device model process to get the detailed request? I guess it
> > is via the mappable area provided by the evt_obj, but not sure so
> > would like to raise the above questions about the mappable area.
>=20
> Yes, information about the actual event will be stored in the mmap'ed are=
a of the event object.

Got it. Seems like for a MMIO/IOIO read event, after the device mode proces=
s completes the event handling, the read value will also be stored in the m=
apped area of the event object, for the COCONUT kernel to do the state upda=
tes.

>=20
> > Any consideration for updating CPU state in the device model process?
> > Taking the MMIO reading as an example, the reading data may be written
> > back to the vCPU register, or VM's memory (depending on the
> > instruction). My understanding is that this is part of the instruction
> > decoding. The device model process can emulate the MMIO/IOIO request
> > and provide the emulated data to the process which did the instruction
> > decoding, and that process can write the data back via the instruction
> > decoder.
>=20
> Correct, the plan is that the COCONUT kernel does the state updates for M=
MIO and IOIO events.

Cool. That is also my expectation.

>=20
> > Does the "main VM management process" represent the vCPU threads?
>=20
> The main VM management process drives a VM and starts separate threads fo=
r each VCPU. All of these
> will be in one process within the same address space.
>=20
> > Additional question is how to make the binary aware of the platform?
> > Though some compiling option or some syscall?
>=20
> There will be initial support for writing binaries for the COCONUT platfo=
rm. This will include a basic
> library around the system calls, platform setup code, memory allocator an=
d so on.
>=20
> All of this will hopefully flow into making COCONUT a Rust platform targe=
t, so that binaries can be
> written using Rust standard library support. But in the beginning there w=
ill only be a special library
> crate to build binaries against.

Understand. This should be the item "[StdRust] COCONUT-SVSM as Rust Tier3/2=
 Target" in the development plan.

As "the binary has to be aware of the platform as there will always be plat=
form-specific handling required to some degree", I though this requires the=
 binary being able to distinguish SEV, TDX and other possible architectures=
, so wondering what might be the preferred way to do so.

>=20
> > I suppose when GET/SET_STATE(VMSA_GPA), the kernel mode will return
> > all the CPU states defined in the VMSA page by coping data from one
> > page to another, is this correct? For TDX, this is more expensive
> > because reading one VMCS field will require sending one tdcall to TDX
> > module. For example, if user mode only wants to know CR0, it is better
> > for TDX to just send one tdcall to read the CR0 field instead of
> > sending many tdcalls to read all the CPU state from VMCS field to
> > construct the VMSA page.
>=20
> Okay, it might make sense to have a more fine-grained state access. That =
should not be a problem, on
> the AMD platform these calls can be batched and still update as many stat=
e as desired with one
> user/kernel transition.

Yes, sure. Let's have a more fine-grained state access.

>=20
> > Indeed, we can think more about the way for the device to process to
> > inject an IRQ. SET_STATE might be an option.
>=20
> SET_STATE is bound to the VCPU object, which is not accessible in the dev=
ice emulation process. From
> the model that evolves here an IRQ event object which can be triggered fr=
om a separate process would
> make more sense.

I see. Ultimately, the IRQ event will be synced to virtual LAPIC in the ker=
nel, but I am currently not clear about how this is achieved from the devic=
e model process. If you have more detailed ideas which is ready to share, I=
 would be interested in learning about it.

>=20
> > Sure. As some of the L1's MSR are not used by svsm, we "passthrough"
> > such MSR to the VM to simplify the MSR emulation. When VM accesses
> > such MSR, the vmexit is handled by reading from/writing to the
> > corresponding L1's MSR.
> > Here is the list of "passthrough" MSR we made for TDP guest:
> > https://github.com/intel-staging/td-partitioning-svsm/blob/svsm-tdp/ke
> > rnel/src/tdx/vmsr.rs#L595
>=20
> Okay, whether these are switched on L1/L2 transitions should be transpare=
nt to user-space. User-space
> can change them via the SET_STATE call and the kernel handles the details=
.

Got it. BTW, do you think if should have a way to tell whether a guest's MS=
R is emulated by the COCONUT kernel or by the user-space process?

As the virtual LAPIC is implemented in the kernel, I believe the x2apic MSR=
s will be emulated directly in the COCONUT kernel without returning back to=
 the user-space. If we want the some MSRs to be emulated by the user-space,=
 probably needs to tell kernel about this so that, the COCONUT kernel can r=
eturn back to the user space in case of the vmexit occurs due to these user=
-space monitored MSR?

Thanks
Chuanxiao

>=20
> > >
> > > Other options would be:
> > >
> > > 	* Let the COCONUT kernel forward MMIO and IOIO requests for
> > > 	  which it has no handler to the host and use the result for
> > > 	  emulation
> > > 	* Re-inject these events as #VC/#VE execeptions into the guest
> > > 	  OS and let it deal with it.
> > >
> > > The right approach probably also depends on wether the OS runs in eng=
lightened or paravisor
> mode.
> >
> > For the either enlightened or paravisor mode, is the 1st option workabl=
e for both? If so, looks like the
> 1st option is better as it is more efficient.
>=20
> Yes, the first option works for both and is also the most efficient.
>=20
> Regards,
>=20
> 	Joerg
