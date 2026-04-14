Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AA355F54
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175240; cv=pass; b=YIxli2mdoN7oXCY1NKzZzdQEhcPVd7WWYZ5iJkjRgCNebWK0yFA/EdhFor0vUGWWgbG0/ydiKxb9Yb1jALHw3VML9tilE+XVKAT4ViSREzYovxN026FvgAQOqTfy/gDscYgICOGZGaOVmNv5PUCULQQ7Vj6V4QC+AHekIav7ypg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175240; c=relaxed/simple;
	bh=WD8lG4R9tT/bXoqr+9aOkFmOeNamTtfKssxBVYK9kJg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JGHsXkl/5qEzQts2APKf0hPB7Acuurk6Qnrp4PmCz7GuFGfOsByp7SXiKLK6790rxNALCndKs7dkxxSjb+Rhx85scaaN13yUwrzwhYDVy3ABMq1qkiQjoAg1h0qE2xSo+PeOyWQ/kuVfeanBjHjlwR2kb97+WQRAdnHchsL59u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Awd6uE/b; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Awd6uE/b"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ea87af213so78945127b3.0
        for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 07:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175238; cv=none;
        d=google.com; s=arc-20240605;
        b=OAr3bZQNNa+YREWN9XIyY9avKbDUHyUikX08cDa93jPlArTpzVZ2jt1xqddHRjSDlT
         uCIyT09ePmeBtHHUZj4M96tAn0CcsNDyhATcXbWCezcJOcVcZrLeT51sYmGhdezFVgBm
         p6qsTNgQT7l12GhZemRlHgiPg2PZVv+GVmGBnq9jamxrjypjE93GvzmGnE1rVyS/zhuG
         LQORZMVa3BayT7/rWDBwX72nCf3dvO+WejGHpFtLeD0EmvXhqXLrTxMlntwt1r6ASoCr
         TIGj8OlIGulvKZzZ9eldtlt9sY4F6G1x6Kx8CJG0ENoDovCv8EfvIY3AKJKK64ZLGoFv
         lAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WD8lG4R9tT/bXoqr+9aOkFmOeNamTtfKssxBVYK9kJg=;
        fh=+fC3vhhzGlOtos9P46wVmBGs1abwrwBw38RYpiGu5iA=;
        b=HPzBgfoPb0FNl64tPwkHP4lR+T/UaHXU+YfKRekii2W/3LwX94gZhgSWFnLscfJa5x
         +m7qpyama2O3BfMXoVUpa985vx0fAT7QMeMVahsa5FzVV30Hcy/ZJJTE9TpaufiH6pS1
         ynZW1RwHfFRTnO0q2CPC5rA0MZdX+yZ1Fs2a5sMW72GptCCxwEbB0jcFqv+yOhqMEwBG
         VsH/76S/f7tyeh3rwo8xZAXAn3FDjFc1VFSs5Djw/GNWM+CxrcTujTxtfycobXkQpR08
         JumecIIptK5PqwRvC+Z0k2/LOBDdIHZm4Tf+Y98M/UQ1B1DWhNZjf9y513IcHkygvMBr
         lgDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776175238; x=1776780038; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WD8lG4R9tT/bXoqr+9aOkFmOeNamTtfKssxBVYK9kJg=;
        b=Awd6uE/bJBkPlDIQT9IM9jvXLSs/Vw932yTQRaAFhsb+MGJkwy7wLkeAAzp8hXn2uD
         ohRFRqGmPYvhIiiPhj2aNNuBgdbxrLjivOpY7lSnIo9fMntMzf+xtOamEqjQoFUP4+p8
         3PsqVQRGQ2DIUQe5Yy8wh0QCHsDC2mWz/x7dO5E3st5Jyb3Nolsk0T+n0E2a2lqFnfFu
         oBmo2m7vVkry7JMrSwkaJ3uHaVHJh8lPLFMryzjh0wgBI+12X4OiiGo2kLpUYgR6cnlw
         Z1r1rPYL0BEjZzmI+IS1gYd0g6zkg6qUEr1xJaMp4oHRBu9TR7ugGhS/xmxDSSvMap8j
         yb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175238; x=1776780038;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD8lG4R9tT/bXoqr+9aOkFmOeNamTtfKssxBVYK9kJg=;
        b=MFr0vQyShwuf2w5TaSC16vc9/g7Zi+tIKh6qz3rWQOfAgXdqDpSdf5O2pXwcwhrtUx
         Iq/5jJpJjqVU7sfSabTK96kj+V4k5Nby2SZBxYDe+wgxTroGcovdwQZE+wyuiNvk2AD/
         /JKTWBz86GMRQzOspawalUnmT4TeD+FYNR2oJj6hCkJwlWlYOcfnV0uf87T0N1WXOvGl
         GR6WkKez5IlTPXvEq9/PJ9uBgn+7EUq0Y4GWcD0iYosFXxWfjnCGhn/hYsqkj7vyNFPb
         1Ra/1GYum8gj3Vx7c6tPx6kz3Tlj9fdmeVJkhPjJ5FTYdB0LliQ88lm7zLsENNcsZ/zt
         eIKg==
