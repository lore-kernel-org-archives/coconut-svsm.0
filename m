Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C361096F
	for <coconut-svsm@lists.linux.dev>; Tue, 20 May 2025 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747746877; cv=none; b=TuRJHB0WzqHQOH88PRPslSvH9TNTXHg7J9H869in0RfAjmSFx360QvisNfjxvpndIXq+isSr0m7jpCBjD0hX7hHRKUny7X8Kf92yzDrWYhPyQkTmK9VjkXorCMj1E8RgCJ8dpx7YwK27eF93FT4eO1TOmHe1LJDjz6xKAXYXGpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747746877; c=relaxed/simple;
	bh=UAXpHdhngMRO5G/ZLuxhTlpDlPfuy4whKYG/V9bn7CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IIh97k5YvQ4UF3xg55wAhIfe5o4/UcTOoZDrXTZAScuORW/12LZjdW5Nthk4hOXlP5MPQWA9EAfg6g2d+Ia2K8zLMJz6tJyIggZhuro+2kEZJFWfbnCB0GAelrc1pj1LIHpemqSrCKxBqnuFEt1LMQevwFCMH5U1pRIbS9PUnP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TuLHqv9Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TuLHqv9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747746874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ah3aL+npG5T+wPwu8fC4GO7gSSEfb9ltFb0GukV2D8U=;
	b=TuLHqv9QEuxwg14yo6g9vQgmUAko9XSsIgH3hD+SDU9hc+GgJSVOhi+A59zG95TVcjHGx4
	YHv7dj6o0CtWYe2d1+xY6T5BplR8bnzy9oF5KxuT4jp11YvGR3ikk43UEdwqguc1ZE37vS
	QEZSQympTtSkZz0fKFYSwhIi7tEgDRc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-7VXsQBV6Mdm9sIhcDjpEbQ-1; Tue,
 20 May 2025 09:14:31 -0400
X-MC-Unique: 7VXsQBV6Mdm9sIhcDjpEbQ-1
X-Mimecast-MFC-AGG-ID: 7VXsQBV6Mdm9sIhcDjpEbQ_1747746869
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E41C0180034E;
	Tue, 20 May 2025 13:14:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.155])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42BDD1956096;
	Tue, 20 May 2025 13:14:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A31AF180039F; Tue, 20 May 2025 15:14:25 +0200 (CEST)
Date: Tue, 20 May 2025 15:14:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jon Lange <jlange@microsoft.com>
Cc: Adam Dunlap <acdunlap@google.com>, 
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Subject: Re: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Message-ID: <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
References: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jb8nnG9mIzF5TLQrbRCQiL4x7-JGb6dtuASP04anvSY_1747746869
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 04:07:49PM +0000, Jon Lange wrote:
> Gerd wrote:
> 
> > Well.  Linux relocates the CAA page, and I don't think there is some way for UEFI runtime services to use that.
> > First because UEFI can't figure the address of the Linux CAA page.  And second because linux wouldn't map
> > the CAA page into the efi runtime service sandbox anyway.
> 
> This is why MSR C001_F000 is defined in the SVSM specification (see
> Section 4.2 - Post Boot).  UEFI runtime services can read that MSR,
> which will result in a #VC being delivered to Linux.  The Linux #VC
> handler should resolve the #VC by supplying the address of the CAA
> page.  This will enable UEFI runtime services to obtain the address of
> the Linux CAA page so it can make SVSM calls.
> 
> It seems that Linux would have to map at least the #VC handler into
> the UEFI runtime sandbox because there is the potential for UEFI
> runtime services to cause other #VC exceptions, which must not be
> fatal to the execution of the UEFI runtime.  If Linux must do that,
> then it seems like a small additional step to map the CAA page into
> that sandbox as well.

Thanks for your hints.  Got that mostly working.

Mapping the #vc handler is not needed, I think on exceptions linux
switches to kernel context anyway.  The instruction emulation needed a
fix though so it goes fetch the faulting instruction from efi_mm
context.  Mapping the CAA page into the sandbox (aka efi_mm context) is
needed indeed.  It's done already for the ghcs pages, so I added caa
there.

