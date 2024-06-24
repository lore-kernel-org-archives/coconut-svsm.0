Return-Path: <chuanxiao.dong@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E460A1C86CA
 for <svsm-devel@coconut-svsm.dev>; Mon, 24 Jun 2024 04:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719197438; x=1750733438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X0HdI/KwmSW/5/5qCTwgcm2MHKBdIm5Ee4PU82N/GXE=;
 b=ZD42ozDB5JSBhswlCpLbLAGwOJc9BbacnC9d9AEU9K1k/PjoJHFsvO9i
 NZx1TfxfHVPyM6pXqW0kh5PdOsxjyr9Rq5b4yqPTWzvaG2ZizPxINnRmX
 XKnze0VhsLwLCSy1Toh9+ewDy3KdHlboEAL+sSR62QnWuGR2od+N86c1i
 MmcUSYaDmnQNJwJiAImWkjQ71EBs179goeWNT8dnENQ0Ru/yfwT4WCQ5B
 4aRsMmlvjqyb+VBsJnkAH6xJmBqnEIobPXxOvXOdTy6x7TMxLmwMXjc4k
 FHRQNDWT3UBbXDkJuW+f6rTmFOT/8HC/HtiNOGX/UQYakOOdkvfg5636E Q==;
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Date: Mon, 24 Jun 2024 02:50:31 +0000
Message-ID: <BL3PR11MB645868B39332B94AC83DF56B8DD42@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <ZmmTSnSFmUn5RRgh@8bytes.org>
 <BL3PR11MB6458E28A04F55ED9CF5E8B648DC92@BL3PR11MB6458.namprd11.prod.outlook.com>
 <ZnVRLVfuVkWD_xea@suse.de>
In-Reply-To: <ZnVRLVfuVkWD_xea@suse.de>
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
To: "Rodel, Jorg" <jroedel@suse.de>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>


> -----Original Message-----
> From: J=F6rg R=F6del <jroedel@suse.de>
> Sent: Friday, June 21, 2024 6:09 PM
> To: Dong, Chuanxiao <chuanxiao.dong@intel.com>
> Cc: J=F6rg R=F6del <joro@8bytes.org>; svsm-devel@coconut-svsm.dev
> Subject: Re: [svsm-devel] X86-64 Syscall API/ABI Document
>=20
> Hi Chuanxiao,
>=20
> Thanks for your feedback and questions, please see my comments inline.
>=20
> On Fri, Jun 21, 2024 at 08:35:03AM +0000, Dong, Chuanxiao wrote:
> > Thank you for sharing the design document! It has greatly enhanced our =
understanding of the user
> mode design philosophy. Here are some questions and comments from our sid=
e:
> >
> > THREAD_CREATE:
> > a) From the input parameter, seems it only supports creating thread on
> > the current CPU. Is there a plan to allow creating thread on a remote
> > CPU? Or we should avoid this case?
> > b) Is there any plan to add CPU affinity to threads?
>=20
> There will be no direct concept of CPU affinity for threads. Affinity is =
implemented via event sources.
> Each event source is either global or bound to a specific CPU. If a threa=
d waits on a CPU-bound event
> source and is woken up, it will get to run on the CPU the event is bound =
to.
>=20
> So, for example, if user-space aquired an object representing a specific =
VCPU and waits for events on
> that object, the thread will run on the CPU the VCPU object is bound to, =
which is the same CPU as
> where the event happened.

I see. So still taking vcpu as an example, user space process first use THR=
EAD_CREATE to create a vcpu thread but this vcpu thread runs on the current=
 CPU. The vcpu thread uses VCPU_CREATE syscall to get a vcpu_obj and uses W=
AIT_FOR_EVENT(vcpu_obj) syscall to schedule it to the CPU where the vcpu_ob=
j is bound to, and then performs the VM enter on the right CPU.

>=20
>=20
> > BATCH:
> > a) Is the user_data in SysCallIn an identifier, to pair the SysCallOut
> > and SysCallIn which have the same value for the user_data? Would like
> > to better understand the usage of the user_data.
>=20
> User-data is a just a piece of data forwared from SysCallIn to SysCallOut=
 to help user-space to associate
> the request with its internal state. The data is not interpreted by the C=
OCONUT kernel in any way.

When the BATCH syscall returns, if the user_data in the SysCallIn is the sa=
me with the user_data in the corresponding SysCallOut, means kernel has for=
warded the user_data to SysCallOut which represents this sub syscall is com=
pleted. Is this understanding correct?

