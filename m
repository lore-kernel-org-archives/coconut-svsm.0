Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA171E5B7B
	for <coconut-svsm@lists.linux.dev>; Tue, 15 Jul 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592041; cv=none; b=l4+VJTWVyAp0fFCO3WnCJeT9hLtoE5dotDCOxbT6VJdbnEGmGnsuEFgrawImOeLQqgS1Ib9ci0z9HuW0rtmF0Zd1oLz42nVKY5dXoRvIFmbSRX26pYSjBwnjTQ7a2UflXaMvb54upTmPhwENu1LnoiwDeaNYnLLZOMK5M0FlIKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592041; c=relaxed/simple;
	bh=OiUBPoY0DAHzw8d+KtYaNH0kSRUC/6fupZiFxFnHvY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gosb2xNNMQqQcTXq/67faWeUTj1YBXNBURcVO1zayE2nnt0OyJNmamzE2WY04TZEX+mvfDlNJ14oAnwnl8x6qp+O8WkVeU4yQNIe0ynx/0njECTUpZctmvZtfFxGz6kyB1xABIAI7lAmOkTSyLU6EKp78drsezEk1M5DQt0DIMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cBanjYnh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cBanjYnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752592038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5erOhrwI05E0mqSGdY2tucAmqc1QYuJmBFBxqV2fFFg=;
	b=cBanjYnhsD8eVVyMfjrPOf+yVZzXHgaHbT5lg1LoMd9ibZE62IEdFyIp/CuQw4zq8Kjtdy
	4eAj5dBKSLt1ibeF4wuiWK/F6h2NJju+Vw8mcZxVCrjcFj95oBPqoXKfLmZ7O8zbnEtTVa
	CsX8wowAZ+p/GgOPXb67lkL1e5gbFD8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-140-m4OLDDQePseNx4oMVWhDKA-1; Tue,
 15 Jul 2025 11:07:13 -0400
X-MC-Unique: m4OLDDQePseNx4oMVWhDKA-1
X-Mimecast-MFC-AGG-ID: m4OLDDQePseNx4oMVWhDKA_1752592031
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D20041800245;
	Tue, 15 Jul 2025 15:07:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.214])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 27F5E30001A1;
	Tue, 15 Jul 2025 15:07:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6FE6A1801556; Tue, 15 Jul 2025 17:07:07 +0200 (CEST)
Date: Tue, 15 Jul 2025 17:07:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jon Lange <jlange@microsoft.com>
Cc: "Relph, Richard" <richard.relph@amd.com>, 
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Message-ID: <757kuxy36oqteplwd3kussc73w6lqeidbu2rxmzladj3kio7ei@jider3lbnthf>
References: <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
 <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
 <auq7txxlerpwzl542o6rkjams22cy6rb2xoi3f7lbej6u47svi@rto2jldlvxyh>
 <LV5PR21MB5210915F19D877E261E66ABACA4BA@LV5PR21MB5210.namprd21.prod.outlook.com>
 <axljobcnpe6oct5v7edaocroajirywcft5z6lgtnoh3s6tj2r6@cux7zhrgbqnc>
 <CH8PR21MB5222CC6DCC81B272390F4ABECA54A@CH8PR21MB5222.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CH8PR21MB5222CC6DCC81B272390F4ABECA54A@CH8PR21MB5222.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LKto2IvTDCYsI9V6oOb1MlNQK9BwTkRwg5kuqPKMe3U_1752592031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 14, 2025 at 04:18:11PM +0000, Jon Lange wrote:
> > Huh?  I've assumed svsm protocols can work on TDX too.
> 
> In the past, they have suggested that such a calling convention is not
> needed, because the L1 can trap and emulate calls (including TDCALL
> requests), but I think there is now an understanding that this is not
> sufficient.  However, I am not aware of any active work to define any
> type of L1/L2 calling convention.

Ok, so unclear at this point in time what will happen here.

> I also know that for this specific question (memory carveouts),
> Intel's proposed direction was not to rely on an L1/L2 calling
> convention, but instead to rely on having the L1 place tables into the
> address space of OVMF before it begins execution.  This, of course,
> would work equally well on SEV-SNP or any other model in which an
> SVSM-type environment can execute before the guest firmware.

Well, there is the TDX Virtual Firmware Design Guide:
https://cdrdv2-public.intel.com/733585/tdx-virtual-firmware-design-guide-rev-004-20231206.pdf

Section 4.2 "TD Hand-Off Block (HOB)" describes how information can be
passed from VMM to the firmware.  It's about EFI firmware running on TDX
directly, without SVSM, but I think the same should work for launching
EFI firmware under SVSM.

> I know that Intel began investigating this work but I don't know how
> far it's gotten.

This does NOT sound like Intel wants reuse the existing spec.  At the
same time it is totally unclear if and when we get more clarity here
from Intel.

Hmm.

I see the point in having only one implementation for this instead of
implementing this again and again for each platform supported.  But
waiting for Intel until we move forward doesn't look attractive either.

take care,
  Gerd

