Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1714736304;
 bh=rBI030nnjBaGuDp119mQ6rF4+O/VVsNKdIq/NQwkRf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=4cuJ8QfQOgGOa4WUzUJMVUE9bxrwxLie0fgcNzaEjt7JoBadWwPunovk+QEXETfZh
 bbOpG6oIKAByFvKq7eq2XgjBauhWYYNwinBbuzl3qHnhCeGW3JMDmLIwTDUB9El+Er
 HYnX+PkEsL/UVx9vpYV4M9SBf91X+pFpqn+g625CQbuKrRralVXzcUeQNK0fYdQtzG
 CQPqEJbLT5Qk4Q+KDTVadwqZeku0/zRwpgit0O/iyA+ZfbgpIq/XDKS2J1k94J8Y2U
 lesfpgcHMN71yeWJXDpt/kmMPgdvmzwXCZdBzN1ZQtD8Q22SPJ0nsPDrGvq5Fo2aWI
 DSSurMAzOMRvA==
Date: Fri, 3 May 2024 13:38:23 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZjTMr8CAA3STRlDR@8bytes.org>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1713974291.git.thomas.lendacky@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 00/15] Provide SEV-SNP support for
 running under an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Joel Becker <jlbec@evilplan.org>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Dan Williams <dan.j.williams@intel.com>

On Wed, Apr 24, 2024 at 10:57:56AM -0500, Tom Lendacky wrote:
> Tom Lendacky (15):
>   x86/sev: Shorten snp_secrets_page_layout to snp_secrets_page
>   x86/sev: Rename snp_init() in the boot/compressed/sev.c file
>   x86/sev: Make the VMPL0 checking more straight forward
>   x86/sev: Check for the presence of an SVSM in the SNP Secrets page
>   x86/sev: Use kernel provided SVSM Calling Areas
>   x86/sev: Perform PVALIDATE using the SVSM when not at VMPL0
>   x86/sev: Use the SVSM to create a vCPU when not in VMPL0
>   x86/sev: Provide SVSM discovery support
>   x86/sev: Provide guest VMPL level to userspace
>   virt: sev-guest: Choose the VMPCK key based on executing VMPL
>   configfs-tsm: Allow the privlevel_floor attribute to be updated
>   fs/configfs: Add a callback to determine attribute visibility
>   x86/sev: Take advantage of configfs visibility support in TSM
>   x86/sev: Extend the config-fs attestation support for an SVSM
>   x86/sev: Allow non-VMPL0 execution when an SVSM is present

I tested these on latest COCONUT-SVSM upstream and found no issues.

Tested-by: Joerg Roedel <jroedel@suse.de>