>=20
> > OPEN_PHYSMEM:
> > a) Suppose the SVMS kernel memory range is excluded, right?
>=20
> Yes, it definitly is.
>=20
> > b) Is there any mechanism to let the user-space process know the valid
> > memory range represented by the object handle? E.g., the end of the
> > memory addresses
>=20
> No, not yet, we need to add a way to inform user-space about the valid me=
mory ranges.
>=20
> In general there also needs to be a limit on how much user-space can map,=
 as we need to avoid that
> user-space just maps everything forever.
>=20
> There is also a requirement that the COCONUT kernel can not allow shared/=
private state changes of
> pages which are currently mapped to user-space, so any physmem mapping ne=
eds to be temporary.

Makes sense. So the SET_MEM_STATE can fail to change page shared/private st=
ate due to the page is MMAP, until such page is MUNMAP.

>=20
> > CAPABILITIES:
> > a) For SEV, VMPL0 is svsm and VM starts from VMPL1, and for TDX, vm-id
> > 0 is svsm and VM starts from vm-id 1. From this point of view, looks
> > like SEV and TDX are similar. So maybe can use a unified VM index
> > bitmap format for them?
>=20
> Yes, that is the idea. I want to keep the interface as common as possible=
 between TDX and SEV.
>=20
> > VM_OPEN:
> > a) If one VM index is opened by a user-space process, the same index
> > cannot be opened again by another user-space process which guarantees
> > that only one process can operate with this VM object handle. But the
> > all threads created by this user-space process can operate with this
> > VM object handle. Is this a correct understanding?
>=20
> Yes, this is correct. Though what is missing so far is the ability to pas=
s object handles to newly created
> processes. This is important for device emulations like the TPM or serial=
 port. The MMIO or IOIO object
> handles have to be created from the VM object handle, but the handling of=
 actual MMIO and IOIO
> events needs to happen in separate processes. So there needs to be a way =
for forward handles on EXEC.

Yes. As this is related a process to use object handles created by another =
process, it appears that there is no policy restricting syscall operations =
on the object handle exclusively to the process that created it, and the ob=
ject handle is unique globally, is this correct?

>=20
> > VM_CAPABILITIES:
> > a) Should report the VM memory range? Or always assume VM can see the
> > entire range supported by the ObjHandle created by OPEN_PHYSMEM?
>=20
> This depends on how the memory ranges given to specific VMs are going to =
be defined. It should
> probably be up to user-space to assign memory to a given VM. I need to th=
ink more about that.
>=20
> > MMIO/IOIO_EVENT:
> > a) Is there any way to know the length of the mappable area provided
> > by the evt_obj? Or the length is some fixed size defined by the kernel
> > mode?
>=20
> I consider these architecturally defined, the MMIO area range is all of p=
hysical memory, the IOIO range
> is the whole IO port range.

Does this mean, for MMIO_EVENT, it can take any valid range as input parame=
ters, no matter it is MMIO or RAM, and for IOIO_EVENT, it can take any vali=
d IO port range as input parameters?

Actually I also want to understand the mappable area provided by an evt_obj=
. As it is mappable area, suppose it can be MMAP(). So wondering how this m=
appable area be used?

>=20
> > b) Would like to have a better understanding of the usage. We assume
> > that, the MMIO/IOIO range set by the syscalls are monitored by some
> > device model thread in the user space. When VM occurs vmexit due to
> > MMIO/IOIO accessing, the kernel vcpu thread decodes the MMIO/IOIO
> > address and if the address is located 	in the range set by
> > these syscalls, the kernel vcpu thread wakes up the monitoring device
> > model thread and then waits. The device model thread in the user mode
> > will get the address/data via the mappable area and do emulation.
> > After the emulation is completed, the device model thread wakes up the
> > kernel vcpu thread. If the decoding part is not in the kernel-space
> > but in the user-space, then the vcpu should back to the user mode to
> > decode instruction and wait to be waked up by the device model thread.
> > Is this the expected flow for handling MMIO/IOIO in the user mode?
>=20
> As I have written above, the device models should run in a separate proce=
ss. When the COOCNUT
> kernel is waked up with an MMIO or IOIO event from a guest is decodes the=
 instruction and based on
> the address which is accessed it will wake up the corresponding device em=
ulation process.

So MMIO_EVENT/IOIO_EVENT syscalls tell the kernel that, the range specified=
 in the syscalls is emulated by some user-space process. If an MMIO/IOIO ad=
dress is located in this range, the corresponding user-space process should=
 be waked up, right?

BTW, what we though is when MMIO/IOIO event happens, vcpu thread exits from=
 the guest mode and decodes the instruction to get the MMIO address and dat=
