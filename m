Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E45345CAE;
	Tue, 21 Oct 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061676; cv=none; b=hlBZ31W30RxGLtunWRVOT79qEl5apQ/4MTA0XbVipdNPXAAZJ9PwUGxThCFog4Cr+rmuEhC10LvtWptkZKLonKltoivEzzhphdeKIaMDFMxirHzXCyVwx+/HEo69/jnIfLi1dAfAd2HoVZjZ8S5zLbRdnR8dKtQobcIhkDmiZtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061676; c=relaxed/simple;
	bh=MIjdgCw2uXwuEQkXxRZAaT/3oSeHE+QSGSCqxtxa9k8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSR+nyUb/Lbbim+exqR5DJS2k9RGSHlD5fYjbdMS9vVMPUAjKFda2OpLAsRn3fK7e3GGNS8o94V1uj2JMzCMj3wkvK/0WZKfLYEWvK2IR5oGvW0gyIu3MSk4svzgw0hJcpgQEEg/5hlg+V+tP4RgIZHMihBK+t1pf519x+4875M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=s9O6Vm5i; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="s9O6Vm5i"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CE7C3590B1;
	Tue, 21 Oct 2025 17:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761061666;
	bh=MIjdgCw2uXwuEQkXxRZAaT/3oSeHE+QSGSCqxtxa9k8=;
	h=Date:From:To:Subject:From;
	b=s9O6Vm5i+M6WC/9+QrhtAj/xNjJ8rxBdqSaoSnYUsM+WlIZ3r4+hQnoeaGaQ1mX73
	 4VCSFE0SOn+Kl/c41VxM6p0+CCIKTv67KqhvfiHZfqubLsxG1RIW5GeqptjQqUqdpT
	 3INN7crkNe0YuGZ0J3pd2QDjuLzQGwlMaYaZBnc7obLJ2eAboSEwUAMEC2f1lD3WaA
	 LfuQQ6VSOQQN1Bp0R4JZ9DgFm+dIcK5a0ONWGZLPZ7LCvJhjludXCnSE55RxzpMGe4
	 ksKzDjbRqlkFVqDTB6AxYWC0iRWl/oD9lAsCp4rfI7fkjfhsjhphapB2nmZDWuR3WK
	 KXOyJeW9X/WNA==
Date: Tue, 21 Oct 2025 17:47:45 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 22nd, 2025
Message-ID: <vz6neag4eup6zcthdnirk4pcm3qyc64cqekwdkmmgdnlko4rpr@fhgr54maycax>
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

Currently on the agenda:

	* TSC meeting update.
	* Open discussion on upcoming project policies:
	  - AI use: https://github.com/joergroedel/svsm-governance/blob/policy/policies/ai-use.md
	  - Repository maintenance: https://github.com/joergroedel/svsm-governance/blob/policy/policies/repositories.md

The policy documents are only drafts so far. The TSC wants to discuss these in
the community and gather feedback. So please make sure to read through them
before tomorrows call :)

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
