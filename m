Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B0A501C5F4B
 for <svsm-devel@coconut-svsm.dev>; Fri, 17 May 2024 21:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1715973842; bh=J7Crj1QNIeK8QjGNMpKjSRCjOYd0KfF9nXq4uixkpfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qt+77uYTuH9Iju/AJGYrr2JQWEWTgnbtg+yQ6REinUitmOS9zxjWx1jcQ2ytOTS0e
 LNGVS7d3EEt4kLnAMkac4MY9ll6nyKsa0h08GUYpryhFxCdXQIWc2cce02E/waclyg
 DebsHPsfMCan4EbeLdPMQmf9lZa/ZpfmmBoka1gIjPcj7YP2/BmledV08TtOpchUtB
 5VNtX/G3Mab8A1BVjNKq9VXPOox8KzFgWL2pxoPRL3yD1YUMRRwc49WbRdamQQCyDZ
 fVNNHbAvn5DMZoS4MskXg7kIXZ+Rm4WpCg0/+XpFfpVEUFe9NJq6nWxjPqwCEnZO5U
 Ac/96sF2Ms0zJFJyYuPqkmhvozYMKAhsFxNMDK8Vm5mXTXTxPGqSQ+drVjxmrVrPHw
 T0y/R85jwFogGURtSsskwuvklF1RVsD+/tg2snjm/6wXeW9fgMhB+VzFPwBQefmODS
 6BtpiKmgSTy1YeWyy3lIOa1xzEN4eQL6cdbA18AX13yGA1hAh+OrQmXpDHpaZxUt7R
 v5MOGiscTRL9O09BPmq+QeWfwmPdU4vCmvtE73foxAXyP/9xy6IaFoLfVapOIpBvn3
 ZX0ovKIWwFY+af9zxf6GLq/Sh9UspGQWqimMmKu8DZNOcXmGJVFcfq11IZ3CU7ASOC
 OASwOB+HfTsJJTQnOJ73fiuc=
Date: Fri, 17 May 2024 21:23:41 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240517192341.GXZkeuvZmXug5gSbH7@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
 <20240508080509.GWZjsyNS0xBXUzKPUG@fat_crate.local>
 <22dc9ceb-4b16-be68-ed8e-c6a222619032@amd.com>
 <20240508195842.GIZjvZcpRz0bdkiPWA@fat_crate.local>
 <d3b59450-fdbd-2813-bbc0-58f9dc2ba817@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d3b59450-fdbd-2813-bbc0-58f9dc2ba817@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 05/15] x86/sev: Use kernel provided SVSM
 Calling Areas
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

On Wed, May 08, 2024 at 03:09:02PM -0500, Tom Lendacky wrote:
> If we're not running at VMPL0 (based on the RMPADJUST check) and if the SVSM
> doesn't advertise a non-zero VMPL value, we will self-terminate. So those
> values are only set if we are not running at VMPL0 and the SVSM has provided
> a non-zero value to us.
> 
> I'm going to turn the function into a bool function so that the call
> becomes:
> 
> 	if (!svsm_setup_caa(cc_info))
> 		return;

Sure, I guess I'm misled by the

	if (bla)
		sev_es_terminate()

which is a function call but I need to read its name to realize that
after that point we're either terminated or we have all the stuff
required to run on a SVSM.

> I do. I think you're missing the RMPADJUST check that causes the function to
> return early if we're running at VMPL0.

Yap.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
