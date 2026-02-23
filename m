Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A6339B45
	for <coconut-svsm@lists.linux.dev>; Mon, 23 Feb 2026 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869452; cv=none; b=tqu/zVbsgyQ95UTJFgDvx/Z4Q6O/nGnACRFLEsgz+aqtK6MLt2Oah81c9t8zoGlrHu7viUrcu+iMLiPIKBEXBxlGQsuR23b6kn0O4USj75Xcbmj3jb+B3ZmOsUAbAAcK8FtmVbpGa+PcbQdxQ4lVdxLzZBnOPI1dTkPkyS7CxHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869452; c=relaxed/simple;
	bh=wBfYWonwJdsquWKjMLTSX//Tgh7gAAtFNZys6kHj0g4=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=kE1g2R4H0OBc6GAA9em+FpaX7Mc+X7d2TC6DVqcITbS1rcGgGqEAJXgzAHBdF0zK29kW6yWcBeqKx725n15TN6JIi9vKlpUTyxQq+a96Ya7QPIso+RruTk7DgpQ41Vr5M6yTaJSI+PQ44iAb3yvYbDNdb8+6sODPtpreeQncQEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=GlyI0zbZ; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="GlyI0zbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771869434; x=1772128634;
	bh=wBfYWonwJdsquWKjMLTSX//Tgh7gAAtFNZys6kHj0g4=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GlyI0zbZBSYC9J+24oQw/n/mGATp7C5Q5k6XOni4lwdVeRxKH4ilOy7hmc25Qbj94
	 g9uQbbnygfVL2HfD/V8nW/85/JHqCqIYoIS+JHgDUHMY8vzrr5SN4BVXiHizeAMPx+
	 JdXTVHrKh+XCwqbRPuckgtESq/4K5xcragcQiSDzu0FzjCZsGcVfyld0o2XVv5p3K+
	 y0puceBvSvkfjuBswLr86DgStuji08/tcOs8cBaCVQvni0L21HtfOz0Ka+8Ag6QTAV
	 3U1QBYSmsNWI4NyVl+Y5X9q88Bko5fr6+lpYQNFAEdTjomaKPdigstz1PqcJhtTvN6
	 DL7IX9lhJC5CA==
Date: Mon, 23 Feb 2026 17:57:09 +0000
To: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
From: Nihal Kumar <nihalxkumar@protonmail.com>
Subject: Interest in GSoC: Observability Support
Message-ID: <pg5dCu-pV0eEBjz8_xwn59tTQPgv6GFWkYFfCDXKhj0Hs8A8YDyJcAcCy5GmRZUqu1zMK8MtnvOmdWjD7wuDGZ9WPZmgqKwDA6ZN2UsaB2M=@protonmail.com>
Feedback-ID: 68515273:user:proton
X-Pm-Message-ID: d145dc2b9502ca4c60ec51a492953651a646b439
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi team

I am interested in the observability support project mentioned in the GSoC =
ideas list.

Are there any starter issues you would recommend I begin with? I=E2=80=
=99d be happy to start there and familiarize myself with the codebase.

Also, besides the mailing list and weekly meetings, is there an IRC channel=
 or another communication platform where contributors discuss the project?

Thank you for your time and guidance.

Best regards

Nihal
https://www.nihalxkumar.dev/
