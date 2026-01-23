Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06899346AD1
	for <coconut-svsm@lists.linux.dev>; Fri, 23 Jan 2026 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162560; cv=none; b=MYXslO4xzQdtcOH6uj8zY7rh8n73m89UYVNYSRaO411ti/Q7taHj240fgW0KFZ4VUkbfgfPBXBeBltfgB2dUXcpA4sis51EdwaEcvdjfL3LKRMvk95Z/rCZUQ/U/9Okn8M0nqOWzH2REWVl4wr5qElzxc+NlpU2EcWxJal8h+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162560; c=relaxed/simple;
	bh=luNi3GnVu+moLXEy6CGebr7/a44DQ7Fu+m2zmHnxzjM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CBKVa5cMFMSDWGhnZvtBzQNnfEnGm7J/A1egwRm40qY5H/YzszztnoCzOK22Redbxcl4jJNuYZrUetNj1AU5J19NjWBy9YYcxqlgcSagGZs4UrEKphBgTSIST8bRK+KzKijFMVDcIl3poAKIgQviRoPRqakdrg4xilPoVKHAUv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dJjHA0kH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dJjHA0kH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769162551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=luNi3GnVu+moLXEy6CGebr7/a44DQ7Fu+m2zmHnxzjM=;
	b=dJjHA0kH8P6WN0J6ugNXLmc5QuA79HjtTgAHR8G+zn1LtNrBm5jndksP75uzC/qRc7SWuI
	YInfBFeWOfLf8Urqen9vN66sz5JgPTUh0kAPDpjjWWTQpsepbkZRpwMBhV8lRInNgrJqUG
	kNb7noxGwZmdTiN8QSC/YXyEU29J7iY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-_5zag9V9MeK5opPRZ0l5vA-1; Fri, 23 Jan 2026 05:02:29 -0500
X-MC-Unique: _5zag9V9MeK5opPRZ0l5vA-1
X-Mimecast-MFC-AGG-ID: _5zag9V9MeK5opPRZ0l5vA_1769162549
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ec823527eso3261492a91.2
        for <coconut-svsm@lists.linux.dev>; Fri, 23 Jan 2026 02:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162548; x=1769767348;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luNi3GnVu+moLXEy6CGebr7/a44DQ7Fu+m2zmHnxzjM=;
        b=RkvpKT8xBR+ox3EiIgJ+yaWEiQwta7G3uXMfrvy5ArGIhcFzhw/7wQf4TBH1lxNFpr
         /mbLtfo1jkj5+DZtgXRde9NfwalUp4kovetmF5anzGjz+T4SBZ8TEkpCVlnfHAhEvct5
         26RHMuNhAoEKT+UjZsYQN7SlQ8GmT6pWNhm8q3KD1vqdIMX5vWbsDITKh1B4k6kCk0In
         FkApYjDFQ6NtHxPzmu45chLawwaOD70BbuM++fbxTufOelsN2+PrRv0VZ0Nofgwer9b6
         6g69RMUszG5ZzVK1lWOmTfKtDFMBJAJGhsIzveeQlX50qDDqxBCCNOzvItwJhFLZeVKN
         j+RQ==
X-Gm-Message-State: AOJu0Yw9zZtseO0j30XqRabqGVzACNLhMdR4frE7J3Yd3IMz9v2zv6R7
	/s7nz9OAkctRNNxsoSaxH3QfBvxOxj54bUOPEVJyhEHxHONLSOFkUJ1KwWv7WYkvMs3ivEg0HJU
	nOE6A+srZ34Dj8p8rYk3bUoK/D2JseGrLfL1rQmyCLTSo8gHXunj7qjULhHiFh2UpKw/nzKNOo6
	3floWpxUTDrkfOnF1t1hWXBwWxN9GAlKTHMDo6z00OmLNVZpBdBM8=
X-Gm-Gg: AZuq6aKxyuw2j3aWyJ2MlKdN7TUCFDTdMtECS46MjGqxezOV3zzrIcV/y6cXGTi5mcH
	ofkW5nCI9byVMfN8b0PuN47S1pB/iojpKZSdKFi3PvsADRzQqsuplNns7uZgEKF18KBXukmqfpV
	gwWhS98YOcPuCU0xkl1Na9JV4IyY2HAEdPRCtBmx7LOmZ9jBhWwQnBTNCm0SyIg1us
X-Received: by 2002:a17:90b:1348:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-35368953087mr2369706a91.17.1769162548658;
        Fri, 23 Jan 2026 02:02:28 -0800 (PST)
X-Received: by 2002:a17:90b:1348:b0:343:60ab:ca8e with SMTP id
 98e67ed59e1d1-35368953087mr2369673a91.17.1769162547622; Fri, 23 Jan 2026
 02:02:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 23 Jan 2026 11:02:16 +0100
X-Gm-Features: AZwV_QhRPOrSloqYfipemuziVP4O5-vRHqt3boZlB-TpsZI_fjVtOFRzvdKT0Ng
Message-ID: <CAGxU2F6xrPvgoD1+i-S_7Snj3zfZ0iCLXfc7JBf8mZPZi+GMLQ@mail.gmail.com>
Subject: TCG TPM license issue
To: coconut-svsm@lists.linux.dev
Cc: "James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>, 
	Daniel Berrange <berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pS5B5sWt710duySLkg8tdLWFi1PDHMSc4qslj1llUKA_1769162549
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,
it seems the license of the TCG TPM reference implementation that we
are using to emulate the vTPM in SVSM is not exactly BSD but a variant
of it.

For some distro, like Fedora, this could be an issue. See
https://gitlab.com/fedora/legal/fedora-license-data/-/issues/716

Thanks,
Stefano

