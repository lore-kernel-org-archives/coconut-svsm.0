Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BC6F91C8717
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Jun 2024 12:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718964526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFrdv4YaIJbpSXI7ruLcCzUQeRVCclvW+/saDmyhCOs=;
 b=GE9jKOdImdmdI5TNrN5k9Ue8rBc5mwoKdFHmrciBn50wtXgcFz5y2E3ydavZS71RtHctsF
 q6Uq8lHlIylYcjkSaxNksqz8g+p7u+mfmP3goYOh4aaSx20XmaufMUVYYIB4Po2x7gSK2K
 +ebROXvcWngdW7VdD08Z6kk/n8qTAJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718964526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFrdv4YaIJbpSXI7ruLcCzUQeRVCclvW+/saDmyhCOs=;
 b=fyfldneXULhyVt4EYRlLARjekbXWQrjQCgJenPyyb8GJaOQ12CTl//j7Ek4OHK2O+Fze8M
 tT0bF639ZJ/Y9ACg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718964526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFrdv4YaIJbpSXI7ruLcCzUQeRVCclvW+/saDmyhCOs=;
 b=GE9jKOdImdmdI5TNrN5k9Ue8rBc5mwoKdFHmrciBn50wtXgcFz5y2E3ydavZS71RtHctsF
 q6Uq8lHlIylYcjkSaxNksqz8g+p7u+mfmP3goYOh4aaSx20XmaufMUVYYIB4Po2x7gSK2K
 +ebROXvcWngdW7VdD08Z6kk/n8qTAJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718964526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFrdv4YaIJbpSXI7ruLcCzUQeRVCclvW+/saDmyhCOs=;
 b=fyfldneXULhyVt4EYRlLARjekbXWQrjQCgJenPyyb8GJaOQ12CTl//j7Ek4OHK2O+Fze8M
 tT0bF639ZJ/Y9ACg==
Date: Fri, 21 Jun 2024 12:08:45 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZnVRLVfuVkWD_xea@suse.de>
References: <ZmmTSnSFmUn5RRgh@8bytes.org>
 <BL3PR11MB6458E28A04F55ED9CF5E8B648DC92@BL3PR11MB6458.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL3PR11MB6458E28A04F55ED9CF5E8B648DC92@BL3PR11MB6458.namprd11.prod.outlook.com>
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
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"

Hi Chuanxiao,

Thanks for your feedback and questions, please see my comments inline.

On Fri, Jun 21, 2024 at 08:35:03AM +0000, Dong, Chuanxiao wrote:
> Thank you for sharing the design document! It has greatly enhanced our understanding of the user mode design philosophy. Here are some questions and comments from our side:
> 
> THREAD_CREATE:
> a) From the input parameter, seems it only supports creating thread on
> the current CPU. Is there a plan to allow creating thread on a remote
> CPU? Or we should avoid this case?
> b) Is there any plan to add CPU affinity to threads?

There will be no direct concept of CPU affinity for threads. Affinity is
implemented via event sources. Each event source is either global or
bound to a specific CPU. If a thread waits on a CPU-bound event source
and is woken up, it will get to run on the CPU the event is bound to.

So, for example, if user-space aquired an object representing a specific
VCPU and waits for events on that object, the thread will run on the CPU
the VCPU object is bound to, which is the same CPU as where the event
happened.


> BATCH:
> a) Is the user_data in SysCallIn an identifier, to pair the SysCallOut
> and SysCallIn which have the same value for the user_data? Would like
> to better understand the usage of the user_data.

User-data is a just a piece of data forwared from SysCallIn to
SysCallOut to help user-space to associate the request with its internal
state. The data is not interpreted by the COCONUT kernel in any way.

> OPEN_PHYSMEM:
> a) Suppose the SVMS kernel memory range is excluded, right?

Yes, it definitly is.

> b) Is there any mechanism to let the user-space process know the valid
> memory range represented by the object handle? E.g., the end of the
> memory addresses

No, not yet, we need to add a way to inform user-space about the valid
memory ranges.

In general there also needs to be a limit on how much user-space can
map, as we need to avoid that user-space just maps everything forever.

