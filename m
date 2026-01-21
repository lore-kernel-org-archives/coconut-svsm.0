Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EB934CFC5
	for <coconut-svsm@lists.linux.dev>; Wed, 21 Jan 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006529; cv=none; b=VsvziqU/cE9HZQYU7RdPh3Pf6/ZHdb/BJUGkt/Gf8PGSqMTrbuIr2zdSxrznQg/2GUv5mlK3n2V4HxEujiLYf3nL50jakzRCPQyCzCeFHeM1c21DG302qhHYV2Br+zBbCcjVNEc23C2ODhwwq4AFSiQetr55kJWr02+1eckbjHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006529; c=relaxed/simple;
	bh=mrsIveH8141ic2BqyiFDofgj2ISUJJ7ZIPrAb7d/Uio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7cSU85PG2GhWjy3ZTWKKm38ZH5uEi2UxGbmctp1ADErJYanbj952SUnlwh1Q3DMncLzLOkISh2VrNLYoeluYialT+oQ1Kg9CAEV6cyhABZAGm1/7UrmunJEwdoN3J8fLoWnk6ZuM3aux/kEJtB2VFUgOloXwmXBstK50lwrhmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=CqR/1oXt; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="CqR/1oXt"
Received: from io.home.8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C646F1C039A;
	Wed, 21 Jan 2026 15:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769006524;
	bh=mrsIveH8141ic2BqyiFDofgj2ISUJJ7ZIPrAb7d/Uio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqR/1oXtPAXlRiA1XfmaKP71EHJv31OBCgnd+5wQqvFLw6o/y7LdLbK+/K7reMY6n
	 IKYo/bjUt0beoJlOP9Tsdz0fNA2lYj7jHdctLXCosioWeG3BbOlpTZDa90CoFWjED9
	 s8mdgnESbcGjamM0XRRBBOhwWIhWirP+UQVcFnKUgK1KZOSPkIpAz1lsQOyRrz3fbp
	 r1x0DX/tJjCRhuOwX7mnZ+afehhYI/uoedgx7PcVLXS1eW4Z2l2lvSnqoYBUaOns/w
	 0eg3u3D9jbGbFArh/FxrGSWedMhc7w407y8LD6npn4LJkQMRUxK7s0oyzkdr/RxlmD
	 dtfraqccgJkwA==
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Cc: joerg.roedel@amd.com,
	=?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Subject: [GSoC 2026] Observability Support for COCONUT-SVSM
Date: Wed, 21 Jan 2026 15:41:50 +0100
Message-ID: <20260121144151.37812-2-joro@8bytes.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121144151.37812-1-joro@8bytes.org>
References: <20260121144151.37812-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

=== Observability Support for COCONUT-SVSM ===

'''Summary:''' Implement Support for COCONUT-SVSM Observability within the TEE

COCONUT-SVSM is a Secure Virtual machine Service Module that runs at a
privileged level within a Confidential Virtual Machine (CVM) to provide trusted
services, such as a virtual TPM, to the guest operating system, independent of
the host hypervisor.

The goal of the project is to implement support for observability of
COCONUT-SVSM from the guest OS. When finished the guest OS has a way to
fetch runtime metrics and data from the COCONUT-SVSM running within the same
TEE. Runtime data includes the log buffer, services logs, memory usage, and
possible future extensions.

The project consists of several parts:

1. Design an experimental SVSM observability protocol for exchanging metrics
   and data between COCONUT-SVSM and the Linux kernel. This protocol will be an
   extension of the SVSM protocol specification.
2. Implement a handler for the protocol within COCONUT-SVSM following the other
   protocols COCONUT-SVSM already implements.
3. Implement a Linux device driver which uses this protocol to get
   observability data from COCONUT-SVSM and make it accessible to Linux user-mode
   via a device file.
4. Implement a Linux user-space utility to fetch and save the observability
   data using the device driver.

'''Links:'''

* COCONUT-SVSM Repository: https://github.com/coconut-svsm/svsm/
* Development plan: https://coconut-svsm.github.io/svsm/developer/DEVELOPMENT-PLAN/#observability
* SVSM protocol specification: https://docs.amd.com/v/u/en-US/58019

'''Details:'''
Skill level: Intermediate
Language: Rust and C