Now svsm calls from uefi runtime actually land in svsm.  Progress!

Next problem is that svsm reading the caa page seems to fail.  The code
doesn't get past the calling_area.read() call in
get_and_clear_caa_request_flag(), and I have no idea why.  The linux
kernel doing the same thing with the same caa page works just fine.  And
given that svsm uses its own page mapping for the caa page I think it
should not matter whenever the call comes from linux kernel context or
efi_mm context ...

debug log:

[SVSM] ERROR: #VC handling error: Insn(DecodeOpCode)
[SVSM] ERROR: Panic on CPU[0]! COCONUT-SVSM Version: a7c20912+
[SVSM] ERROR: Info: panicked at kernel/src/cpu/idt/svsm.rs:319:13:
Failed to handle #VC from kernel-mode at RIP 0xffffff800021faf8 code: 0x0000000000000404

stack trace:

(gdb) bt ctxt.frame.rsp
#0  0xffffff80001dea39 in svsm::debug::gdbstub::svsm_gdbstub::debug_break () at kernel/src/debug/gdbstub.rs:173
#1  0xffffff8000129d13 in svsm::panic (info=0xfffffe008000b010) at kernel/src/svsm.rs:398
#2  0xffffff80002d65e0 in core::panicking::panic_fmt (fmt=...) at library/core/src/panicking.rs:75
#3  0xffffff8000195ee1 in svsm::cpu::idt::svsm::ex_handler_vmm_communication (ctxt=0xfffffe008000b4f8, vector=29) at kernel/src/cpu/idt/svsm.rs:319
#4  0xffffff80002db9cc in L64 ()
#5  0x0000000000000000 in ?? ()

context:

(gdb) print /x *ctxt
$3 = svsm::cpu::idt::common::X86ExceptionContext {ssp: 0x0, _padding: [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 
    0x0], regs: svsm::cpu::registers::X86GeneralRegs {r15: 0x0, r14: 0x0, r13: 0x0, r12: 0x0, r11: 0xfffffe008000bc90, r10: 0x8, r9: 0x40, r8: 0x1, rbp: 0xfffffe008000b610, rdi: 0xfffffe008000b670, rsi: 0xffffff0000002000, rdx: 0xfffffe008000b670, rcx: 0x8, rbx: 0x0, rax: 0xfffffe008000b698}, error_code: 0x404, frame: svsm::cpu::registers::X86InterruptFrame {rip: 0xffffff800021faf8, cs: 0x8, flags: 0x10096, rsp: 0xfffffe008000b5b8, ss: 0x0}}

exception raised here:

(gdb) disas ctxt.frame.rip
Dump of assembler code for function _ZN4svsm2mm8guestmem10copy_bytes17hb74ce3bae1bdb91fE:
   0xffffff800021fad0 <+0>:     push   %rbp
   0xffffff800021fad1 <+1>:     mov    %rsp,%rbp
   0xffffff800021fad4 <+4>:     sub    $0x58,%rsp
   0xffffff800021fad8 <+8>:     mov    %rdx,-0x58(%rbp)
   0xffffff800021fadc <+12>:    mov    %rdi,%rax
   0xffffff800021fadf <+15>:    mov    -0x58(%rbp),%rdi
   0xffffff800021fae3 <+19>:    mov    %rax,-0x50(%rbp)
   0xffffff800021fae7 <+23>:    mov    %rax,-0x48(%rbp)
   0xffffff800021faeb <+27>:    mov    %rsi,-0x18(%rbp)
   0xffffff800021faef <+31>:    mov    %rdi,-0x10(%rbp)
   0xffffff800021faf3 <+35>:    mov    %rcx,-0x8(%rbp)
   0xffffff800021faf7 <+39>:    cld
   0xffffff800021faf8 <+40>:    rep movsb %ds:(%rsi),%es:(%rdi)

take care,
  Gerd

