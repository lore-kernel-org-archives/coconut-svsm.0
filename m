Return-Path: <joro@8bytes.org>
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 0661E452D5
 for <svsm-devel@coconut-svsm.dev>; Tue,  1 Apr 2025 17:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1743522653;
 bh=vjj64EJFDkb/lO6OkJb4A53Fp0P46eV1n8IaNg8wwe8=;
 h=Date:From:To:Subject:From;
 b=Rda4YdyqCe7oOKOa38U2r6dqoqVhNSwltDmp+4WoDVmHB/uvt/s6kFpt9TTDkqW4c
 xadoG/fn1rHWPonk+s7EFwWI4ajhW1obVmnomPFfJj5ryATOv7fYJGhrINhSxCsmLu
 +ywwNyeqc224/07fVpvxR66jbr8IIoCfa2GsxH1r3U/Yg5OsxkaAYuNzJjuvz3N9fM
 37lSOOdwiVHK660PjtQg4tOdQRSp7uNpOqfsXS14J8aJDCwfoYkZcPB+YoAJHXnSnA
 YXhkINi3Nj4vtUr17l+SAFwmGnRIaKkifsiq2U+jYm9jGs+j1aj0VLQoq4UQIRmhEK
 9TkiyMPwluC4Q==
Date: Tue, 1 Apr 2025 17:50:51 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z-wLW4qkK2Fict8o@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] QEMU branch updated
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi all,

Just a heads-up that I updated the svsm-igvm branch in our QEMU
repository for the SVSM. This is to fix the ACPI-table read issue and
get rid of the boot splash on Linux.

If you are experiencing this issue, please update QEMU for your SVSM
tests.

Thanks,

	Joerg
