Return-Path: <joro@8bytes.org>
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 258522C198B
 for <svsm-devel@coconut-svsm.dev>; Tue, 17 Dec 2024 17:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1734452626;
 bh=ukrVJ2nkSS+7tuQizpyDAfVhs0m+jggcpVBKAuqg/zA=;
 h=Date:From:To:Subject:From;
 b=fc7W44yYvaEXCuuk1ntHfMxhsUrRlnC9NRsEniuPK2xIsTkkQMe31cGTmsEAAG8Lw
 IZ9QcbO/9fkLW+E/yt1tNnEsCtZk/MZ0UhEgze/Cz56kJBvEKtv3eqcVcjmyHYZiZZ
 eKl3LdjXrT4kBhzMRpqYmWBu35CSlLPppkb30pXBwVQhpTkTzDBblZpt5ynT32CzjQ
 1jV5hvEsBkSGPk+iPn888NfKOniP0XchROjzMUs5Ou49VntMkKaSLfR7zJNIECCTNA
 yl07lbvcrC9N8gK4l+P7gnoH1WJuj+QZsiVNYp3XKsmnMmF2dqKBAyiIdROTSaQeoG
 xu96pjcXa8ljQ==
Date: Tue, 17 Dec 2024 17:23:44 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z2GlkOf63fGpsks2@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] Linux and QEMU branches updated
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

A few weeks ago we discussed the plan to update the Linux and QEMU
development branches for the SVSM to the versions Roy provided.

Today I made this change and updated the `svsm` branches in both
repositories. I also updated the SVSM tree to work with the new KVM
base, which includes updated documentation, launch script, and disabling
one of the unit-tests[1].

So hereby I ask everyone to update their development/test environments
to use the latest Linux, QEMU and SVSM branches from the project.

Why is this important?

There is a PR pending for the SVSM which introduces the use of the TPR
for managing IRQ priorities. This is part of the ongoing work to enable
IRQs in the SVSM and add the ability to send IPIs, which is required to
enable other platforms besides AMD SEV-SNP.

With the old 6.8-based kernel the TPR was shared across VMPLs, which
made the SVSM observe values set by the Linux kernel. This breaks the
SVSM as soon as Linux initialized the local APIC.

Going forward, when the SVSM TPR PR gets merged, the SVSM will no longer
work on the 6.8 kernel, so please everyone make sure to update your
development/test environments and let me know in case you run into any
problems.

Regards,

	Joerg

[1] That test fails now because it relies on an intercept bit no longer
    set.
