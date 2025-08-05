Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80E7293C44;
	Tue,  5 Aug 2025 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754412336; cv=none; b=fy1F73dQlzkwF/5l2WNAw27MCehyZl+FL7FI7DzN/s5SdYymnZFaSwh7piHr2640iCggzuk9zwmOPYBbXH46ArJOCZM1rWMsJrJgmpHPBu/sl26XK26cvgsjLsuA6mg++AbTwHM4TrGThiWbdaNeRgGlSVcikenCyS7+vs2ykB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754412336; c=relaxed/simple;
	bh=N3PWdGSeKle1+QoM4Yk/aMVUjJ9fb1CHaUkNyQcQPGQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmrpqhjHHyQ+B6W4LAt4QlCXVLzzx1NafG7WatDVvq80fmX9idUMIVbnQj5e/7CVvXuqYc4ZZg1ExIOrOr46P+MnXsabkL09HlxsBmQ2Iipp5DiEhAbnaSEXvV6WCcnaQOKcOLgP+CWglzj2fGN2kzGeVDoZvObxt6ENEVOxmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=wbm3Ax0t; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="wbm3Ax0t"
Received: from 8bytes.org (p4ffe1b02.dip0.t-ipconnect.de [79.254.27.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0AE1D41ECD;
	Tue,  5 Aug 2025 18:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1754412326;
	bh=N3PWdGSeKle1+QoM4Yk/aMVUjJ9fb1CHaUkNyQcQPGQ=;
	h=Date:From:To:Subject:From;
	b=wbm3Ax0tiIh9M76BNsZPvP6f/MJIqfIk64lP7J9AEcrz5qzC8r+MwKeljaBzvSQDQ
	 IEvmUApEkHgNaK5+pJZjkQQCDNv4MP70mugiIdE3WlChxyy3b9+r0Y0904fN03ElMT
	 Jux9LazOhoXpwfVvcpedlOhKKNtzmHQx3BcLUZCkvVkPJFoCp7EwTkKv7nGk5Tc6OQ
	 x8XFgUFRoGQyqk95/7p9RgsDyEwCUFtBovn+jjhdj0Y2aiePV/1wtyu3xCA+bqErd5
	 oIxJTHsSD6jMPsv+vFvJdgg1g8SHYd79RCuvxBJlLU9eSYsFyFdID8H4CgSSDMGF9H
	 AT2euzMFsTEGg==
Date: Tue, 5 Aug 2025 18:45:24 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 6th, 2025
Message-ID: <ulsznoch6efwoe2kxdbfbzl7pblfwo7ux36b43goz3irucrpgx@wn55u5s6bfsb>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

There are two agenda items currently on the list:

	- Updates from todays TSC meeting
	- Dynamic device discovery for the SVSM

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