a (if it is an MMIO write), then waked up the device model process. I think=
 this matches with what you described here. Please let me know if it is not=
.

>=20
> That process then handles the request and updates device and CPU state.

How the device model process to get the detailed request? I guess it is via=
 the mappable area provided by the evt_obj, but not sure so would like to r=
aise the above questions about the mappable area.

Any consideration for updating CPU state in the device model process? Takin=
g the MMIO reading as an example, the reading data may be written back to t=
he vCPU register, or VM's memory (depending on the instruction). My underst=
anding is that this is part of the instruction decoding. The device model p=
rocess can emulate the MMIO/IOIO request and provide the emulated data to t=
he process which did the instruction decoding, and that process can write t=
he data back via the instruction decoder.

> Upon return to kernel mode COCONUT will directly go back into executing t=
he guest OS.
>=20
> I think this can be done without or with very minimal involvement of the =
main VM management
> process.

Does the "main VM management process" represent the vCPU threads?

>=20
> > SET_MEM_STATE:
> > a) Any consideration for using paddr + page_size instead of
> > start_paddr + end_paddr as the input parameters? Using start_paddr +
> > end_paddr may be more efficient to set state for a memory region.
>=20
> The SET_MEM_STATE input is defined to also suit AMDs use-case. on AMD the=
 PVALIDATE instruction
> needs a page-size specified, so there needs to be a way to pass that info=
rmation in. This is difficult to do
> with a range-based interface.
>=20
> Also, errors are harder to propagate on a range-based input, as validatio=
n can fail in the middle of a
> range and user-space needs a consistent picture of what was validated.
>=20
> For validating a whole range the BATCH system call can be used to send as=
 many SET_MEM_STATE
> requests as needed in one invocation.

Got it. Then it makes more sense for using paddr + page_size.

>=20
> > VCPU_CREATE:
> > a) Regarding "The VCPU can be run with the WAIT_FOR_EVENT() system
> > call",  the expectation is that the WAIT_FOR_EVENT(vcpu_obj) will
> > perform vmenter in the kernel mode, is this understanding correct?
>=20
> Yes, this is correct. I had a RUN system call specified initially, but fo=
und it redundant with the
> WAIT_FOR_EVENT call in this case.
>=20
> > GET/SET_STATE:
> > a) The type struct VmsaGpa is defined as AMD only. Does this mean the
> > user mode should have knowledge about if the platform is SEV or TDX?
> > Or there will be a per-architecture user mode VMM executable binary?
>=20
> My hope is that we can one binary which is mostly common between TDX and =
SEV-SNP. The binary has
> to be aware of the platform as there will always be platform-specific han=
dling required to some degree,
> but a lot of the main handling infrastructure can be common, I think.

Additional question is how to make the binary aware of the platform? Though=
 some compiling option or some syscall?

>=20
> > b) For TDX, all the VCPU states are stored in the VMCS. Probably need
> > to introduce a new type for TDX to set/get vcpu state:
>=20
> > 	Type		Data Structure		Description
> > 	----------------------------------------------------------------------=
----------------------------------
> > 	VMCS		Struct VmcsField	The VMCS field encoding and the
> > 						corresponding data (Intel Only)
> > 	Struct VmcsField {
> > 		encoding: u32,		// VMCS field encoding
> > 		data: u64,		// VMCS field data
> > 	}
> > 	GET/SET_STATE syscall can be batched so that can set/get multiple VCPU=
 states by one time.
>=20
> This depends, a lot of state in the VMCS also exists in the VMSA, for tho=
se there will be common state
> definitions, e.g. for:
>=20
> 	* GPRs
> 	* FPU/XMM/YMM state
> 	* Control registers
> 	* Architectural MSRs (if needed)
> 	* APIC and IRQ injection state
>=20
> There are probably some VMCS specific fields which are not covered by com=
mon state abstractions, for
> those TDX specific state calls are fine.

I suppose when GET/SET_STATE(VMSA_GPA), the kernel mode will return all the=
 CPU states defined in the VMSA page by coping data from one page to anothe=
r, is this correct? For TDX, this is more expensive because reading one VMC=
S field will require sending one tdcall to TDX module. For example, if user=
 mode only wants to know CR0, it is better for TDX to just send one tdcall =
to read the CR0 field instead of sending many tdcalls to read all the CPU s=
tate from VMCS field to construct the VMSA page.

>=20
>=20
> > 	c) The vLAPIC is emulated in the kernel mode. In this case, is
> > 	it necessary to allow user mode get the vLAPIC state? The
> > 	potential user case is for the user mode to emulate vCPUID 01
> > 	EBX which requires the vLAPIC ID.
>=20
> It is at least a way needed for device emulation processes to inject an I=
RQ into the guest OS.

