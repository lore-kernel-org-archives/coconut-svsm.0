Return-Path: <joro@8bytes.org>
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id C7E1E2C0BE4
 for <svsm-devel@coconut-svsm.dev>; Tue, 19 Nov 2024 12:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1732014687;
 bh=Ljs51hfZXTmLVVAJmMw1cUBgE8GsqNd4WE/NisfDrYM=;
 h=Date:From:To:Subject:From;
 b=ZnwtsquC1ysbQ+qcZatFqX3af8jU4Ecv77vH7ZLbEprnPOeiScCrIGZJ7HVhOoA+r
 3ZZqFEgG4YArBvAf9TP9C6lRBNtaqEQzOCBikCo5kaTFzW3LxAqeGTSmHBGZMlMvgK
 rHIZwcB7nR/FxFoh13glerxgS8EbGNLMrY81VwiDfmx/ElZK6oJ7b7PO7CSJd32kma
 /j+G1vAQ/bZsKK//DHxr7o72z5HqOPW+uN4Q0KpSpgZ+zy+iCLFRF2Z6ffoBAjJTN3
 PQb9aX+JRUfmO3CERX9ubmpXtLe+sXzbvJqili3u/ymYOvqyZy9XKLjt0YVuk+40kZ
 k+UKHFihMWuEA==
Date: Tue, 19 Nov 2024 12:11:26 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZzxyXiduxkAvo2g1@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] Git submodule update required!
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi,

This is a heads-up that I merged two PRs into COCONUT-SVSM which require
everyone to update their git submodules. These PRs were:

	* https://github.com/coconut-svsm/svsm/pull/513
	* https://github.com/coconut-svsm/svsm/pull/514

So when updating to latest HEAD please make sure to update your
submodules as documented in PR #514:

	# clean all generated files to avoid having folders with left-overs
	git clean -xfd
	git submodule foreach --recursive git clean -xfd

	# sync urls and update/init git submodules
	git submodule sync
	git submodule update --init

The libmstpm/ directory might remain after this and can be safely
deleted.

Regards,

	Joerg
