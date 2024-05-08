Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BADA71C3CBA
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 May 2024 21:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1715198343; bh=cB29kPgrgp/EHkOIaR8NmXBF5c9yJWY6ZPaSBSvAyKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TkagnrbHvAS4obffxl2FYnl0s2IZaB0jr/Cc0c4BZA0/nZW6dzopBlpEJnV1go638
 Px7vcCLzAugoD47seDdLMaG4yrDgEH/IYUOa4zamwXm6nUeqRDvu8pfNDPB964BK9f
 Rt17cH7LcCaPWslEAvnS9Ahr27TQhFzZhuO+GHFawC7I2eNFoEOrXqFxraICCpcAvW
 5/iurBm5wNspcVVayG3UL+oaPB6zIzH2eQ2/g7+YsSYEJsLfaRYbD3eX1iUXQYsl5F
 0EQmj9DcPR/4wdX69E6+jihMJX94zs3Cott1ipDSgAJdplduweCot+H4fBecdBT1q8
 4UC7xDWb3+9mO4S2jVXqtImQB8euKZKoF/pmgcDNhEXX9ZbNlzmKBIDl0eYqsiBvPF
 XGOfXT0uVXzub5PMxtwxE9hvxuP+jEDrwZKEy3CpVhSNK5zhWYd2gAjV4aZ9XyFngg
 uUzLxeVO8ZMq6qTtJSguUzkkCgQwkIdS6byvmy8wwXTD1Nw5DqutQTjRRMt4pZPcjV
 JNqN0DZk4nSWls3xruWQ1fBf+jxg0f5rBYVuusguPqWPS2Ii/MFc6/VACMgOKtvYkm
 H4W4vuFuBzYdnJV8G6wYXIRmh5mGsOrOUCqj7CD2gV7OgHI5+IImcA19E0B5vVvnO9
 e3//2//lLgGhJJ+5P4t8O69Y=
Date: Wed, 8 May 2024 21:58:42 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240508195842.GIZjvZcpRz0bdkiPWA@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
 <20240508080509.GWZjsyNS0xBXUzKPUG@fat_crate.local>
 <22dc9ceb-4b16-be68-ed8e-c6a222619032@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22dc9ceb-4b16-be68-ed8e-c6a222619032@amd.com>
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

On Wed, May 08, 2024 at 02:13:17PM -0500, Tom Lendacky wrote:
> ok, maybe __perform_svsm_msr_protocol or such.

We'll bikeshed it in the coming weeks.

> There's quite a bit of interaction so I'll make sure to prefix everything.

Ack.

> The paravirt versions of local_irq_save and local_irq_restore can't be used
> as early as this routine is called.

tglx says you should do native_local_irq_save()/.._restore() helpers
just like the arch_local_irq_save()/..._restore() ones but use only
native_ functions without the paravirt gunk.

In a prepatch pls.

> > > +	struct svsm_call call = {};
> > > +	int ret;
> > > +	u64 pa;
> > > +
> > > +	/*
> > > +	 * Record the SVSM Calling Area address (CAA) if the guest is not
> > > +	 * running at VMPL0. The CA will be used to communicate with the
> > > +	 * SVSM to perform the SVSM services.
> > > +	 */
> > > +	setup_svsm_ca(cc_info);
> > > +
> > > +	/* Nothing to do if not running under an SVSM. */
> > > +	if (!vmpl)
> > > +		return;
> > 
> > You set up stuff above and now you bail out?
> 
> setup_svsm_ca() is what sets the vmpl variable. So nothing will have been
> setup if the VMPL is zero, in which case we don't continue on.

You still assign

        /*
         * The CA is identity mapped when this routine is called, both by the
         * decompressor code and the early kernel code.
         */
        boot_svsm_caa = (struct svsm_ca *)caa;
        boot_svsm_caa_pa = caa;

regardless of vmpl.

I think you should assign those only when vmpl != 0.

Otherwise the code is confusing.

> > Judging by setup_svsm_ca() you don't really need that vmpl var but you
> > can check
> > 
> > 	if (!boot_svsm_caa)
> > 		return;
> > 
> > to determine whether a SVSM was detected.
> 
> Yes, but the vmpl var will be used for attestation requests, sysfs, etc.

I guess that comes later in the patchset...

> > Huh, setup_svsm_ca() already assigned those...
> 
> setup_svsm_ca() assigned the ones from the secrets page. The kernel now
> switches to using its own CA.

Comment pls.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
