Return-Path: <tleroy@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E7CBB1C9974
 for <svsm-devel@coconut-svsm.dev>; Tue, 30 Apr 2024 11:56:14 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 329E833F3E
 for <svsm-devel@coconut-svsm.dev>; Tue, 30 Apr 2024 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714470974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=HrCCAVI4ypRQjmhHxHvEPLo1UMUviNL2E88HLkxPy+4=;
 b=K4MOu5ce8TxOUIElG6vWvw2GPQCOvch1cigs0TWlFTfxOM6puDW82QDdZf0Yn0XPW3mZw5
 5HAHraaJ32go27tze5hEs/5XpmUKuH5/6dPOPif6hUV/NVtJ3afG8mi3xLKVq+t4kZ0AGd
 EfxvDyqUA4qEdyB4uJPXFtXJGzgtz9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714470974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=HrCCAVI4ypRQjmhHxHvEPLo1UMUviNL2E88HLkxPy+4=;
 b=Oscy6EnP1xSczgFpQid5o0Dd+824AplE2rSxv+dcZq5nq6cz/61jotBuc651dF2ghnJzVj
 5YiO6SBMGKTOwJAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714470974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=HrCCAVI4ypRQjmhHxHvEPLo1UMUviNL2E88HLkxPy+4=;
 b=K4MOu5ce8TxOUIElG6vWvw2GPQCOvch1cigs0TWlFTfxOM6puDW82QDdZf0Yn0XPW3mZw5
 5HAHraaJ32go27tze5hEs/5XpmUKuH5/6dPOPif6hUV/NVtJ3afG8mi3xLKVq+t4kZ0AGd
 EfxvDyqUA4qEdyB4uJPXFtXJGzgtz9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714470974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=HrCCAVI4ypRQjmhHxHvEPLo1UMUviNL2E88HLkxPy+4=;
 b=Oscy6EnP1xSczgFpQid5o0Dd+824AplE2rSxv+dcZq5nq6cz/61jotBuc651dF2ghnJzVj
 5YiO6SBMGKTOwJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E38D133A7
 for <svsm-devel@coconut-svsm.dev>; Tue, 30 Apr 2024 09:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fb6CBT7AMGYwaAAAD6G6ig
 (envelope-from <tleroy@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Tue, 30 Apr 2024 09:56:14 +0000
Message-ID: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
Date: Tue, 30 Apr 2024 11:56:09 +0200
MIME-Version: 1.0
Content-Language: en-US
From: Thomas Leroy <tleroy@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: [svsm-devel] x86 decoder further steps
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi everyone,

As you may know, the current #VC handler uses a naive x86 instruction
decoder
that is used to find the appropriate NAE event handler to call.

As I said, the current decoder is very naive and does only byte matching to
identify cpuid, in/out{bwl}, rdmsr/wrmsr, and rdtsc{p} instructions [0].
Since we currently don't support all NAE events in the #VC handler, we have
to find a clean way to decode the remaining NAEs.

If the decoder's only use is for the #VC handler, I guess we can stick
to what
we currently do. It shouldn't be too hard to match the remaining NAE
instructions
in the decoder. However, if we need a complete instruction decoder
somewhere,
we'll have to decide if we write our own or if we use an existing one.
I'm not aware of the full SVSM development plan, so I don't really know the
possible other uses of the decoder.

As you may also noticed, the instruction decoder is an attack surface
since it
deals with untrusted raw bytes. For this reason, we should make it as small
(and secure of course) as possible. So if we finally need a complete
decoder,
we'll have to choose between write our own, which will be time consuming and
could introduce security bugs (especially when #VC exceptions will be raised
from a less privileged context), or rely on a third-party one (that we
shouldn't consider prefect security-wise).

What's your opinion between these solutions?

I recently discovered the iced-x86 [1] crate looks easy to incorporate
to the
SVSM project, and supports no_std, so I think it would be a candidate.
Finally, if we go for a third-party one, a security audit of the chosen
decoder would be needed, at least a fuzzing campaign (I could take care
of it).

Cheers,
Thomas

[0]
https://github.com/coconut-svsm/svsm/blob/104ca723cdd6a272f40c31548dd6c05010494c84/kernel/src/cpu/insn.rs#L110

[1] https://docs.rs/iced-x86/latest/iced_x86/

-- 
Thomas Leroy
Security Engineer
SUSE Software Solutions