X-Gm-Message-State: AOJu0YwoM5T3lEJGvHgHV03Su29P8wSLTiLxQoBY4GzsNX2mcWOE2Htd
	xLe4x+UQgQutZcd3ZL/Ty5B0Uy8hCvnCf8m1U0W2kno8HqKi6oUeapyXdM+4qk845PDODAWwvjn
	o557eSzw9tAvZv/boAa6yYzX7H6/V5Hcz4gSs/ipLfR5p4M4fjR6pKduQdA==
X-Gm-Gg: AeBDietWlA9wLvmSWfYJJqquT4WpMgwdNg96CLRVP238RRmhl8ALdP6c+oDz4noqwGT
	pZRBZ6XAUidoyRzUSdcp59S7Q9C7zwooIOc7DQ648teXHArdzoVxVJXi7h6qjMGZMEIGFrpLQ3Z
	hSnNoXzrtp/MWZlpkE63evbCxhmkZzMv5KnjZxTRFCNuc0G9zajJR4vydQw4IHYrcakxkyFfEIa
	XHtbpMLBoQDptj/G8vZU5Djfj/tiN/rmIiT5ujNIhFpLnw5K2OYKSZPOCavd+n3XQfwtXK9/hFN
	wCz6gkPsoLxsj4MVqFtB90AKd6OichUP/bPvL+3iFDjh1vpLMLztIvtL+J90xreegTM=
X-Received: by 2002:a05:690e:b8c:b0:651:c221:9649 with SMTP id
 956f58d0204a3-651c221cdf4mr6916734d50.19.1776175236708; Tue, 14 Apr 2026
 07:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Apr 2026 15:00:23 +0100
X-Gm-Features: AQROBzAHDaJ1wJtEourNNQiMY0vXfQYijsPyoyEQk1_vwqWtIhPUCMGol8VBmcY
Message-ID: <CAFEAcA9LPMVRQPKvKjt-kSjkU_pF7JhHZQpw-bRgZYjcfxn5Dw@mail.gmail.com>
Subject: Save the date: KVM Forum 2026, Vancouver, Canada, November 12-13
To: coconut-svsm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

####################
KVM Forum 2026
November 12-13, 2026
Vancouver, Canada
####################

On behalf of the program committee for the KVM Forum, I am pleased to announce
KVM Forum 2026, November 12-13 2026 in Vancouver, Canada.
The call for papers will follow, but we want to give you the opportunity
to pre-plan.

https://kvm-forum.qemu.org/ and https://kvm-forum.qemu.org/location/
already provide some initial information, more will come soon.

-- Peter Maydell