There is also a requirement that the COCONUT kernel can not allow
shared/private state changes of pages which are currently mapped to
user-space, so any physmem mapping needs to be temporary.

> CAPABILITIES:
> a) For SEV, VMPL0 is svsm and VM starts from VMPL1, and for TDX, vm-id
> 0 is svsm and VM starts from vm-id 1. From this point of view, looks
> like SEV and TDX are similar. So maybe can use a unified VM index
> bitmap format for them?

Yes, that is the idea. I want to keep the interface as common as
possible between TDX and SEV.

> VM_OPEN:
> a) If one VM index is opened by a user-space process, the same index
> cannot be opened again by another user-space process which guarantees
> that only one process can operate with this VM object handle. But the
> all threads created by this user-space process can operate with this
> VM object handle. Is this a correct understanding?

Yes, this is correct. Though what is missing so far is the ability to
pass object handles to newly created processes. This is important for
device emulations like the TPM or serial port. The MMIO or IOIO object
handles have to be created from the VM object handle, but the handling
of actual MMIO and IOIO events needs to happen in separate processes. So
there needs to be a way for forward handles on EXEC.

> VM_CAPABILITIES:
> a) Should report the VM memory range? Or always assume VM can see the
> entire range supported by the ObjHandle created by OPEN_PHYSMEM?

This depends on how the memory ranges given to specific VMs are going
to be defined. It should probably be up to user-space to assign memory
to a given VM. I need to think more about that.

> MMIO/IOIO_EVENT:
> a) Is there any way to know the length of the mappable area provided
> by the evt_obj? Or the length is some fixed size defined by the kernel
> mode?

I consider these architecturally defined, the MMIO area range is all of
physical memory, the IOIO range is the whole IO port range.

> b) Would like to have a better understanding of the usage. We assume
> that, the MMIO/IOIO range set by the syscalls are monitored by some
> device model thread in the user space. When VM occurs vmexit due to
> MMIO/IOIO accessing, the kernel vcpu thread decodes the MMIO/IOIO
> address and if the address is located 	in the range set by
> these syscalls, the kernel vcpu thread wakes up the monitoring device
> model thread and then waits. The device model thread in the user mode
> will get the address/data via the mappable area and do emulation.
> After the emulation is completed, the device model thread wakes up the
> kernel vcpu thread. If the decoding part is not in the kernel-space
> but in the user-space, then the vcpu should back to the user mode to
> decode instruction and wait to be waked up by the device model thread.
> Is this the expected flow for handling MMIO/IOIO in the user mode?

As I have written above, the device models should run in a separate
process. When the COOCNUT kernel is waked up with an MMIO or IOIO event
from a guest is decodes the instruction and based on the address which
is accessed it will wake up the corresponding device emulation process.

That process then handles the request and updates device and CPU state.
Upon return to kernel mode COCONUT will directly go back into executing
the guest OS.

I think this can be done without or with very minimal involvement of the
main VM management process.

> SET_MEM_STATE:
> a) Any consideration for using paddr + page_size instead of
> start_paddr + end_paddr as the input parameters? Using start_paddr +
> end_paddr may be more efficient to set state for a memory region.

The SET_MEM_STATE input is defined to also suit AMDs use-case. on AMD
the PVALIDATE instruction needs a page-size specified, so there needs to
be a way to pass that information in. This is difficult to do with a
range-based interface.

Also, errors are harder to propagate on a range-based input, as
validation can fail in the middle of a range and user-space needs a
consistent picture of what was validated.

For validating a whole range the BATCH system call can be used to send
as many SET_MEM_STATE requests as needed in one invocation.

> VCPU_CREATE:
> a) Regarding "The VCPU can be run with the WAIT_FOR_EVENT() system
> call",  the expectation is that the WAIT_FOR_EVENT(vcpu_obj) will
> perform vmenter in the kernel mode, is this understanding correct?

Yes, this is correct. I had a RUN system call specified initially, but
found it redundant with the WAIT_FOR_EVENT call in this case.

> GET/SET_STATE:
> a) The type struct VmsaGpa is defined as AMD only. Does this mean the
> user mode should have knowledge about if the platform is SEV or TDX?
> Or there will be a per-architecture user mode VMM executable binary?

