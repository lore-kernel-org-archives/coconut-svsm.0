Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7EF399344;
	Tue, 31 Mar 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974140; cv=none; b=FVArzwOB1Pq31UnexQzg0MztpJDdU0MbmtSoIdvf5ftNjlRGdZtKudpezFeBfbkDZCG45KOz+3YEkVJLRitZeYcjkS2gaYxRd9Pd3qFO6WHWe0gIn/pm79JzbWGAqEtroY43GJlA2IqjN6sh5PU6uJO4gU3LN/O7MNyneGpKT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974140; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TiLUs6DOEGuOO1Vkf/VyoD7v8wHJlYWsM0j77H5H57ShJoomOBKFQXnfIX38bcORKVDLeGOyR5fEMG78ydd2iWjhWNOlOL/OPqeby3+xPDBt0QmrXdl/ZhJw+t+8pABpVP1ls6JjfdwvXBT4fyyHc9kakvKqcRdBzon0fvwMOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=O5lQF4KH; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="O5lQF4KH"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C7A181A6BF7;
	Tue, 31 Mar 2026 18:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1774974131;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=O5lQF4KHW1HjaynPkXWEMsyYlwRYCljCYzRMBhp0M95UXUhEp5PExuI9bdhXoPPxK
	 Y5XN2NKtvBOjwMUdZ+X6pC80D401HnRfprtufumHpPVFt7DZa1y3iga2zvd06d2JKV
	 iIpdq/F+aFVJspzu5J9ssAbAwds73TDZXpPVNm64/NpcLvvI+KwxGg0+PWY/LAuRZx
	 0dKMVTgdUWy7DD5x30t2LKKk4AvqrNcftLDwIVpqDEtUqi6qbjMHTLzMLL90OCxUFE
	 QHIG6T44mm7rIoygQ/PVWSodeyc8Yn1KkSzLdz1HcUo9RNb7jmmyVPPhbcx06+hVZ5
	 CSDOAxLIUb2iA==
Date: Tue, 31 Mar 2026 18:22:10 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 1st, 2026
Message-ID: <lbjylrvih3qk4irnbboktpadie4ldtqxzwyqarqubyvw6zkouw@j7kjwm2jts33>
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

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
