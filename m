Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EE02E36E0;
	Tue,  8 Jul 2025 18:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751998012; cv=none; b=LhEvEEFpdSgWzX3CwyHsf2Fi+gZyGe3skp92U3pYPa8FGTrJnZDQog7xnBzdYcn69HaSNxY55QaxMpvwrhfxzGbpTAEqQ5x03MXRXgqAfPEAHkUQtOVPN0sTMoCTZFfLPACre0oAzOdWUao8ebIzIOuDrOE/mGkdhnN7C27Z65E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751998012; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8r3GjAQgYlS5zOi+iI/QzgrQyUTX3COUiW5IaBOdl18bw3Izty6W3sddqcZjdcAemgVizhM8GgZvxU730hNp3co+zCgevvEYNHWbxFU7twrFjTs4Be6Ah5oJDfhwDMG//TMcuEPyEFhqteablzHWLIn/KoEPe7rRjzDn3Ww7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=gtvEgY6V; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="gtvEgY6V"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 37BFE4DED8;
	Tue,  8 Jul 2025 20:06:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751998002;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=gtvEgY6VoEiEZiexo0hgLYMQcnFUoyAyye0GPj0lCNj7znWmLAyinmjxW1rtia8gb
	 59jU4LIrgyKlLpu51N1SI006gPTIGUwPrcegwvGxMturPz8razMQcndFud9bdo7/2w
	 w3zjGqvT7qbMvnQ1xDsXUawqiRK5g6Nkz0nDCJEt7hBFOH1cxi+3Vz5GLvGfVt/fqN
	 mPIvCZLAB7l7N2PzxXRKyMUa4Gi3ttIlPisp6JCpC5YM8Z++uin/+ZrNg9kaSbcK3Y
	 a72hBh7j9GUbJWzTC2wKv9PgnXMFfLiHcBn5xwqSzkAeRdgzKpBqzJitqYcUGup3wF
	 9mXty8WazJgVQ==
Date: Tue, 8 Jul 2025 20:06:41 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call July 9th, 2025
Message-ID: <77dsinxz7oc7tfcox2ochbsunpach573cy6pryf7jlndf4hwgz@eqcdwp5psogl>
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

See you all there.

Regards,

	Jörg
