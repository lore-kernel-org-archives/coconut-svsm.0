Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CE9283124
	for <coconut-svsm@lists.linux.dev>; Tue, 25 Nov 2025 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764073634; cv=none; b=YAks2T86waZvT0Xk9g5Q986jeS9pHx5MI+1cKHLOkcspFB1FFG3A95TaIH667MP2V9N9bwH20SEh33/m6jQ0uiemoca/MsCKoHSlLlIpXnNr0YG3ll56ad7c0RAqYGLBO99HxIs0sf7S+RAssRd/DIUqNcvLSot97AXK4fXyEzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764073634; c=relaxed/simple;
	bh=859a5DJZSMCKncC5KKWdg77eeVcuEZUanGKaG3di88A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+ETmiMYfuoTUhq6Ocb7EzT4+vQ+UJF+ZTdOR9p6HJhS9x9tYtfdr7thgHUvkDEtR/b+9hfOzwudCrCHIqSqP9NOW2+YFqZBg+0x2nFgg+W2EMl+bbwHsllthAgdet4U/M+DSv83ku3I51hGQVpDTWesf8+kr+rsaS1N5wuF/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=jUZpj06Q; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="jUZpj06Q"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 309E25C0EC
	for <coconut-svsm@lists.linux.dev>; Tue, 25 Nov 2025 13:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1764073625;
	bh=859a5DJZSMCKncC5KKWdg77eeVcuEZUanGKaG3di88A=;
	h=Date:From:To:Subject:From;
	b=jUZpj06QCPja2t0qANmImMaT2K1s0rxMWssRIYgKde0g9BoIbSmCJVyxMQOCUxXHi
	 F73Soy5nApsVjWfORph+uqcJfpaBxdVtqY3A77cIGTwJRhMSCJ597ePRVlWw3HP8+L
	 h8GiUPALoQVZO2MnSpJtD5Lp/LnAVfU7ioIz/YLNYbqiUT57DaAfcqp0SJ2avObS0d
	 Ao9vthZ3Xe6Qp0iM8VBOTDCIWTIF0A05ahc4WcZn/vyPpyeAMM50X1lPsOTPWaPPMN
	 qXW+i/SIbHsBKWe1wuJrHpTX5AA8gtHgRtFuK8cRJmuhN2JmAWiz9fDY2NCdUuo3Og
	 QOgAvTHXw4WoQ==
Date: Tue, 25 Nov 2025 13:27:04 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Subject: QEMU update required after merge of #858
Message-ID: <b6lqaddfiusx4bplgmujavfkkdca3qyhesehybg3tdgeoitns3@tisuifgio3xf>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Olivers PR to make the SVSM consume the MADT table via IGVM was just merged.
This means that everyone developing on KVM/QEMU needs to update their SVSM QEMU
installations to use the latest version from the COCONUT-SVSM project. Only
that QEMU will actually provide the MADT via IGVM.

Regards,

	Joerg
