Return-Path: <chuanxiao.dong@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 2FFFD1C735F
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Jun 2024 10:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718958910; x=1750494910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2scms7rhQmN1XMhn2wF2wFJ2Njhzz53UQDUs/69xkGU=;
 b=CP+W35BAiNble7dVa2i0aJds/yci7cb37cXPPKKjdwQSmOzCX65iiUl4
 dNgy6mii9Z0f/lhcxjUNon0Fzlpk7GF7OlE70S+ac1WO8l45/Mbka1yjm
 h2+i13AQg4AIx3ERV+u/BqytXraT7PqlRFfzEGC3XXUkIJxuzsbUrMYwS
 QOEtwjaXA3DJa1w96sIBxex8Ck720rNng9ezizl2dcpa7eN0psygYvzYk
 hNSNm9ov2vIVCNJE6la8701IwOZLS4esUyMtXhjs1SeFNEE4QTtpR7FLB
 wIxy08EjMikMBFS7G8rm8+E+Y5250MHy6ZbdPqWmJsMOsRBF1n8ScPcd4 g==;
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Date: Fri, 21 Jun 2024 08:35:03 +0000
Message-ID: <BL3PR11MB6458E28A04F55ED9CF5E8B648DC92@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <ZmmTSnSFmUn5RRgh@8bytes.org>
In-Reply-To: <ZmmTSnSFmUn5RRgh@8bytes.org>
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
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi Joerg,

Thank you for sharing the design document! It has greatly enhanced our unde=
rstanding of the user mode design philosophy. Here are some questions and c=
omments from our side:

THREAD_CREATE:
a) From the input parameter, seems it only supports creating thread on the =
current CPU. Is there a plan to allow creating thread on a remote CPU? Or w=
e should avoid this case?
b) Is there any plan to add CPU affinity to threads?

BATCH:
a) Is the user_data in SysCallIn an identifier, to pair the SysCallOut and =
SysCallIn which have the same value for the user_data? Would like to better=
 understand the usage of the user_data.

OPEN_PHYSMEM:
a) Suppose the SVMS kernel memory range is excluded, right?
b) Is there any mechanism to let the user-space process know the valid memo=
ry range represented by the object handle? E.g., the end of the memory addr=
esses

CAPABILITIES:
a) For SEV, VMPL0 is svsm and VM starts from VMPL1, and for TDX, vm-id 0 is=
 svsm and VM starts from vm-id 1. From this point of view, looks like SEV a=
nd TDX are similar. So maybe can use a unified VM index bitmap format for t=
hem?

VM_OPEN:
a) If one VM index is opened by a user-space process, the same index cannot=
 be opened again by another user-space process which guarantees that only o=
ne process can operate with this VM object handle. But the all threads crea=
ted by this user-space process can operate with this VM object handle. Is t=
his a correct understanding?

VM_CAPABILITIES:
a) Should report the VM memory range? Or always assume VM can see the entir=
e range supported by the ObjHandle created by OPEN_PHYSMEM?

MMIO/IOIO_EVENT:
a) Is there any way to know the length of the mappable area provided by the=
 evt_obj? Or the length is some fixed size defined by the kernel mode?
b) Would like to have a better understanding of the usage. We assume that, =
the MMIO/IOIO range set by the syscalls are monitored by some device model =
thread in the user space. When VM occurs vmexit due to MMIO/IOIO accessing,=
 the kernel vcpu thread decodes the MMIO/IOIO address and if the address is=
 located 	in the range set by these syscalls, the kernel vcpu thread wakes =
up the monitoring device model thread and then waits. The device model thre=
ad in the user mode will get the address/data via the mappable area and do =
emulation. After the emulation is completed, the device model thread wakes =
up the kernel vcpu thread. If the decoding part is not in the kernel-space =
but in the user-space, then the vcpu should back to the user mode to decode=
 instruction and wait to be waked up by the device model thread. Is this th=
e expected flow for handling MMIO/IOIO in the user mode?

SET_MEM_STATE:
a) Any consideration for using paddr + page_size instead of start_paddr + e=
nd_paddr as the input parameters? Using start_paddr + end_paddr may be more=
 efficient to set state for a memory region.

VCPU_CREATE:
a) Regarding "The VCPU can be run with the WAIT_FOR_EVENT() system call",  =
the expectation is that the WAIT_FOR_EVENT(vcpu_obj) will perform vmenter i=
n the kernel mode, is this understanding correct?

GET/SET_STATE:
a) The type struct VmsaGpa is defined as AMD only. Does this mean the user =
mode should have knowledge about if the platform is SEV or TDX? Or there wi=
ll be a per-architecture user mode VMM executable binary?
b) For TDX, all the VCPU states are stored in the VMCS. Probably need to in=
troduce a new type for TDX to set/get vcpu state:
	Type		Data Structure		Description
	--------------------------------------------------------------------------=
