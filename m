Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 2134A1C0BE3
 for <svsm-devel@coconut-svsm.dev>; Fri,  3 May 2024 18:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1714752279; bh=kgK1Sd7njMaUz6Vs0JsFM7PKN9JL8A16q9TsB9gAF+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bs/uce9rl1p2FswYSj8iEK9JU5VIYnzElPuhETDzrricDQ3pQqqQYLRUGevF4Z8zS
 HMcLKq3R2HUhGPrzQejgUqNqEnGkzY5nI2LoO8Cv7HCBJRCMVxZmd7oY3Z786HvE65
 Q5upDmSaEEFjqnitdtIbYIpeHNWeS1QEdtwJdYmwx4pAPTw2/bevH5r7GZtV3z9p7b
 fi7FhPleZWWI9JAyaj9uvxcQxRAvN5rCR3zyFWi4tQfsq+61+52uwX4pvqNUfZUwz/
 khwrjMNNM5niNRo/CloD4K4aBOUML8EnrRKkMtQcZV2o8MXTv4LBOv0xBDEop0Flgo
 LbG6PW6YmIyj2QjFC/e9kT9m5d/CwV69sqyra+8r+x1KadkpgxXvR2WD2ymWm7mzen
 GK0oNH3djcmOSMJ8Gsuf0vEGY4tDgKjjabdqnQ5e6AwIjAL+IHEqGHqlLX2l63h0vi
 k1DY/CFJojQ7wmX6NQhpfkLjipgBlQ6qG8pdkRZYU6MGl1CFXRBTu3UtrEGpZfV59x
 Acyj9fs12a02CmaUapVtc0Zif8alECfRpNsRWBJckEBYX3WB36orm6l4+KUn3YlXhR
 JRxYRECbxHGkVgI1/R4I5mvvgia0VDtTKppA3lWIT4TbmIJyzYvtLMrJHbqVA8CI5n
 YDZL0crKE9IkLhg73GkMq5Vc=
Date: Fri, 3 May 2024 18:04:19 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240503160419.GAZjULA7HhinTfCWZ6@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e377d148acac799f6905fc544fbb8bf2ed76e078.1713974291.git.thomas.lendacky@amd.com>
 <ZjTMcC7KTP9xRAqk@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZjTMcC7KTP9xRAqk@8bytes.org>
Content-Transfer-Encoding: quoted-printable
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
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Dan Williams <dan.j.williams@intel.com>

On Fri, May 03, 2024 at 01:37:20PM +0200, J=C3=B6rg R=C3=B6del wrote:
> Nit: Can this be formated more like "SNP running at VMPL-%u"? That make=
s
> it easier to parse for me when looking into dmesg :)

Hmm, except that all documentation is without a "-"... The APM talks
about VMPL%d everywhere...

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
