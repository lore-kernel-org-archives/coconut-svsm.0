Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A47C27EFED;
	Tue, 17 Jun 2025 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750183243; cv=none; b=RPyOKe3PXWFeW37tar4FLh7H0KQj0/PI6vp1XexI0X1nW4O6w0OaMbQpvBAlNHyDUUkjpFKfeZ+xie/0G/tol33M9IczAubWVbi6ZeVaWh6yKB0ZnARbwM8myAbkQSL4i5OheHJDY/9/k9iLXdoQzMdNIF9kvCM4EYK+s1kggVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750183243; c=relaxed/simple;
	bh=pKBgpC6MY5IB9rVdXU0jx/S0VbNLDteILO57Yot8Hl0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcPC/soVXAIITcB66IBA46ifV6b0Z91urhu3HK8wyx8HKlTJjL+YE3l7qt93Z3b5jRqOqq7LBcjGuRjf0WqrKuwAM0na2ZjV9dKHRDdeFvv4Z0ds4kB1pMe6Nij8OuFrG0azFOvcrLb2X8n1pzpPLFGEjhpX0NjKAxVHvXQ6ozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=DSmHJn8D; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="DSmHJn8D"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B0D144E1A5;
	Tue, 17 Jun 2025 20:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1750183233;
	bh=pKBgpC6MY5IB9rVdXU0jx/S0VbNLDteILO57Yot8Hl0=;
	h=Date:From:To:Subject:From;
	b=DSmHJn8DMmM8038mS+fgwv/1t6gevU2oTV3oaBOur9o5r3zj3E2lxd549ZlzXzQwL
	 V3p/+D1wczU5lyF6QEhBxZcTZmUE98E1mlv1NmD2TLl4UVhcK2SiawL/yAYXV1MROE
	 a6w0iGqu5Ha8tjXXmY4SlcPVWaIbfEJV7mAFFB5ECtHYjd6/zSjihrtefRbanDZ5/B
	 /ES1FmpZ7hTA9veMim7XXeKzr3WmNA+5l599iLP4DQqQaDAcljq1dQf5GJ/kFW6RO+
	 n7xrx2Cfomet8Gp+L9l12/JEyZNAh/S9xT4XNdULhh8WMU3U/tojfo+Rud/vxG3qIn
	 eoLZwaiZV/Lhg==
Date: Tue, 17 Jun 2025 20:00:32 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call June 18th, 2025
Message-ID: <koizxbgvbx7eyxacd5snfcwcuzbzhgnu4q3fet6rhds75xemvh@qres6fu4qmxg>
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

A discussion on two PRs are currently on the agenda:

	* Add hypervisor field to IgvmParamBlock (#609)
        *  Add a small TPM software stack for commands to populate NV (#721)

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
