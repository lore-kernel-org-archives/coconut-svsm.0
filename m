Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 21D1E1C9B35
 for <svsm-devel@coconut-svsm.dev>; Tue, 30 Apr 2024 16:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714487979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIK4ocuBRILh9KahJfUdgioVjqw/H3ZOwohd98UTmV8=;
 b=TfiOpgeOuTElmpwm2aaP1G2Lw4oslcmdWNgqK0GOZvpIr8PtCIXdHzksGHI3b9wJjODvmV
 /Z7hmEPQDlk6dmcDYkTXPsOfsFHiWlEQthvcraY4qu+xuLhjET3gqW0WzpC9JYHB4rfajf
 9lnbz0SB8MwpwYLASR1qq8yAB7Nl2tg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714487979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIK4ocuBRILh9KahJfUdgioVjqw/H3ZOwohd98UTmV8=;
 b=sSOkLClVSDEv7f+fCjUYpXTTjvySKNZN2u4x0uZ16+eGWH+hrN7KxzHu2WpYWIdrBacBxJ
 Z61Dz1uELEax8zBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714487979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIK4ocuBRILh9KahJfUdgioVjqw/H3ZOwohd98UTmV8=;
 b=TfiOpgeOuTElmpwm2aaP1G2Lw4oslcmdWNgqK0GOZvpIr8PtCIXdHzksGHI3b9wJjODvmV
 /Z7hmEPQDlk6dmcDYkTXPsOfsFHiWlEQthvcraY4qu+xuLhjET3gqW0WzpC9JYHB4rfajf
 9lnbz0SB8MwpwYLASR1qq8yAB7Nl2tg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714487979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIK4ocuBRILh9KahJfUdgioVjqw/H3ZOwohd98UTmV8=;
 b=sSOkLClVSDEv7f+fCjUYpXTTjvySKNZN2u4x0uZ16+eGWH+hrN7KxzHu2WpYWIdrBacBxJ
 Z61Dz1uELEax8zBw==
Message-ID: <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
Date: Tue, 30 Apr 2024 16:39:13 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] x86 decoder further steps
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Thomas Leroy <tleroy@suse.de>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"


Hi,

On 30/4/24 11:56, Thomas Leroy wrote:
> Hi everyone,
> 
> As you may know, the current #VC handler uses a naive x86 instruction
> decoder
> that is used to find the appropriate NAE event handler to call.
> 
> As I said, the current decoder is very naive and does only byte matching to
> identify cpuid, in/out{bwl}, rdmsr/wrmsr, and rdtsc{p} instructions [0].
> Since we currently don't support all NAE events in the #VC handler, we have
> to find a clean way to decode the remaining NAEs.

Yes, it will require at least a small rework to handle instruction
prefixes (namely REP).

> If the decoder's only use is for the #VC handler, I guess we can stick
> to what
> we currently do. It shouldn't be too hard to match the remaining NAE
> instructions
> in the decoder. However, if we need a complete instruction decoder
> somewhere,
> we'll have to decide if we write our own or if we use an existing one.
> I'm not aware of the full SVSM development plan, so I don't really know the
> possible other uses of the decoder.
> 
> As you may also noticed, the instruction decoder is an attack surface
> since it
> deals with untrusted raw bytes. For this reason, we should make it as small
> (and secure of course) as possible. So if we finally need a complete
> decoder,
> we'll have to choose between write our own, which will be time consuming and
> could introduce security bugs (especially when #VC exceptions will be raised
> from a less privileged context), or rely on a third-party one (that we
> shouldn't consider prefect security-wise).
> 
> What's your opinion between these solutions?
> 
> I recently discovered the iced-x86 [1] crate looks easy to incorporate
> to the
> SVSM project, and supports no_std, so I think it would be a candidate.
> Finally, if we go for a third-party one, a security audit of the chosen
> decoder would be needed, at least a fuzzing campaign (I could take care
> of it).

I haven't attempted to the decode the remaining instructions, but other
than the prefix issue I mentioned above I don't think we need much more.
On the other hand, iced-x86 has a lot of features that can be disabled,
since we only want instruction decoding, so we wouldn't be importing
that much code. The project also already has fuzzing, so I assume it's
well tested overall.

> Cheers,
> Thomas
> 
> [0]
> https://github.com/coconut-svsm/svsm/blob/104ca723cdd6a272f40c31548dd6c05010494c84/kernel/src/cpu/insn.rs#L110
> 
> [1] https://docs.rs/iced-x86/latest/iced_x86/
> 

-- 
Carlos López
Security Engineer
SUSE Software Solutions
