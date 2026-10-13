Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE28B440628;
	Tue, 13 Oct 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907905; cv=none; b=HHg8FlM7rQkt1nrHwOpkPaEE+sFF+QYHIEFjf9UoJZr7pJ/78O8xZzNQ+Jj/tcmchdYu4kxnRvg8W0C/4+RoFkCqKBMYyWIulG18iZqFXo2dCJIZdmSc1kd/k5+CqOfJC5v6hPbAHBvpnHDUdP7yACRNOHkQeV99vX91+Wu2Di8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907905; c=relaxed/simple;
	bh=mAkoZq/mAIQkEwAzBl9Gfrkj25ZWp1h1f4tjC6sNyEc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFxa9Z4BTQqpnmFt3yg03pcwoKU2xiNauGxyN44zS0lvo50IIUs+ChPt3ygd1x/79BXW+XVzO/wEs/8xu7hIqfno3rX8alVySlehY1WvW+EeJBFGOg131yhR90h9Qx5o7mrG/vtEk4sLENUqrcQGc/twERqBXlrc/Sg8Ky4RHiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00d3fe54d4f1bc6577.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:d3fe:54d4:f1bc:6577])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5A76A1C7789;
	Tue, 13 Oct 2026 18:11:37 +0200 (CEST)
Date: Tue, 13 Oct 2026 18:11:36 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 14th, 2026
Message-ID: <as5Xer7x3TKZRvwp@8bytes.org>
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

We have two scheduled topics for tomorrow:

	- Discussion on the Inline attestation of vTPM-bound keys (see [1]).

	- Presentation of Rust vTPM integration by Google.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg

[1] https://lore.kernel.org/coconut-svsm/CADRsRuW1zJxk2+WxM2oQX1T_nq9O5SOoswhMQH+OsNvz9hUiHg@mail.gmail.com/T/#u
