Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E75534EF0E;
	Tue, 13 Jan 2026 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329026; cv=none; b=gE1ghbccuYstI7wZ9weO2mq57Tqyuz1InA3zAj9SqUYkLNPQ/2yz2EtXHc9QMMc8rz4bWzr78p3qt7/QDX+SnCXMni0Z7N+o8lqAK0d4N81pGFXakn2BDeXXzUTMPsXY1GJjKgZ/KTHWSJsRhHyzeulL9K9532FJ3sdzVaGRfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329026; c=relaxed/simple;
	bh=u77tNS3mrF/1vwG7GysDuUx7UXK+WIHR3tcsTg0U+eg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hvdCn18Z2+5GsE1ZxCAuIzqqLXi9UamdXv+AtNz/+N4dSWwsVtMkZzwgCXCJyBS7d717f0CwVHKsxUYvjJbbWPZTceFyFQTMazohEwaIcOuQ/zHvlclvcKGQi7UbcmWFQhvSiGACOCS3tTNmaCHmrhDXep80ZubA80tBweYs+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=tPUEkyOT; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="tPUEkyOT"
Received: from 8bytes.org (p200300f6af1d96008373e8771b57f536.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:8373:e877:1b57:f536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1AA565DCA0;
	Tue, 13 Jan 2026 19:30:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768329018;
	bh=u77tNS3mrF/1vwG7GysDuUx7UXK+WIHR3tcsTg0U+eg=;
	h=Date:From:To:Subject:From;
	b=tPUEkyOTObGWj1UWqpXjKEXM8WanwSxgoe+Y7z2QByAIgyHb52BJ1Y4WeP5LEjNGf
	 vOrzKMpy6UnW2KX747+cI71pME4bKH6mPlU33WbyeOPyksdGcAzoQ+KKYpN44gnBSd
	 KRxor/XFIPGyx6T0XSj0ZrGWLX50NSyJmuQJZ/i6fsL/Q02db0XMQ3DKwHcbXJcRT0
	 yApCdlwGbCHRDXbDpYsUjkf11BIT2bNPEp3BVWSnX9S74k8ZUNNMQTqEsH0445XZVz
	 9nbzZxh1q3sdvFYSn25lM6VbtzR5oafypJ1gXk91yPJ3GgU3lCrH98n8TIiJWAdvFu
	 m0Lggq9dhNaCQ==
Date: Tue, 13 Jan 2026 19:30:16 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call January 14, 2026
Message-ID: <tlhepq4dp47rbq3vpzm4qtf65t62fqe26tk736sd3ulcbwcefy@btzt3fsapu5e>
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

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

Stefano will run the meeting tomorrow (Thanks again!) as I can not attend due
to travel.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
