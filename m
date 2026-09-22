Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC535CB7F
	for <coconut-svsm@lists.linux.dev>; Tue, 22 Sep 2026 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092787; cv=none; b=V3LyVwZa9ZPd3Whdtjf/2lbeiDmY+LTrKyrpVIkWkKJ2fL1BiN4t2wbJWg7/QXK6zN8eVCoRvzJgvirbb9wjPy4P5Io4/Y7fCvbb7S7sPtS2NUjEasTTlCeCc2ekkU9vHarIJM/EvQD9tIqMuwqp3AT7VkKX+tpUDHwCMrdp1SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092787; c=relaxed/simple;
	bh=E8MOFpzbt1QnCvl7PyBeS49aMyS3+spMzp0KDWR4X+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=gnRSYkaOtNIWm2kzf3b/8dPeitQwkkNBts95l9MnjrzBahBetk5AS5rrXQ4Ewxm6SfP22jb3e4UFiSb8AhHo8cxJbeds9IIHMrbpnnrTm5DSt9y5hqAV4brViZ+3t9nmQIUWCGCfDioRqja4HRI1WKzrfr7yjQRAPR3A7gCZy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmccH4Ip; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmccH4Ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790092785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=YmccH4Ip0DMlNr7+EU0LYFOCxdkDLxR8xboVSjwatFtOGeNAcMHBko7fozucIGnDfaqYos
	cGtd3N1JvaDlVYAOLeKAkOSlPHsfgzL2UdFuGGydH30rjl1vqoQhFnEamtP9op0rBVl47h
	cF5m/1+CwPqVXQPLmvVIMj6XG2z9CS4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-4XX5jNHWNAWdQKdDtfchvQ-1; Tue, 22 Sep 2026 11:59:42 -0400
X-MC-Unique: 4XX5jNHWNAWdQKdDtfchvQ-1
X-Mimecast-MFC-AGG-ID: 4XX5jNHWNAWdQKdDtfchvQ_1790092781
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so102858a12.3
        for <coconut-svsm@lists.linux.dev>; Tue, 22 Sep 2026 08:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092781; x=1790697581;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
        b=wKq8iZsudVIb7B6GdNg2AUV3d3xFE8uqD0wfynNkp3FO/G3U83O8NTd06RAgk0zyKp
         g9qm0Ekfg/QxetO8RPgYYF0GvAa2/RC8eaDAtsAALOBwf1sMVW+XI8vyiRvFLKbUkA/Q
         lyG11MxEHRpbT82QlHLDrmV/AnP//iSCCk0pL61533uORegsPYQ+d6kCCf9wIK3bwm8G
         Exi8Yet5Nq1oOoiJRcy3nvW4lmgDnzYIqS5Z6QFV57M0IdpHvUQnnfrYrVkvU3/UhKeD
         JQ4rRyZM1XEeD06XrvavDxlPyOaCNFepX1DcpaEYpSafrWNsEGBZVaoFcs0pkCeoqFmC
         FFkA==
X-Gm-Message-State: AFuF++lnOk+dm8YHs0848+oNsg0JD2yDZVmxyKxNAlU59W9fictInvL/
	YmM1Slntdl1cJHxPDeRAAkEW3sYwpfmXR1vKgydzU8adPSUF6x0JiIE9zgvpLQcuyVErT4yOT1B
	fRju3Yf4/7uwVFZir0r6iZ/kvuMEMC6JgSLgvzjlxzb9ySl1LF8GVOs1Enu5ymiY8vhP+voL86W
	gohQCOaT5N1Uk3k0h1omOS3gpgNF1KZ0rsHEVUlJohD4dZdu0y
X-Gm-Gg: AYBFou1CJStV4aOnSeUV0e2iv8cB3rJFQH6HaMEc9s1X8P/CcmZzTXXNjlrQHCqlnuL
	b/exm7y30X+rUBcH/XXqr6Ug/XDci+lVRDeCfpvFDcNiZbRzy7K4e7xsJOc9234ClxrB1rxs0yI
	V5JmV2WYIcTIu8vO0L5sWbuXmZGE9ijY2T2qz8k2uAJSb/qx180nsQgXAu
X-Received: by 2002:a05:6a20:d526:b0:3dd:85a8:4c66 with SMTP id adf61e73a8af0-3ddec802477mr2206226637.45.1790092781107;
        Tue, 22 Sep 2026 08:59:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:d526:b0:3dd:85a8:4c66 with SMTP id
 adf61e73a8af0-3ddec802477mr2206192637.45.1790092780548; Tue, 22 Sep 2026
 08:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aqlXypyTlhuLRVmD@8bytes.org>
In-Reply-To: <aqlXypyTlhuLRVmD@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 22 Sep 2026 17:59:28 +0200
X-Gm-Features: AcwNN1UzOxzA_QV00w6WlKEqf_x9wUBx7h1CvyARLQDIWsvRBVgvTGxmza6xyLw
Message-ID: <CAGxU2F4VaSUGe7QkhqCm2=AzcYxzZqgxm+yjk=QTRkUTxq_3Ew@mail.gmail.com>
Subject: SVSM Development Call September 23rd, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _OrbnLaNPvucgsUMdiWIrw9JGlFKX_89PDGC6cau2wE_1790092781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Ciao,
Stefano

