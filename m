Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1714736242;
 bh=ovvpZtA9Sqmx0FN7EsTrKN/CiL5vmokMEuCX7JrSClo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIAhxCijngJFfXNvrSGwWdLpSsgG3+PHsd91CUqlJofGDSJsuxldCb64LQbl8Fuhf
 Ii47bjitgT+MbR5xyFSHmN/EZ0zIj+XFkEWRwNx2B7qzXMchTxSRaLgoxuwCubuU62
 PR2WV5Kb/0vbR6oi97031EM+r0h6TuMnfrGrBmukpYgPvNkzuVmqZWFm9F9X6RbHr+
 u8wRrcs3wyOS0upwjcV46dvHA8uDILHRu7/fEKJ6HaQ/BVdC0zdzIfCFRBTL3FTw8D
 s9fu0YZCOPOtMUWdL+wbCQMFyt5lIrO2Wmk7BMkI4Tw0fUuE9TYjeDidZ8omAOfy4s
 WuaIuAHuaVmhw==
Date: Fri, 3 May 2024 13:37:20 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZjTMcC7KTP9xRAqk@8bytes.org>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e377d148acac799f6905fc544fbb8bf2ed76e078.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e377d148acac799f6905fc544fbb8bf2ed76e078.1713974291.git.thomas.lendacky@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Dan Williams <dan.j.williams@intel.com>

On Wed, Apr 24, 2024 at 10:58:11AM -0500, Tom Lendacky wrote:
> +static void __init report_vmpl_level(void)
> +{
> +	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
> +		return;
> +
> +	pr_info("SNP running at VMPL%u.\n", vmpl);

Nit: Can this be formated more like "SNP running at VMPL-%u"? That makes
it easier to parse for me when looking into dmesg :)

Regards,

	Joerg
