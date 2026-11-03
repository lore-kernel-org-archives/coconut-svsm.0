Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721413;
	b=RKOyWVeAIamAij9LMs87kDBi3e35idwqOPXw7akZnQBUjnw2y20DOocMUpiqbgSXw1St
	 /g30508cxMpJQYVPTQ54Nu6g7Nl8OsafHuiT7zDpCEFNijZqIqKxTDF3xT06JIdL1zAkw
	 YXF1ddPpij+fGcyBpGx4yH+IdfDk7pfHjENnTCUNMUQTqTI7TYD1OoEFUFofpa1YyzUei
	 CHJ4P1lk+WYNWv8kW2cjewJVbtAIYb9WwDhnrungULo6WRj9Di6Ua/mMpZ259haimtUCC
	 aPBS7uGKGL7qDcJGD0TCsFcNPXfxqqqHyqUgAhLGyGN1olPljAvzISIj5Nu85ZmkbQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721413;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=/mulPRNFc9Mmg69CBN6d9UVIGfFOhz5cNKUfRieNWJg=;
	b=jjB7D4PtGMPSfOLCGH0M4qCzge9e5Xb3oNsIaqVOyPzrBGZc5nGO9oQnkeS0NBWb5LD4
	 Tnj14Mmt+xp5cq0mNQx1iiMqlY8MqF7Pj3G5CcH53OelEhTpB6JtBHPNixZFLHjS8DP/q
	 apgtY7nSFO9kv8Zvu09sZl8r+5NAbVdnOJRlCzQLJ6toSsLevrhXD/U7cn1Vcjv9WNIZy
	 7P/5lBkHBLrTUkg5m90twLZbXee+lN6wNUB7JQD/HrD5PGoVUKCU8KAs/LVuwWJ8AGXYi
	 cIliqBQ+E1ZK7/ibvBF/j1OqoSomKi3aS0LBaBLRNc5P/B6YDbHBSvD3QWF/oaZJgAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DFC606A33A;
	Tue,  3 Nov 2026 15:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36DFC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a008b3f53badec87ea0.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:8b3f:53ba:dec8:7ea0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B9D18242B95;
	Tue,  3 Nov 2026 16:56:44 +0100 (CET)
Date: Tue, 3 Nov 2026 16:56:43 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 4th, 2026
Message-ID: <auoEI5wICyOXh-gH@8bytes.org>
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

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