Indeed, we can think more about the way for the device to process to inject=
 an IRQ. SET_STATE might be an option.

> Full APIC access might not be needed, the vLAPIC ID can also be propagate=
d via a VCPU GET_STATE call or
> something similar.

Agree.

>=20
> > Possible new syscalls for Class0: to help the user mode to execute some=
 privilege instructions:
> > a) The user mode may need to read/write L1's MSR to emulate the vMSR
> > for VM, but rdmsr/wrmsr instructions are not allowed in the user mode
> > for both SEV and TDX. The RDMSR/WRMSR syscalls can help the user mode
> > to achieve this:
>=20
> Can you elaborate a bit on that? Whic L1 MSRs need to be accessible and f=
or what reason? In general I
> do not think it is a good idea to allow user-space accessing arbitratry M=
SRs.

Sure. As some of the L1's MSR are not used by svsm, we "passthrough" such M=
SR to the VM to simplify the MSR emulation. When VM accesses such MSR, the =
vmexit is handled by reading from/writing to the corresponding L1's MSR.
Here is the list of "passthrough" MSR we made for TDP guest: https://github=
.com/intel-staging/td-partitioning-svsm/blob/svsm-tdp/kernel/src/tdx/vmsr.r=
s#L595

>=20
> > b) The user mode may need to access some MMIO or IO port emulated by
> > L0 to emulate certain MMIO/IOIO event for VM. The accessing in user
> > mode can be done via MOV/IOIO instructions, but it can trigger #VC/#VE
> > from the user mode and requires instruction decoding/emulating. To
> > simplify, the MMIO/IOIO accessing can be done via the enlighten way
> > (VMGEXIT for SEV and TDCALL for TDX). But for TDX, the TDCALL is
> > privileged command which is not allowed in the user mode. So it has to
> > be done in the kernel mode. If using the enlighten way for the user
> > mode to access MMIO/IOIO is preferred, then new syscalls are necessary
> > for TDX. Shall we?
>=20
> Yes, you are right, a way for user-space to forward request to the host i=
s currently completely missing.
>=20
> I wonder what the best way here is, but routing these through user-space =
if maybe not the best
> approach, or do you see cases where user-space won't forward request unmo=
dified?

I don't see the need for routing such MMIO/IOIO requests from the kernel-sp=
ace to the user-space, if we allow kernel-space to directly forward these M=
MIO/IOIO requests to host.

>=20
> Other options would be:
>=20
> 	* Let the COCONUT kernel forward MMIO and IOIO requests for
> 	  which it has no handler to the host and use the result for
> 	  emulation
> 	* Re-inject these events as #VC/#VE execeptions into the guest
> 	  OS and let it deal with it.
>=20
> The right approach probably also depends on wether the OS runs in engligh=
tened or paravisor mode.

For the either enlightened or paravisor mode, is the 1st option workable fo=
r both? If so, looks like the 1st option is better as it is more efficient.

>=20
> > Questions for ObjHandle:
> > a) Although the ObjHandle seems a common type, a given ObjHandle
> > should only be used as an input for specific syscalls. For example,
> > the ObjHandle returned by OPEN cannot be used as input for the
> > VM_CAPABILITIES. Is this a correct understanding?
>=20
> Yes, that is correct. The system call design follows an "everything is an=
 object" model with the system
> call classes being traits for these objects. Every object only implements=
 a subset of system call classes.
>=20
> > b) If a) is true, sounds like for a given ObjHandle, the user should
> > know how the ObjHandle is created, otherwise the it is hard to
> > distinguish which syscalls can use this ObjHandle as an input?
>=20
> Yes, user-space knows what type an object handle is of by the way it crea=
ted it. VM objects cans only
> be created by VM_OPEN, VCPU objects only by VCPU_CREATE, and so on.
>=20
> (VCPU_CREATE should be renamed to VCPU_OPEN, as VCPUs conceptually  alrea=
dy exist, I will update
> the document).

Got it. This renaming sounds good to me.

Thanks
Chuanxiao

>=20
> Regards,
>=20
> 	Joerg
>=20
> --
> J=F6rg R=F6del
> jroedel@suse.de
>=20
> SUSE Software Solutions Germany GmbH
> Frankenstra=DFe 146
> 90461 N=FCrnberg
> Germany
> https://www.suse.com/
>=20
> Gesch=E4ftsf=FChrer: Ivo Totev, Andrew McDonald, Werner Knoblich (HRB 368=
09, AG N=FCrnberg)
