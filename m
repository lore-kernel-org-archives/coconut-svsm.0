Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B555E430F6
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 17:40:05 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so281607566b.1
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 08:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740156005; x=1740760805; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RbVNEqIY5XySJ1MXHryVOOGY3XYhnWvwM5A4E2366EQ=;
 b=wjnKl5wErMjbE69gIYTrtmvxXZlE9qFhtQPjZpHn6W6pVnWsS9cFOr/uEIjhs3bOKR
 4A10D2w2Dmh9QstkUd4m+U3lz1qBrSE/ui10mY32XkfxHrzkjRSorqI2Z8iyl01SRJKu
 3PJ0zXKx6GK0s1krmoVPePC6ywpeZvD7t1+AlVSUoEmRStt+5jrIG8iGNXLPUJtb3QWA
 E0LJLFktmw2y+dfOlP61JRGPiBTNEGujErBHEFPMQC3c9gNbesbzOcuTXfvAV/knrVw5
 VN9GSYbJXPlpeDVH1kW/Z3lovqYZwloPiorOVMXHCFDYun4jkt8dVPBTfvZ//sumpQag
 Uu5w==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
In-Reply-To: <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 21 Feb 2025 08:39:51 -0800
Message-ID: <CAAH4kHay7jEbjpV19BG6Ghsr4fy2Gxce2Ud6Gtc3QPX4aYgTjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: svsm-devel@coconut-svsm.dev, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

> I'm not sure I exactly understand the proposal, but I think it's that
> the type of endorsement key should be part of the input data to the
> vTPM protocol attestation?  In which case I agree.
>

Service attestation has no inputs other than the service guid and
manifest version. If you want the key type to be an "input", then we
need a service guid for each specific EK algorithm. We can treat the
existing guid as for rsa_2048 if you prefer. That makes this an
extension request rather than a change request.

-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