My hope is that we can one binary which is mostly common between TDX and
SEV-SNP. The binary has to be aware of the platform as there will always
be platform-specific handling required to some degree, but a lot of the
main handling infrastructure can be common, I think.

> b) For TDX, all the VCPU states are stored in the VMCS. Probably need
> to introduce a new type for TDX to set/get vcpu state:

> 	Type		Data Structure		Description
> 	--------------------------------------------------------------------------------------------------------
> 	VMCS		Struct VmcsField	The VMCS field encoding and the
> 						corresponding data (Intel Only)
> 	Struct VmcsField {
> 		encoding: u32,		// VMCS field encoding
> 		data: u64,		// VMCS field data
> 	}
> 	GET/SET_STATE syscall can be batched so that can set/get multiple VCPU states by one time.

This depends, a lot of state in the VMCS also exists in the VMSA, for
those there will be common state definitions, e.g. for:

	* GPRs
	* FPU/XMM/YMM state
	* Control registers
	* Architectural MSRs (if needed)
	* APIC and IRQ injection state

There are probably some VMCS specific fields which are not covered by
common state abstractions, for those TDX specific state calls are fine.


> 	c) The vLAPIC is emulated in the kernel mode. In this case, is
> 	it necessary to allow user mode get the vLAPIC state? The
> 	potential user case is for the user mode to emulate vCPUID 01
> 	EBX which requires the vLAPIC ID.

It is at least a way needed for device emulation processes to inject an
IRQ into the guest OS. Full APIC access might not be needed, the vLAPIC
ID can also be propagated via a VCPU GET_STATE call or something
similar.

> Possible new syscalls for Class0: to help the user mode to execute some privilege instructions:
> a) The user mode may need to read/write L1's MSR to emulate the vMSR
> for VM, but rdmsr/wrmsr instructions are not allowed in the user mode
> for both SEV and TDX. The RDMSR/WRMSR syscalls can help the user mode
> to achieve this:

Can you elaborate a bit on that? Whic L1 MSRs need to be accessible and
for what reason? In general I do not think it is a good idea to allow
user-space accessing arbitratry MSRs.

> b) The user mode may need to access some MMIO or IO port emulated by
> L0 to emulate certain MMIO/IOIO event for VM. The accessing in user
> mode can be done via MOV/IOIO instructions, but it can trigger #VC/#VE
> from the user mode and requires instruction decoding/emulating. To
> simplify, the MMIO/IOIO accessing can be done via the enlighten way
> (VMGEXIT for SEV and TDCALL for TDX). But for TDX, the TDCALL is
> privileged command which is not allowed in the user mode. So it has to
> be done in the kernel mode. If using the enlighten way for the user
> mode to access MMIO/IOIO is preferred, then new syscalls are necessary
> for TDX. Shall we?

Yes, you are right, a way for user-space to forward request to the host
is currently completely missing.

I wonder what the best way here is, but routing these through user-space
if maybe not the best approach, or do you see cases where user-space
won't forward request unmodified?

Other options would be:

	* Let the COCONUT kernel forward MMIO and IOIO requests for
	  which it has no handler to the host and use the result for
	  emulation
	* Re-inject these events as #VC/#VE execeptions into the guest
	  OS and let it deal with it.

The right approach probably also depends on wether the OS runs in
englightened or paravisor mode.

> Questions for ObjHandle:
> a) Although the ObjHandle seems a common type, a given ObjHandle
> should only be used as an input for specific syscalls. For example,
> the ObjHandle returned by OPEN cannot be used as input for the
> VM_CAPABILITIES. Is this a correct understanding?

Yes, that is correct. The system call design follows an "everything is
an object" model with the system call classes being traits for these
objects. Every object only implements a subset of system call classes.

> b) If a) is true, sounds like for a given ObjHandle, the user should
> know how the ObjHandle is created, otherwise the it is hard to
> distinguish which syscalls can use this ObjHandle as an input?

Yes, user-space knows what type an object handle is of by the way it
created it. VM objects cans only be created by VM_OPEN, VCPU objects
only by VCPU_CREATE, and so on.

(VCPU_CREATE should be renamed to VCPU_OPEN, as VCPUs conceptually
 already exist, I will update the document).

Regards,

	Joerg

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
