Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B52BE02B
	for <coconut-svsm@lists.linux.dev>; Fri, 17 Oct 2025 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708877; cv=none; b=aX/bcMOq85GWsnLbiFjA0hXSQOZNYsGE06b0Ue/jgiwpm3kx/vhvt1M0dFUuG13NcOVnTZgzkeyocAWjve0p7lAxWiaxe44hBi7G1LlqDGLZGnnW2lay1uFX3YuofPhVmHoKQuRTrrEDVeYu5FLmj24Nhn+YNCXF6JlQiFZDSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708877; c=relaxed/simple;
	bh=6ziRzJb3JmAMsdZPUyxEXGBRNnlGemTLSsEyP6Gtgp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iRozfP8J1660M5twAk6P1pVUV2K9/yhPrkzzveViVcN7Lf4HKOZQ/97sZziQt6/yBfCC3Y31le1GUhNsZ+fSmi+77VMPm9d+5J0YUe5EaQBmEUbCF9lKicy1iskkctBIc/u0eiV276dshxHhHm5o6iJYaMdmloec7K6JGR6TDUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XboUGPQy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XboUGPQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760708874;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cPYl6PwTgFeQBOhTsgzuzGEHAM4lgDxZgmgRlxdiBlk=;
	b=XboUGPQynffYG0/aiVa31VY/xvNfoG6/6I5l6cu4ypitN/FzDGmm5umxH3KiV/4fhkR+R/
	Cintryi8GWB4V9XnF3p9QkGBQDJddS1Wns0Svmx/u7zeMUI0sqRdScc3DxsUTbUupn5xHu
	w/XQUP2zZC+y6f5MkMUokC4hG0FxxdU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-9EehaXADPo2zMJIJzZ5ajA-1; Fri,
 17 Oct 2025 09:47:50 -0400
X-MC-Unique: 9EehaXADPo2zMJIJzZ5ajA-1
X-Mimecast-MFC-AGG-ID: 9EehaXADPo2zMJIJzZ5ajA_1760708869
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA5ED1954197;
	Fri, 17 Oct 2025 13:47:48 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.139])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB853300019F;
	Fri, 17 Oct 2025 13:47:46 +0000 (UTC)
Date: Fri, 17 Oct 2025 14:47:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Tyler Fanelli <tfanelli@redhat.com>, Nicolai Stange <nstange@suse.de>,
	Oliver Steffen <osteffen@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	coconut-svsm@lists.linux.dev
Subject: Re: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
Message-ID: <aPJI_5t8IO_zVM3P@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
 <87o6q96w4c.fsf@>
 <fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
 <203dfa61-dd55-4fbb-86d2-c0cef55eaf27@redhat.com>
 <8d76ade860b2ccc2ffbed5a5e6f73a8357776522.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8d76ade860b2ccc2ffbed5a5e6f73a8357776522.camel@HansenPartnership.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GIzD4kKt8MlplWUjt0mmCanqp87FLvpl2xRyauRes4o_1760708869
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 17, 2025 at 09:25:18AM -0400, James Bottomley wrote:
> On Tue, 2025-10-14 at 21:33 -0400, Tyler Fanelli wrote:
> > On 10/14/25 5:40 PM, James Bottomley wrote:
> [...]
> > > On this, how does the guest know it's pulled in the correct image? 
> > > If I were a malicious host, I could encrypt my own TPM image,
> > > accept your attestation to a KBS I control and release a key that
> > > decrypts my malicious image.  I think you give the answer below:
> > > 
> > 
> > We intend for the guest's rootfs to be sealed to the persistent TPM 
> > found in encrypted storage. The malicious host could switch the TPM,
> > but that TPM wouldn't be able to unseal the rootfs.
> > 
> > This doesn't directly prevent the attack you mention above, but it
> > would be a DoS.
> 
> Not necessarily.  If I control the host, I also control what you boot
> in all stages.  If you simply take booting up as proof, then I can
> substitute both the KBS and the boot system, so you'll boot with my
> image but if you're running a trusted service in the VM, it's now my
> service.  An examination of the launch measurement by a trusted KBS
> would defeat this, which is why I substituted the KBS as well.
> 
> The point being that there has to be validation on both sides.  If you
> want a KBS to deliver a boot key by which your boot sequence continuing
> is your validation, you still need to prove that you contacted the
> correct KBS in the first place otherwise your launch measurement might
> not actually have been validated.

For protection aganist that threat the guest owner would need to validate
either the TPM identity, or the root FS identity, or both, once the VM is
first accessed after booting.

In the root FS case, systemd measures the primary encryption key of any
unlocked LUKS volume into PCR 15. If the user has prior knowledge of
the expected hash they can use a TPM quote to validate that the root FS
volume has not been substituted, and in turn that validates that the
TPM state has not been substituted as the LUKS keyslot would have been
sealed to the TPM.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

