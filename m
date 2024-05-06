Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BAE931C0B67
 for <svsm-devel@coconut-svsm.dev>; Mon,  6 May 2024 09:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714981441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QB7X6b8uZ129mfCOeXo2JK4nhvfmoN+Tgyx+uJLesB0=;
 b=LxseSu9tNynavL8G6eU1ywrNTJ/WGNepkH2nPFBJViNaeQKr9lUzrpQmLARbxmG4kAroAJ
 3vSgqRKPWquUBjIC04ZNZSIP7ZL7FV7TOVfMk0fqK3s5G11eSyXqAikx8VRaJ7cpSnsPhA
 HkOjbefBaqvugvqIhF0sqK3X0gX8phk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714981441;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QB7X6b8uZ129mfCOeXo2JK4nhvfmoN+Tgyx+uJLesB0=;
 b=RciozrXGAx66sR2lNyVMX4NKFI+ZQAA82jTVhmhDUO8DzBfTAv0JEOcZEjSPeRRBSz/Wt+
 MbcJsNJduqWj/mBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714981441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QB7X6b8uZ129mfCOeXo2JK4nhvfmoN+Tgyx+uJLesB0=;
 b=LxseSu9tNynavL8G6eU1ywrNTJ/WGNepkH2nPFBJViNaeQKr9lUzrpQmLARbxmG4kAroAJ
 3vSgqRKPWquUBjIC04ZNZSIP7ZL7FV7TOVfMk0fqK3s5G11eSyXqAikx8VRaJ7cpSnsPhA
 HkOjbefBaqvugvqIhF0sqK3X0gX8phk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714981441;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QB7X6b8uZ129mfCOeXo2JK4nhvfmoN+Tgyx+uJLesB0=;
 b=RciozrXGAx66sR2lNyVMX4NKFI+ZQAA82jTVhmhDUO8DzBfTAv0JEOcZEjSPeRRBSz/Wt+
 MbcJsNJduqWj/mBA==
Date: Mon, 6 May 2024 09:43:59 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZjiKP4Z6nBbvOEQB@suse.de>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e377d148acac799f6905fc544fbb8bf2ed76e078.1713974291.git.thomas.lendacky@amd.com>
 <ZjTMcC7KTP9xRAqk@8bytes.org>
 <20240503160419.GAZjULA7HhinTfCWZ6@fat_crate.local>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503160419.GAZjULA7HhinTfCWZ6@fat_crate.local>
Subject: Re: [svsm-devel] [PATCH v4 15/15] x86/sev: Allow non-VMPL0
 execution when an SVSM is present
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Borislav Petkov <bp@alien8.de>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Dan Williams <dan.j.williams@intel.com>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

On Fri, May 03, 2024 at 06:04:19PM +0200, Borislav Petkov wrote:
> On Fri, May 03, 2024 at 01:37:20PM +0200, Jörg Rödel wrote:
> > Nit: Can this be formated more like "SNP running at VMPL-%u"? That makes
> > it easier to parse for me when looking into dmesg :)
> 
> Hmm, except that all documentation is without a "-"... The APM talks
> about VMPL%d everywhere...

No strict opinion, I just wanted to point out that there are more
readable ways of printing the VMPL level than what is used in the APM.

Regards,

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