------------------------------
	VMCS		Struct VmcsField	The VMCS field encoding and the
						corresponding data (Intel Only)
	Struct VmcsField {
		encoding: u32,		// VMCS field encoding
		data: u64,		// VMCS field data
	}
	GET/SET_STATE syscall can be batched so that can set/get multiple VCPU sta=
tes by one time.
	c) The vLAPIC is emulated in the kernel mode. In this case, is it necessar=
y to allow user mode get the vLAPIC state? The potential user case is for t=
he user mode to emulate vCPUID 01 EBX which requires the vLAPIC ID.

Possible new syscalls for Class0: to help the user mode to execute some pri=
vilege instructions:
a) The user mode may need to read/write L1's MSR to emulate the vMSR for VM=
, but rdmsr/wrmsr instructions are not allowed in the user mode for both SE=
V and TDX. The RDMSR/WRMSR syscalls can help the user mode to achieve this:
	ACCESS_MSR
	Read data from a MSR, or write data to a MSR
	System Call number: 11

	Parameters
	--------------------------------------------------------------------------=
-----------------------
	Parameter	Type		Description
	--------------------------------------------------------------------------=
-----------------------
	1. MSR index	u32		The MSR to access
	2. read		bool		Indicate if this is a MSR read or write.
	2. data		VirtAddr	The virtual address to store the data
					reading from MSR, or the data written to
					the MSR.
=09
	Returns  0 on success, error code on failure
=09
b) The user mode may need to access some MMIO or IO port emulated by L0 to =
emulate certain MMIO/IOIO event for VM. The accessing in user mode can be d=
one via MOV/IOIO instructions, but it can trigger #VC/#VE from the user mod=
e and requires instruction decoding/emulating. To simplify, the MMIO/IOIO a=
ccessing can be done via the enlighten way (VMGEXIT for SEV and TDCALL for =
TDX). But for TDX, the TDCALL is privileged command which is not allowed in=
 the user mode. So it has to be done in the kernel mode. If using the enlig=
hten way for the user mode to access MMIO/IOIO is preferred, then new sysca=
lls are necessary for TDX. Shall we?
	ACCESS_IO
	Read data from an IO port, or write data to an IO port.
	System Call number: 12
=09
	Parameters
	--------------------------------------------------------------------------=
-----------------------
	Parameter	Type		Description
	--------------------------------------------------------------------------=
-----------------------
	1. port		u16		The IO port to access.
	2. size		u8		The IO port size. Only 1(u8)/2(u16)/4(u32)
					are supported.
	3. read		bool		Indicate if this is an IO read or write.
	4. data		VirtAddr	The virtual address to store the data
					reading from the IO port, or the data written
					to the IO port.
=09
	Returns  0 on success, error code on failure
	=09
	ACCESS_MMIO
	Read a MMIO, or write data to a MMIO.
	System Call number: 13
=09
	Parameters
	--------------------------------------------------------------------------=
-----------------------
	Parameter	Type		Description
	--------------------------------------------------------------------------=
-----------------------
	1. paddr	u64		The MMIO address to access.
	2. size		u8		The MMIO size. Only 1(u8)/2(u16)/4(u32)/
					8(u64) are supported.
	3. read		bool		Indicate if this is a MMIO read or write.
	4. data		VirtAddr	The virtual address to store the data
					reading from the MMIO, or the data written
					to the MMIO
=09
	Returns  0 on success, error code on failure
=09
Questions for ObjHandle:
a) Although the ObjHandle seems a common type, a given ObjHandle should onl=
y be used as an input for specific syscalls. For example, the ObjHandle ret=
urned by OPEN cannot be used as input for the VM_CAPABILITIES. Is this a co=
rrect understanding?
b) If a) is true, sounds like for a given ObjHandle, the user should know h=
ow the ObjHandle is created, otherwise the it is hard to distinguish which =
syscalls can use this ObjHandle as an input?

Thanks
Chuanxiao

> -----Original Message-----
> From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of J?rg =
R?del
> Sent: Wednesday, June 12, 2024 8:24 PM
> To: svsm-devel@coconut-svsm.dev
> Subject: [svsm-devel] X86-64 Syscall API/ABI Document
>=20
> Hi,
>=20
> as promised here is an initial draft of the Syscall document I worked on.=
 It is not ready yet, lacks some
> details and is definitely subject to change.
>=20
> But I think the general ideas are in there already and it is a good enoug=
h base to define TDX and SNP
> specific VM management APIs on top of it.
>=20
> So please review the document and provide your feedback. If time allows w=
e can have some initial
> discussion around it in todays meeting. A more general discussion has to =
wait for the next meeting,
> when everyone had time to review it.
>=20
> Regards,
>=20
> 	Joerg
