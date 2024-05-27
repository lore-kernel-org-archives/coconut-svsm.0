Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A3A4D1C6EDD
 for <svsm-devel@coconut-svsm.dev>; Mon, 27 May 2024 15:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1716817883; bh=+od7caDLEPXz4QA7OiR3Y4qE0Xp9CTT3BbEYpXhsbzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PDOWOD46MaTked/eyXcWeCGd9lUl6+OwvmUj15L2UV3K//S2TEtmWvb+2f8hij7oe
 ARCtWuTYwKadOfNLq2eL0puJ/RhDQMC+8mk8kt0gLEF5dqE5SkV7QHiDGlbxQbsXHv
 r2rz0jj47TJ1gb7LunkbPQxVq0hytMTVAese3XvFH1S+AfSDf0GcVBW7fHpgHIi4Dt
 SWkmmoqKrih7i/F6xhY/2PNiHQPTYq30OO0or2O70YfXFlAk8uEakTPyCdOKD7BEDZ
 oNrFdjiXdtU39XSNDyJJAoHvTbvucvC0zzmYDfbvMphsDjbaYmusWHz2q3l1csbFFg
 ejKaZiqzCkfreZXP9A1GkSqUhAjcQGihZ4ak13S9jAy+xkiOsG9naawfM33L+UW8B5
 seggOrBBpRQM4SDkVpgxmAfY8sZOIa4pr+/SF2OIkEoaSqN6l/ojbYWOrqfZw+QA9Q
 whhEHr3lpSwIHLj+NbR6f/SePqkBBOJgERWyfYsW7g3W4mTeUArHMMPN+NGhHnX0UU
 nYu9xPFO4+WIJJoMVRqDVyZHx4J7WWqCkN6vHbTJivy/7oX/sEY6i/0mjiExwsKuRw
 MS+mKGQZKk94ykDf0bV5Fiirz3gGxeWLjFot9m8u6wBjz/QQqn/PH9IT7c+8D/cW/3
 /Nw85SErsxXvvEjQ8/pejOZ8=
Date: Mon, 27 May 2024 15:51:01 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240527135101.GBZlSPxQ6iBSlMDefY@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <435f78e07c76e25d2d857138724098bc2a729b0a.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <435f78e07c76e25d2d857138724098bc2a729b0a.1713974291.git.thomas.lendacky@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 09/15] x86/sev: Provide guest VMPL level
 to userspace
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

On Wed, Apr 24, 2024 at 10:58:05AM -0500, Tom Lendacky wrote:
> Requesting an attestation report from userspace involves providing the
> VMPL level for the report. Currently any value from 0-3 is valid because
> Linux enforces running at VMPL0.
> 
> When an SVSM is present, though, Linux will not be running at VMPL0 and
> only VMPL values starting at the VMPL level Linux is running at to 3 are
> valid. In order to allow userspace to determine the minimum VMPL value
> that can be supplied to an attestation report, create a sysfs entry that
> can be used to retrieve the current VMPL level of Linux.

So what is the use case here: you create the attestation report *on* the
running guest and as part of that, the script which does that should do

cat /sys/.../sev/vmpl

?

But then sev-guest does some VMPL including into some report:

struct snp_report_req {
        /* user data that should be included in the report */
        __u8 user_data[SNP_REPORT_USER_DATA_SIZE];

        /* The vmpl level to be included in the report */
        __u32 vmpl;

Why do you need this and can't use sev-guest?

> +static int __init sev_sysfs_init(void)
> +{
> +	struct kobject *sev_kobj;
> +	int ret;
> +
> +	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
> +		return -ENODEV;
> +
> +	sev_kobj = kobject_create_and_add("sev", kernel_kobj);

In the main hierarchy?!

This is a x86 CPU thing, so if anything, it should be under
/sys/devices/system/cpu/

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
