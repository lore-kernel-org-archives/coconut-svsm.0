Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52C2853F3
	for <coconut-svsm@lists.linux.dev>; Thu, 10 Apr 2025 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290219; cv=none; b=oNOKH0x5av+btAp0zHLggqEIRRsvSFota5h0wBTEWF5gNU1HQ+Rh95+McVMI+qTMW48XNSvwpvw7TPtsifMrWjhytkTd8ITRMj6aq4Gl7DW7iHgxFSOzn5fPTmvibyjdoTKzkbJP1wGV8K5aJVBLGQ4lD/bPlz3fU5riuLwqWzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290219; c=relaxed/simple;
	bh=QsZFotQgKDOlLBKfwgaGZq0NXWyvU7kZDwZsaqECxxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rwSjedb+3ORCLYreY8N7wKoazS9bOPKXKrV5YC3S4vbm8Nvo7qgYbLG7MH9h0d5l2x4qpeR9ku9ySUbuF76Iv433h4VhET+3fCjNzcSf03CHmn/8oi+fbgqRgEq2XFY9znFi3gXaUw6EcJK1BuqFpMc8tTr+OP01DRSa7WoinNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=l2SCT8If; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="l2SCT8If"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so935945e87.1
        for <coconut-svsm@lists.linux.dev>; Thu, 10 Apr 2025 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1744290215; x=1744895015; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=l2SCT8IfGhtKj8fOlDkm09t/ZWJ0TU+x8Ha8S6WIqHfCXZl3N5jg79nYwCKjIAXWeg
         pOUfw4Uy4r42VVssXpSbNFQG0Eq4aTpjlzmqcMA3SLvOULG9i74fjLph6PXFYpfozvzX
         URQRn8UQotlYObtxx9umbVAfL6l6a/NCxX1tHLb+RFF467SnY1+Ng9RH7YKXAUsyblvU
         VnZMXNp0+G0zM1I7cDpivLIjcuNTtq9FMz0u2QIfA2cbhVRnw2xGBFhbfcT4vJXPXy3s
         YLDNHLciIaOC7mxS4U51/Ukdpvoj0rQRlP+tNJZeTQOEwAfZ7V++c7j1oIgJN7ndfJEX
         0ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290215; x=1744895015;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=X+VME0Rjbw3jlkL/UNfG5A2ggXNwyz7s9MnT642uD3AbB4VT/A8KpBfSjaemMxKryc
         y5B8BUD2t0/N9cfqM1SHL18SZ8EhSKhj7ZBOc3bOHEnj5VsdLbSd0Za6AyaVX3xleXDW
         ru2zJuGPBGwW6SIgngSGcK03op27IC5n7Jm9LPpx2eD+/OZXGu23mB5wOxpHKI/bcLF+
         YHKXEWwCuYQGx6Tbd/vCFKhmLO5cqB3VZ1M7+WexcdYoR1qvcy4wQj6P6gGY7qTmhD9A
         yNBw5hIiwqb5VXWh7gni85JoXNmVfpTN4JN1sibHiCgv+BnI6ZHlhmec6zTn2hjKm4Gm
         Z4QQ==
X-Gm-Message-State: AOJu0YzvCEjy2EMpIPO6t1YQxP5uvDJABeeNOVh2H6/F1ALndHr/l3eZ
	ACmei0FefwOE+EYeVErkbCyiu52RrRDdtO822EiEkkXcyU02/L+BSD9kiUTTBDqAt6rVFuJ63lb
	z4mLL+AlGc8pRnd8xUUJmZSpjwSl+mTpgkcw2BpK1OlXzBrImBY8=
X-Gm-Gg: ASbGncsUk3QIofCZXm6Hlj2c3TF7WI7lqUGn0yKEiDukhHXg6cfsjE8L7tvo1DHz4Eh
	tvARPyaZ4cok8bFeRW3qYgIXmTkU38kyYVRul3aQGVZ6GCODkqroicXDUtWmLOPFs3iKnQSyh95
	6jq+C6oFNa/QedjeVsM56ggMUP2OgC3iQTmD27sWWGXAQpMVUNuK+ki/+E
X-Google-Smtp-Source: AGHT+IFUj8jokizn+YpVrX4Wljve8l3aYlivHxOFDiRoj3zbDl+wI3qzyuoObmBmsKs9s0cdrKOZJRd0Sg7qD7Sf6h8=
X-Received: by 2002:a05:6512:2346:b0:549:8f10:ec25 with SMTP id
 2adb3069b0e04-54cb684287cmr813519e87.31.1744290213021; Thu, 10 Apr 2025
 06:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Thu, 10 Apr 2025 08:03:26 -0500
X-Gm-Features: ATxdqUEa1J7MbbKIX3lvNDdRzEVQLiDdy8HrnrvTReoxmYPfBfZ9Pc72IXs_EN4
Message-ID: <CAH=dH9-i=_SFL4KCC4TKe_Anib2REKtshKNrByXifzWEHYa5oQ@mail.gmail.com>
Subject: Test Mail
To: coconut-svsm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
