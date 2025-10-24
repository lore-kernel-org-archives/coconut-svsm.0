Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC97314B80
	for <coconut-svsm@lists.linux.dev>; Fri, 24 Oct 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308237; cv=none; b=FmF4zfU3ZCUEjIk9lnNQ8JADoy/plfGuc3KgH4igXmWHIK9PQtVoMIdItwKR6Vz4LB9eV4y97+rQgSTtnEJ9/mXNmmjU99xOJpWr1bLSsTD0CJoOHcX6Ztd/qXLOSNYRtPmodvZhIT6k7cqQ+kdA0y/taJnjYttnRhtZ59YR6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308237; c=relaxed/simple;
	bh=/3GSGogqY3xV83hDwhIPYc3nGKibMsWnRMx/yJ1Zxfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WLXmMz60em4v6skX2gABJzCKJhBNvJDkZ/tvYvFmb0jvd4nGNT0dU4HSMk6idCIAqWZSpWm7tvm0Rqn9jirki5ee6PGPTSBrBf2LxBeeQw7LFpn7HqgqnC664UI6fout9x0Uy9vM5fx+wcFMfxkGfY89OcVXK94BumxTZ8b4c4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmsQCHNM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmsQCHNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761308231;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqwFcp+raFkUBKSrlIur1ganmxMLFB+NmugMcH+CLF8=;
	b=cmsQCHNMqBFu01KQgauWYgTZSBqK/rcS81EpcAavo+GoRI6ZOD8ULsZN7Be7WadQFJ2IlX
	PMVFuo66Yfkx6PDgDTI/dmj/NpUe+UKelEeoRETQrDK2gSJPm50HwZAnRdypFk6WDcX5xj
	+mtglP43oNNZRhM09VPdzbjkMtyS9Qc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-e9W0kQHbMM2dKsBs7TFY0w-1; Fri,
 24 Oct 2025 08:17:08 -0400
X-MC-Unique: e9W0kQHbMM2dKsBs7TFY0w-1
X-Mimecast-MFC-AGG-ID: e9W0kQHbMM2dKsBs7TFY0w_1761308227
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE59A1800BC1;
	Fri, 24 Oct 2025 12:17:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.2])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E9E419560B5;
	Fri, 24 Oct 2025 12:17:03 +0000 (UTC)
Date: Fri, 24 Oct 2025 13:17:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Tyler Fanelli <tfanelli@redhat.com>, Nicolai Stange <nstange@suse.de>,
	Oliver Steffen <osteffen@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	coconut-svsm@lists.linux.dev
Subject: Re: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
Message-ID: <aPtuPM9QQni8okIr@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
 <87o6q96w4c.fsf@>
 <fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
 <203dfa61-dd55-4fbb-86d2-c0cef55eaf27@redhat.com>
 <8d76ade860b2ccc2ffbed5a5e6f73a8357776522.camel@HansenPartnership.com>
 <aPJI_5t8IO_zVM3P@redhat.com>
 <8a720c17406fc361e5fed7bc7f682801eb5e609a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8a720c17406fc361e5fed7bc7f682801eb5e609a.camel@HansenPartnership.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t0tg2Sj4v6oCWuT6JFp-rXoST-OacXSd36DKNkY7Bis_1761308227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 17, 2025 at 03:48:38PM -0400, James Bottomley wrote:
> On Fri, 2025-10-17 at 14:47 +0100, Daniel P. Berrangé wrote:
> > On Fri, Oct 17, 2025 at 09:25:18AM -0400, James Bottomley wrote:
> > > On Tue, 2025-10-14 at 21:33 -0400, Tyler Fanelli wrote:
> > > > On 10/14/25 5:40 PM, James Bottomley wrote:
> > > [...]
> > > > > On this, how does the guest know it's pulled in the correct
> > > > > image? If I were a malicious host, I could encrypt my own TPM
> > > > > image, accept your attestation to a KBS I control and release a
> > > > > key that decrypts my malicious image.  I think you give the
> > > > > answer below:
> > > > > 
> > > > 
> > > > We intend for the guest's rootfs to be sealed to the persistent
> > > > TPM found in encrypted storage. The malicious host could switch
> > > > the TPM, but that TPM wouldn't be able to unseal the rootfs.
> > > > 
> > > > This doesn't directly prevent the attack you mention above, but
> > > > it would be a DoS.
> > > 
> > > Not necessarily.  If I control the host, I also control what you
> > > boot in all stages.  If you simply take booting up as proof, then I
> > > can substitute both the KBS and the boot system, so you'll boot
> > > with my image but if you're running a trusted service in the VM,
> > > it's now my service.  An examination of the launch measurement by a
> > > trusted KBS would defeat this, which is why I substituted the KBS
> > > as well.
> > > 
> > > The point being that there has to be validation on both sides.  If
> > > you want a KBS to deliver a boot key by which your boot sequence
> > > continuing is your validation, you still need to prove that you
> > > contacted the correct KBS in the first place otherwise your launch
> > > measurement might not actually have been validated.
> > 
> > For protection aganist that threat the guest owner would need to
> > validate either the TPM identity, or the root FS identity, or both,
> > once the VM is first accessed after booting.
> > 
> > In the root FS case, systemd measures the primary encryption key of
> > any unlocked LUKS volume into PCR 15. If the user has prior knowledge
> > of the expected hash they can use a TPM quote to validate that the
> > root FS volume has not been substituted, and in turn that validates
> > that the TPM state has not been substituted as the LUKS keyslot would
> > have been sealed to the TPM.
> 
> I agree this would work ... but it's a who guards the guards problem
> and the above solution needs another guard to guard the first one (the
> KBS).

The problem might be pushed even further up the stack to the application
level. For example, the authentic disk image is likely to contain one, or
more secrets which cannot be replicated by the person substituting the
fake TPM state & root FS. The SSH host key is one example, but HTTPS
server certificates might be another.

> Another possible solution, which allows the KBS to be the only guard,
> is to have the KBS launch the VM, meaning it knows it should get a
> launch measurement back from the launched VM to release keys and can
> shut it down if it doesn't.

Injecting the KBS into the VM launch sequence feels like it could be
a challenge to integrate, if it makes the CVM launch flow significantly
different from the regular VM launch flow.

Overall the intent of the SVSM pre-boot attestation was to make it
easy to shift all workloads between traditional VMs and CVMs, without
imposing mandatory special steps on guest owners - they would want to
opt-in to full validation if their usage demands that level of extra
assurance. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

