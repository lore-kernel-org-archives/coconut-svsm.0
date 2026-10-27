Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115686;
	b=G9XXYMRnDgaSfTlYX6Wqpza21RxZqCS6m5kL8V6/NPB011BhsNGjKCVXBqA9Yyh5ZQaN
	 og92v/agGrUEzOXtHVkz/ihSlIHOxOBVYbA7731jptPy65R3bCBDzGnsmkdhUdpZvwn6v
	 t7xuDC+hcyGInVsjHGaBNYwvGqANfyIltl8MK3LMAe4NVnk5m81/H5pqYa0pDUSMNAJ2k
	 JTiz+8lVh4UgVpEMNLsR4iztn/tZV6imycCs4FRrvagbwtdx5wU4+AB1Z4XQBtVCHMLl9
	 3xoNy+A4QP9Q9DeYF/VogLmMLW/7M1GSTwK1q9rJWlx8znzzMBn5sipi8bHCmLt4Mww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115686;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=xmi6trzU/nsjJ3ZgFzPKSEwMeexi0/WtDAcZwDJqx3M=;
	b=wepWiFY2DwGWz+HOSIvF/4HV3Le/Bk08xg4W4ud7+QvOYhCQtPP9XBjEcy8++f6IC9hC
	 Q5yFmYg4pD9+RpD2x+1L7iwv6kTnHFx+hgXnIcIWLsYiHu6IAWcfg3+YojPePgQPhtphq
	 e13XbcJA1MaYXAmfuxTky8NkoWxIYrLG0XGGgTLIi5nC+jaLessufZCperFw6K5c++/P5
	 gapG5xJn7GeS/SbUtQ56tN2f1PFaOoNz3u6eCDDlFFBXRzj4+mzts5TZewXyeex/UOu1m
	 zL2aKOKW2cgywN3A3D4fkFeLd2iCVygkG8e+fNSx8JGRxTJFKCC9sKNfPIS0W7q+qcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B402606A31A;
	Tue, 27 Oct 2026 15:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B402606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a007f96e19db8f88024.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:7f96:e19d:b8f8:8024])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 33EB11C7802;
	Tue, 27 Oct 2026 16:41:24 +0100 (CET)
Date: Tue, 27 Oct 2026 16:41:23 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 28th, 2026
Message-ID: <auDFXgVCzNA-AeRk@8bytes.org>
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

Note that the meeting is scheduled in a European timezone which has switched to
winter time already. If you join from a region still on summer time there is an
one-hour offset to the usual meeting time.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
