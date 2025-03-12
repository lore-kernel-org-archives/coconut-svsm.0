Return-Path: <joro@8bytes.org>
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 993FB454B4
 for <svsm-devel@coconut-svsm.dev>; Wed, 12 Mar 2025 10:21:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1741771275;
 bh=0yKk5ua4G6T/J3gwTYG2sZh6Y5d7KAgpLaV/lX5QKgA=;
 h=Date:From:To:Subject:From;
 b=BZg+ovwM1O60RrtLJLvJ4MtiqC81eMTZ5tQ3arTbAjOyWyXSIzOGF0bNu4jFk2QWf
 BoJH2tGBsjTJAL4IncnrGQRSBS58yuqbZ3FUDN2swHHuteCHM6YQe6sCxziDpBlYh3
 NbW0OUwiZrh3pr/a0w1sTN1zrs/sF3cYG3CtcRz2vgsxI8urfNg0oOpbBwOcMyd9hp
 LgjpKiswzBeoJEgybFZybSzss3ADw3thKZSTExYqJ6Ous1yphun747tBYmRNcxUj4G
 YUOl4lUwFZQJpnlPMllw8ulozzgarbXUHnJjmDQJxMg6svL3JZk37o+l2+t7UHHXO7
 pV4IRtWJvpF0g==
Date: Wed, 12 Mar 2025 10:21:14 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z9FSCnYWkV0g12R0@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] SVSM Host Kernel KVM Update Required
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

As some of you already noticed there is a regression with the current
SVSM tree, as it does not boot the SVSM-kernel anymore on KVM with
SEV-SNP hardware. The problem was in our host kernel, for which I just
merged a fix. So please update your host environments with the updated
kernel if you experience this problem.

The reason for the breakage was a PR to unconditionally compile in the
shadow-stack code in all builds and do detection at runtime.
Unfortunately this broke on KVM because our SVSM Linux kernel tree does
still intercept all shadow-stack MSRs. So when COCONUT accesses these
MSRs it will cause a #VC exception and the kernel panics.

My fix disables the intercepts of the shadow-stack MSRs in our host
kernel. This is safe because Linux does only implement user
shadow-stacks so far and that state is switched via the FPU load/unload
path.

Regards,

	Joerg
