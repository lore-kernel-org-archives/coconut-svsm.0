Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F523E95B1
	for <coconut-svsm@lists.linux.dev>; Wed, 21 Jan 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006530; cv=none; b=P0j12A22CfKzjb/ELx2Usb0yY9RnOiIPSu7halhMq8GMt3c7+AjhZNmEozNPf824eMUgpeVtkDp82dAYXHxrtCv/HHFVIEaKdO5hbZhN1nkIjBy3E2B4PgNqWZFpUGJC8YSW7cgtQlwssVW0q8VAtMS7OApZ1dk74GLg/7PloVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006530; c=relaxed/simple;
	bh=pBsxiTsDSDnRiRHzMDNFxhhU2RbmnzwG3E/AW1iv320=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+7DDIlo75vtXb789OU9kfOa62SQgFlaZwzY8aKL8PG9w+oSuJeRYMmYOUf8W3OjX25/GvFZSs6Ibmrp8kgnptdoPyK7octmkbzLsHPFZyWbSRp7mgfEFJTXC6Unq0OcTT7DYFBWrCYrKPhRfUhqD//6VBgSoTpEV0gcUn76GBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=jyjbepK8; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="jyjbepK8"
Received: from io.home.8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D81741C039C;
	Wed, 21 Jan 2026 15:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769006524;
	bh=pBsxiTsDSDnRiRHzMDNFxhhU2RbmnzwG3E/AW1iv320=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jyjbepK8oNc4MkJJS4tFn1uotYlpTYkLIlydWdM4pAjWrxtAbTjk+YcE1mzb1T7VU
	 XYlrdju9kEv2fHuEwTywQuavUU8SIw9lmrqjqYnUPrutEdy5RCwuCI0TaONFtKhER5
	 jSVlu1VTEUcHtgENn1Ge8n3INQp0YjxI1r1TnrWJnK2YVTkeVxpqm5BExZ+zPsrB95
	 8l5fLDbEoEHwVHHHLFScjm1W0pughKlOLwNN/2TKQYGvSQvW/IsUpEHVJDBxqfTd7F
	 kz/iolfD3NKAkEjW1KeXE/lvPFIFLTbnEDpkieO6AWUG7FLYYaPw/SOrCc5KVrHkEx
	 zDu8m18Dq3LDA==
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Cc: joerg.roedel@amd.com,
	=?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Subject: [GSoC 2026] PCID Support for COCONUT-SVSM
Date: Wed, 21 Jan 2026 15:41:51 +0100
Message-ID: <20260121144151.37812-3-joro@8bytes.org>
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

=== Support X86 Process Context Identifiers (PCID) in COCONUT-SVSM ===

COCONUT-SVSM is a Secure Virtual machine Service Module that runs at a
privileged level within a Confidential Virtual Machine (CVM) to provide trusted
services, such as a virtual TPM, to the guest operating system, independent of
the host hypervisor.

The goal of the project is to enhance the COCONUT-SVSM kernel to make use of
the PCID feature on X86 to reduce the number of runtime TLB misses. The work
consists of several steps:

1. Implement generic CPUID feature enumeration support by building a code
   generator which automatically creates a Rust crate from the data provided by
   the X86-CPUID project. Use that generated crate in COCONUT-SVSM for
   detecting the PCID feature and clean up all the open coded CPUID checks.
2. Design and implement a PCID assignment strategy for tasks and threads in the
   COCONUT kernel.
3. Apply the PCIDs in the COCONUT page-tables and adapt the TLB flushing code
   to take PCIDs into account.

'''Links:'''
* AMD64 APM 2 (PCIDs, Section 5.5.1.): https://docs.amd.com/v/u/en-US/24593_3.43 
* X86 cpuid project: https://x86-cpuid.org/
* COCONUT-SVSM: https://github.com/coconut-svsm/svsm/

'''Details:'''
* Skill level: Intermediate
* Languages: Rust
