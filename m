Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432C4296D06;
	Tue, 15 Apr 2025 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728139; cv=none; b=VXa9jCAJxXyFqNYpJifI2m6oKK4rGwGYiZZ3fjVMtZVV9eBAFFZr3XvpS5wl3ylJ3RMd06+G5k4tC8GWOe7DrTDzaCBLuFNlMSt3fMLEmDyXaA0duT43ut/sJaoNgd2Ec6Pyw/0ItJyKA8ltKEZE4yrkSIUvRCYdgGkfJSVGKAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728139; c=relaxed/simple;
	bh=lC3Lw4hnbEoPZ4iZmoWQbU5CHTLzGMkvTPZdtguLiKo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIBQ1HHDsWbq7PTfE90lPrbdRTb3OZYfVFHuuKSNE0eiQI9W7b4/XKD3uoaj9DubUICFlAAzkjVP65GijvG64HWJKmJ4gNdqpWktRA+RZuhRuW5XU/8FI43AKqqyWZZmlOfg0lLCcZFw6cg3zkPodNNfcy33cNNMjeN66Ul9/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=H2ENnzJv; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="H2ENnzJv"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1981A46860;
	Tue, 15 Apr 2025 16:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744728130;
	bh=lC3Lw4hnbEoPZ4iZmoWQbU5CHTLzGMkvTPZdtguLiKo=;
	h=Date:From:To:Subject:From;
	b=H2ENnzJvM8zNbso/wAAjIxs9YEompMFEifn/BJ1Q15GN8Vk/jSTAG6I2ZmGpPDHes
	 DojvJwcYbxZdN97kmo+NNbssNl7tqtAYlmNinOOR+hA2mq6t0Bm2xoPvZLWqAdebg3
	 yXBH5r8JuGS3WzD2Qjnoxvzo8I5Pil9tv1Uk1CjvvplccpsEqsgwl6uHenbkxg9fiy
	 ayQC0jERavOH+lByOhggVWU5rwVtWqHDx81awI3QN+dRhJg3omGecOtByKn69MM6zD
	 0PBqiLLyi2Dqe0IsySljynMwDkNuBb8h+xx5J+DT/oR+h8kn2PHGWdqFz14kdcoanQ
	 swu06saYC2wmA==
Date: Tue, 15 Apr 2025 16:42:08 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: SVSM Development Call April 16th, 2025
Message-ID: <Z_5wQLUu13RUm7Dy@8bytes.org>
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

Currently I have one item on the list:

	* Upcoming changes to the SVSM call.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
