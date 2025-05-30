Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C052A22C35E;
	Fri, 30 May 2025 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610476; cv=none; b=XCwuOhke6HgZvnO10kUqs022WGwxGkVtq0ffD2NYg3BmH0kxR3CcfmvSuDnVDuHqjC4UBxqgn2zSGdH3mgGjtlCxNZDDYA5ahR2knCLPldpoS0wNZpL8Kqp20y2ZPfhvAfCtIOyK5HnEvXFLfqMdCuBxIGTDTK9JVrLfEDS+ijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610476; c=relaxed/simple;
	bh=/xoFeF6uX70aWbBBNEM8uWuCaQ0k29mi7V5Sfd5V9T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLCe2wtVmS4lYSZwRHxtq0ggWpKb8WkwigrkKqO4+WqOOnY4MKQTSY6bS3YxOw9tQ22IXu0wLn4iPkPCkVQqksnGXvejTMdOHkyvpZGDjMy8jyqOiLltxcnmU1muBKI6icV++bJVLtkog9tUfr+9dw+AJHod7Om/QE7wHfnsNCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=BXXo+udb; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="BXXo+udb"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6CC894CB3B;
	Fri, 30 May 2025 15:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1748610472;
	bh=/xoFeF6uX70aWbBBNEM8uWuCaQ0k29mi7V5Sfd5V9T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXXo+udbvzYNtrFDl1TOuGXXo5VB+raBSTT80nNzx8oX24DkIeHEOY+6gvDW+ddOg
	 7qCpHugBjIX9BG5StUUwiCa6upsIYJ4xQJ/Fno97ClUlCNuXTS6VQzC+SkYlCTeeuF
	 4T5HQzCcnm/DP281lQ8fMoZVvpHy0iiEc4bSOLxWiEwQdVvQmD8rqtyEIuZcwiQsgs
	 p+LMcsN4UnNqQEHF6LUAiDchzBWd/Ry8e/oaIEkWtPZfpiBBBwef7gptAsbTiXTZAz
	 jGa0vHyCwnLmYcAFxLUdKCn8cOcb4mA7FOyibhbjH6d4zmFhe2vuJBBwFywTNE32jC
	 hdgZFZliWd+Kg==
Date: Fri, 30 May 2025 15:07:51 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call May 28th, 2025
Message-ID: <aDmtpysf7IRTfjTg@8bytes.org>
References: <CAGxU2F6wv3QUOD=Ji_Y1aFqpwKUKhcHsUDCdk2uy79DgrvOrrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F6wv3QUOD=Ji_Y1aFqpwKUKhcHsUDCdk2uy79DgrvOrrQ@mail.gmail.com>

Meeting minutes are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/60

As I was not there, everyone please review and fix up things the AI got
wrong.

Thanks,

	Joerg
