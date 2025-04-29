Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A5E21B8F8;
	Tue, 29 Apr 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941435; cv=none; b=obGGDdtH3m+lOojaomrvRvH2J3qYPblcX0s7sxpns0PX6qgHK3qlTeHhQ/Dpa6F+toJp7wplDWYC4jYk3/32wDqzlyH85zU32GJ00fNjBNJbC0rC8U3d1DfBZkqJ7tBJJDLniVVgGLNdOoagPkq9fWWipoaoMB/OJCdWqeFDGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941435; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AysHl2cUeGwPAbBnjWLK0MyzyaiGRKMhncBmMAQi4efR7af/RUpYno0e5iZaOMf6kmxlgOVnDMuptvLD2hBl7iytfj4Rc9mlV2/AbqCWIjhG/Y8K/YIKDb8WjHYHfRP2tKK2+lpGxnU0CO1adG3KwmtHLjH8Q42Odrc4mLrcO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=mExHAxL9; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mExHAxL9"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 16A2E49913;
	Tue, 29 Apr 2025 17:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1745941426;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=mExHAxL9EM9XL8cjSm57Z0WncrA4SdP4FODQxhnXPA28TA4jnHCxLFUWtHcOfvh+t
	 bQVLYdlWq92UrLwC4fBhsS8OhumDgFgiqUZSlEzNmUSeXzOVQMkXh4eqLrLCNIil1w
	 bH5SVaU8lIcCI8QzWfEr+QPihWXrO+p8WAz6gR+4drACJwrxXi2eY16NhvwnpJLzzW
	 TCQPMdSGmyY5rIODMBydcLpqRNo5nKbLzYl+NWCgRmes+jg/vBfzjjCs9E56Q9zZYc
	 zanpQ3wlTWcWRBOC8hrrdAFxLjdXA08k+0jeyfvLWJbK7dbkJHnJDIDNJICnHgHJpa
	 Gof6BDII8APXw==
Date: Tue, 29 Apr 2025 17:43:44 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: SVSM Development Call April 30th, 2025
Message-ID: <aBDzsNz2hpkkA23c@8bytes.org>
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

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
