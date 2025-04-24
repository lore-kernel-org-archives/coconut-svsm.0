Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB61DF988
	for <coconut-svsm@lists.linux.dev>; Thu, 24 Apr 2025 18:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520652; cv=none; b=Bpv3TRJtpCGn+UmLjUX8VWXV/xHXnVyhO/fiGEScRJDNA3rKSS7qtAeGPR+4wiQal6bYre+vvjoQmkBgChXVP5EwZVsGcQs28+4Fs+V5aIR0ODM/UocYvNSgNlFtLpnUHVhWHWXeDUvq+VwyApkrdZQ3FWX3CYLm4vodp+x3VdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520652; c=relaxed/simple;
	bh=oBbRNIM7tTHLQB2JNtAnlLdjbWme3IWjHADRoPEGI8k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cA6KEdF1RqQOeeR75plukJuqiFaVgOO/VZeFHAF0ZQ5wSnQ+27qDu20f+7zL7M4RG8FuTBjKBiEkimQ73Vmd51h+Cqx+dPMzn8M6W3zjSb/X0OQf7U0/OJhilHKg6nnE8wRevPuuGvPEkuh5LInk9xLLszebTp9NHEWoD8NzILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1xHG19uE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1xHG19uE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2240aad70f2so23295ad.0
        for <coconut-svsm@lists.linux.dev>; Thu, 24 Apr 2025 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745520650; x=1746125450; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oBbRNIM7tTHLQB2JNtAnlLdjbWme3IWjHADRoPEGI8k=;
        b=1xHG19uExoLUKytuyQPsyu7W6zbv7WEIH75YKgSVuhui+MFIHOaMljL0b7zSJFo1Ng
         /OfDLKSlcvchEK5hTBu/aXOd4DIO787pl06OoWSDarhgnBYLBReam4zAY6fM7/Dg/esM
         Pj8E/XzRtWaw2qqBy/rBdY0Z3ExG0H1dFnlYox/gy/4DDl4vIlLLxFM44iiRvlJhJ8HP
         bLCnVbM3zqfWVWJqoi8pYSYq5B5Zfvfjh2fmyQqgpqGjh9mA2JqJ8JdBILIu55iy0PPc
         Z+t+GbIbWSA8+AWgsj4/pkgGHLA1ldpwNxaYYWWhousSFFEk27/NqH5b9NT8msY3ovem
         qbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520650; x=1746125450;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBbRNIM7tTHLQB2JNtAnlLdjbWme3IWjHADRoPEGI8k=;
        b=Ok1gMZhXcw3kMfbZe0lvyY8r0AEn+GdRIUhc8h/tk2o47PenhMjKRrCkWgpUvlSKVp
         KyJC333nmPx/n9YKr7cW8uCv6jALy/BwDFZI0rLmMx5Oyp9qoxbWYdCSvh4MOCAjbt25
         IaxW7IKKpneb4nK7tWV+gHyqS5F9ftQBCkP4E6/SeDCkMmxMkyxLg8rZf4uArWGaU0E/
         b2/YEv/+zg66oYhtcWYEUmmLQE5fsKIZ3r/QGacFbYv8cnTxYYnpMnkJALiwSVVmnsDM
         lEF5fAsp7PqgVYtFSFqESOPEvWHc4K+d7HjvPPjP+8rHcmYKxnjPxvI0KkV8E73aspPv
         SUKg==
X-Gm-Message-State: AOJu0YzFSbYlMC4CiRnCnijkW/OOIUVfuArixn8/w79ca3C0EQCDBbsL
	AI2SIlYn4AGvpNopt8B98vqvovAMC8X6+pqJI/qmfShJpOPCJkJ2mlrlZbQ/KxFxJUpwffVytGH
	JcuPt5aKyz3ozgCXIO7uz4zAeJ0FMRkc4CH8np8DpJC+3N8MLbZxz
X-Gm-Gg: ASbGncsTjRWi46/aGn3C6oZEM0FE9/iIJi2lOSZ9yFaCR/xeO6Nn623qaYUnV9gQEky
	kNg1PtIGQhEFGnh6mx4BEaWrNJC6eAGMDupfWibr3q8PzUM0XkmlDEwcb3B6x7j3UaXuUwQHHaF
	le3XhNjxRf9lS756EYkf/D83/QsC9r3kNP96I1yuBVMgDQVCGCVhTb
X-Google-Smtp-Source: AGHT+IEwU3GPf/rcoZqHdHgjiSeTgwbbieKaDvERLP8WUaB2yYnpStt6mq1RRwPgKhOTkw6CBTvGu6D3zync0eBGfY4=
X-Received: by 2002:a17:903:4404:b0:223:f479:3860 with SMTP id
 d9443c01a7336-22dbda00474mr282115ad.18.1745520649798; Thu, 24 Apr 2025
 11:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Adam Dunlap <acdunlap@google.com>
Date: Thu, 24 Apr 2025 11:50:37 -0700
X-Gm-Features: ATxdqUGIuTwLTDSNyUbKYGoNyLKLWRGtlJpxGUkY1cttHUpB764Euv8UXTrMYV4
Message-ID: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
Subject: EDK2 CAA Page Fragmented Allocation
To: coconut-svsm@lists.linux.dev, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been debugging a boot failure on VMs running under Coconut-SVSM
with 120 or more vCPUs. The guest kernel (on several distros) is
hanging while trying to allocate a 256MiB memblock out of "low" memory
for the SWIOTLB.

While debugging this, I noticed that the memory map reported by EDK2
has a ton of entries. There are the expected reserved regions, but
then there's a section of about 2x #vcpus where there is 1 reserved
and 1 usable page alternating. It turns out the reserved pages are
allocated as CAA pages and then usable pages are allocated (and then
freed) as VMSA pages at this[1] point in EDK2. Note that while these
pages are allocated many times over the various UEFI phases, it's only
the CAA pages from the first allocation that are getting leaked.

I had a few questions that I thought someone here might know the answer to:
1. Is UEFI supposed to keep these CAA pages allocated? I believe that
UEFI is supposed to be able to talk to the TPM post-ExitBootServices
and that would likely require CAA pages, but I might be missing
something.
2. How are the other CAA pages being freed? The commit that adds the
allocation [2] does not add any corresponding frees
3. If everything is working pretty much as-expected, then it'd
probably be a good idea to allocate all the CAA pages in one big block
so that they just take up one big entry in the memory map.

Obviously a large/fragmented memory map *shouldn't* cause the guest
kernel to hang, but we have hit issues in the past related to this,
and blowing up the memory map from having ~10 entries to having
several hundred does not seem good.

Please let me know if this memory map pattern appears on other
platforms (maybe I just messed up the edk2 backports) or if you have
any other thoughts about what might be happening.

[1] https://github.com/coconut-svsm/edk2/blob/69d7c826dde066d389e0ba76112b75f4259584eb/UefiCpuPkg/Library/MpInitLib/X64/AmdSev.c#L144
[2] https://github.com/coconut-svsm/edk2/commit/a010681f74c9110a9e8e1753a98c13743b60f7f7

Thanks!
Adam
