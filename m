Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 1B31A1C3858
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 21:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717182248; bh=YW1GaQV5pIAH1uLSwH78leJY+IrB5jokOW7hJIKbxXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kqfWhaCODgXkWjfsspGdVtLTBgaqp/loqAh7i7+IX9+30e6WMkkgycspvZNwvDyUq
 epaXel9stfbb+BN1kG63I6flVdCfxdl37gipgcfoKDyYgW/BTp1gTr/gnXji3NqosV
 WLf78hIYBd2D7IQtzFS6F6D/vTyuNsuxPOhMd+ni2XEJUQvQYa0zwC17O5ACP6VRph
 8p+1mxldzI2NOHcypHop6ByPA5WmyPvNlVRREpgIrjfPLPS3qo1fLcy4T5Q3OCzReW
 0u/wnOtASONA5l6KpxBSk0mmjqHlKmA1kNt48QgI6QfXt4EZtkmvecmkMckSLnsT88
 3INtbNS7HpK8T8z6aUvtyelbM6PhCyrc0q/Zxe4cQdVXY3+km1NKZwkoMx44Zy7Yx6
 RgI7OEu53i9Y4ZYNzpH+za3YmrPZq0Ohn4NvEAqPbGj2SBW3F5GdepDN6y/bx9J2m9
 QBAjoRF03mY6kTHRvSl+KYLIvWCrNnO/Yv/LRVKMxeeS+y1Q9/tD43qUZueldll1/D
 USLsyS8pMaob5nLMJ2dHtOA8tfrAasGn4FwkO1qTGxGPyQ+tgvEDeBMQS4fH3XBWtx
 KeaCA7Di9pRIL/lp2Q4lOk+x3hkuMT7c2CQzyFpba6B9yfSZo8+DWDmMOerTFGomZD
 FOr/4GAd9CNu2julsqhE7c3w=
Date: Fri, 31 May 2024 21:03:48 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240531190348.GKZlofFDL4ESfpOQ6O@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
 <20240531125503.GEZlnIp7YobFu7g9iS@fat_crate.local>
 <ad55da28-e5e0-a348-3cbc-d1a80d0ab2bb@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad55da28-e5e0-a348-3cbc-d1a80d0ab2bb@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 10/15] virt: sev-guest: Choose the VMPCK
 key based on executing VMPL
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On Fri, May 31, 2024 at 01:36:06PM -0500, Tom Lendacky wrote:
> The sev-guest driver needs to access it. Given it is a driver/module, I
> created the accessor rather than mark the variable EXPORT_SYMBOL_GPL(). Your
> call, I'm fine with either.

Yeah, if the variable doesn't change after init, then you don't really
need an accessor.

> Yes, the driver can and does figure it out. However, this module parameter
> was added in the off chance the default VMPCK gets wiped. Then you can
> reload the driver and use a different (less privileged) VMPCK.

Is that what the text over snp_disable_vmpck() is alluding to?

Or where are we documenting this intended use?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
