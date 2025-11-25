Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E732D73B8;
	Tue, 25 Nov 2025 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764096041; cv=none; b=RdJo1yXecc2fOvnYjYdf5H5j0SS41X9pzJHrMmocm4Z1KlJwyAB+9qGbe7u32RnWcgqRa/WyakiHdB98KsgApnwwnLkqq1V1PgPpF50UWWqC8ICh3Sg8t6iQnRemVQz9Uv4x824mN28Kcq72GToOpCHLQ1ljxAs5cf966chxrtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764096041; c=relaxed/simple;
	bh=cN9SIyNwo95jy4YmcdSbP/Y0OBBIN+7gklB2u4GoByU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOLAMcMaGA5qEI3j1BlmghuFBqT1EERsXuQ9k7nF8/weOFdio8r0G9oeWVYAmPTa1wF8grTrcXzrJsgH+Tg/dj8ny6eCc3hgvzfew3z+NnwIgT846t5B9firgz+UPnDEhtit6noDZWkEciOiQcRvAXMoD6vM9pK02GkxdGFds5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=uUkrbmRk; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="uUkrbmRk"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 455505AB13;
	Tue, 25 Nov 2025 19:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1764096037;
	bh=cN9SIyNwo95jy4YmcdSbP/Y0OBBIN+7gklB2u4GoByU=;
	h=Date:From:To:Subject:From;
	b=uUkrbmRkZ/aHXpUhUQ16IMY0hrybysrmTmqHcu797dVJH3OY4qoWQt9Iyk9V3aSy8
	 HaE2ck6gb1bKmDyYD68unHTSe9NN9XaOz/6kVLZKDftTxxOOPtGSpEtv7Q9J5H7knd
	 5xk7pKo2E0gIc0IoJ4/6x199MfVmWQUFPD7H9jp4XFoJ0Upz1tOZcB3NOtl6zPpmG2
	 4YBal6aUH+Lhd6QHErSZjA07w2ID8/ACPz/WgIayBCdqBwoa3OrlZhJcAukh74CgSl
	 JKVZ4lSNJTDQBJ+yMyOyOEtck94VIku75TLUCbjCJtN9s12UvCZ6An0PJhaoRtAEwr
	 X2IbVRaD2dSng==
Date: Tue, 25 Nov 2025 19:40:36 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 26th, 2025
Message-ID: <tqu2fjqbhrwsmritqthp7f3qucqljxc3ivxm2wmtdbgdrpt6hm@7qj7ocuwoksw>
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

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
