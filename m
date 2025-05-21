Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BAB22A801
	for <coconut-svsm@lists.linux.dev>; Wed, 21 May 2025 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844181; cv=none; b=Jp8KpDkPxovxb7p6Nf4d5tee7sWGq885eTMqHeDmxSR95LtGPA0wKZoZawOlOfeIsy0aKY2IcZltzPrNwHeNqh2GcGySzEZ8Nhn/TATf8cOOZT5yzFNdyzrVmMStvR5bDOInjALF2qtY+ftv1PZmeBBsfPMDT4fOA9TZQULhXTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844181; c=relaxed/simple;
	bh=nU9rszlY89GBHhfjPgQSoMVDENikmfEhy3sR3r/E+/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKk9QqlxpCbFiz/cMZ9UtsTGXX+PlOYiehBjkqzyUgg44KaVIW1jMT7/WAZGf9Ng2aZ43fe6dHILP6SzHhRyboJU3iUvcMIARs+ofDuMBOtVbueqKltDRlXR0sK7owRmAbCSAq3aDhRnz3N0m6cIrSSp6o0oluKlqyxd5igLEU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qwl44O9b; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qwl44O9b"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231ba6da557so739985ad.1
        for <coconut-svsm@lists.linux.dev>; Wed, 21 May 2025 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747844179; x=1748448979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2iBJJ5xkD2kwGPlBJV2QuLn+CXhSIertJTMoCvStgE=;
        b=qwl44O9bFkVuSV7czbLrWPRys5oqKf0libwpX/PSyhHOQzATgrD0ItHtEcbt1L0fQd
         h/5qqaYXnF6Ya9BigyUTkXVI992ob+5KumoRTDn5+kV7lwqGERgPVPLiFEwXhxQmbhzE
         solsCn0HVhSelAn49+7kavu16Q5a7+QxF/5PAbaGbsv/0ySXdsa/91niEhviYw2xvsWW
         hA0G8coTPac4RX+OJnekzaurdsICfZBzUUj0Dky8nXzxHMKdyeZq3aBkDhzKleDMpppH
         KGo8+dqVjIJNTJkiR0zHZCfhgtUWPWhnjYd67Ou1PM6+HWP1yGGdtNs6QtuchqZKhKJI
         pXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844179; x=1748448979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2iBJJ5xkD2kwGPlBJV2QuLn+CXhSIertJTMoCvStgE=;
        b=OVtLmcQ7N9R3NF2HLCT1ZGLWzq9pY+YTQ6pM4977IMiftKUE6AK/HsEhX6ORo/+9AJ
         XdRyp0p14OTxkhMNt3WtCtUTYg7QuosXWvB+rmUDpxSzTuVhXKOVIYthIEMuZiChVNd6
         6fGMll5NUB9cv6SY+pi6EJnEEUXGURqgBfQ9fMpYbDpGe4Qdu+Pq/w26kxQ3lpCGya1Z
         2/ykDV88diZ8pnzc/QfT9xpVcupFn7PsbTnL+8KPqpyugtmgBv4ap/jQfJ72r2b2wSpP
         XV6lV9fSWzHRy/n9ix4bJGOd2JBj5RHVCsjsdMt8UoqXmwnI5Z0tWV++HI1Q9B0YPILQ
         EPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU600VX0gZ8pp8cDe+9r0VuLkFwoEAoiLEFKTpajyfigIgOl9AnocZ4fz9b8W23wBZOFp8VqOTq80D2xBI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfpjXYxQG/fTliNPOxBtu33l3+iXm6fqslunZB/ou62Fc0+c+E
	tDzXK2A7uaN4YNRwE5+8/WsOszt1CRoaE9hzoF57IMbHF8unl0vLJ4610ZINYfIaAJdi+DReQ5a
	pp12Vb1TC/Rs4PPAlqnlJ+Xef9o3zW+eWrBAHyFCC
X-Gm-Gg: ASbGnctfDNOiqTkty+dgMaqK0hLsO2shb1hzCOTtGHfPXCvZawyMff8/L2TzjYUmwT+
	TP2w43njR80VqTI2ZkpPKX/hZS8IVsSltd6z7zAUX1HhP+BhSrcx0S3WZBSgbS/LJ+/IvIZPdsY
	o/t1Ku5QyH8GGKE45d/LqHyxcB5hrqTsQy1mkOQAI1i2kk32ifnNKglOM+UM80BcXdr3ahlJcky
	w==
X-Google-Smtp-Source: AGHT+IFQD1i0FzoMV5Ck7cvjnbCULr9LfZWOsYzTHNrl4uiZiE2oatcMb30n68IYHiZl6rEjbZEtifhNOttzmFT2OM8=
X-Received: by 2002:a17:902:ec8e:b0:215:7152:36e4 with SMTP id
 d9443c01a7336-23204165a6amr11402165ad.27.1747844179206; Wed, 21 May 2025
 09:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
 <SA6PR21MB4303A1AE51FDC2CC8A83A779CA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <3molncndmeeajso7cuyhx3cmt36wsx3lvsqurch54htvf7ngal@6e67qqyfbtk6>
In-Reply-To: <3molncndmeeajso7cuyhx3cmt36wsx3lvsqurch54htvf7ngal@6e67qqyfbtk6>
From: Adam Dunlap <acdunlap@google.com>
Date: Wed, 21 May 2025 09:16:07 -0700
X-Gm-Features: AX0GCFtMN9SMPXlpYcDyA9IXotUINZ0VXNfdu3dID2DugzZSarlAxT0vLeLoiNo
Message-ID: <CAMBK9=YnAv9kGCrF3uZj+u4KdA8yDHs21Oo67sZM=G0KQJ8F-Q@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Jon Lange <jlange@microsoft.com>, 
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, 
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025, 4:20=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> wro=
te:
> There is no trace of any explicit PVALIDATE calls.  So I'm wondering
> what conditions might cause the VMM do actions like that?
>
> One possibly relevant detail is that the linux kernel and the uefi
> runtime use different mappings and different virtual addresses to
> access the caa page.

If the guest accesses a GPA with the c-bit disabled, then KVM will
rmpupdate that page to shared. If the guest then accesses the same GPA
with the c-bit enabled, then KVM will rmpupdate it back to private,
but it will be unaccepted and thus give the 0x404 error. I've seen
this happen while investigating several different bugs.

Adam

[ re-sending this email as plain text ]
