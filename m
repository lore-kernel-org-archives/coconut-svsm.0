Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E2E6D1C29D7
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 14:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717160118; bh=h5Et4vSVp4DVw+C0adJbFGCQ6V6GUn+XWLm+lVGgBnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OUyqM52dum33Rm4bkKvFV9lT4IMRj5P2NLWy6zTjXV+somuQez7U/iNXj4yGu9+5Z
 QKLIswBH5ncCK/roq29gfqXlpblnYKR+4w3IzICvXJlgdd1udwQt4j5WES8uwaq9A7
 35n6J8MslwWOXlkHXbHJpSyRljZmJprqx8S7ohXHtS+imtVNyU2G9nSlAdn2U/WryH
 GjVsdhMrfa6toXJkT5IZ/C3kvq+FNmOk4c1bcbij8+m+hRQWVg5uGkaggdb5Q56mP6
 cT6X8V6OjNi5ZBuh2A+1A+CiK3Cww8N93/SSLFtTuZkTBlFYfBzB0WgIVTqWJ54i3i
 Rz1IZDKQC0p90Uonjpm17cWhpQoBin+uYYMCUwgsH5u9N31xR8sbQkUJCUBMH/0ccX
 sNZKooRz1SAXICFiE6w6Pgrv1aNrhO1s/iIBm76y20pKXbX5B/DJpUp9pprMjXDeZo
 r8k27UzJpUFmJ/2VF9TA8TZfH6F2RbylTbmOWVQLzLjVGwQPDoUdIjKppi5Lt1//k3
 fe4YKzPawWQtBKC7eBG2cB2oBlG8BjiETj4rtIw/4zQrtm5gIZBUnsltJ5CMl/Ey0c
 rTt9f9XT4oLKZ0I6z1Jn74FJ3c0p2p4LlDov/8kf+UcA8jOfZ27Ij477oqRMvD5r1L
 iLFIl0TfRKO3Q+VyYlXzLkPI=
Date: Fri, 31 May 2024 14:55:03 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240531125503.GEZlnIp7YobFu7g9iS@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
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

On Wed, Apr 24, 2024 at 10:58:06AM -0500, Tom Lendacky wrote:
> +int snp_get_vmpl(void)
> +{
> +	return vmpl;

The vmpl doesn't change after init, right?

If so, you can make that vmpl variable __ro_after_init and drop yet
another parrotting accessor.

> -static u32 vmpck_id;
> -module_param(vmpck_id, uint, 0444);
> +static int vmpck_id = -1;
> +module_param(vmpck_id, int, 0444);
>  MODULE_PARM_DESC(vmpck_id, "The VMPCK ID to use when communicating with the PSP.");

Can the driver figure out the vmpck_id from the kernel directly instead
of having to supply it with a module param?

This is yet another silly module param which you have to go and engineer
into the loading and have to know what you're doing.

If you can automate that, then it is a win-win thing.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
