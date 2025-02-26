Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B0A3943AAC
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Feb 2025 15:05:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740578700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MrIvhhlZ2/nr7vA0MkcyqNJwjuNWYtwYOPhy37qyolM=;
 b=A6nI1GiFHM0BP/tGxSya8ObxXkZ5p/7qjYf5YgZQH5e8/PhxAqhilCN9/7/8QsY7uwN4hH
 I9Q86bcKhwSVEOlMHnjEBVWYKo+B1gG1Yi19byXpEknXNCDHXvPfVs5lMojZLhZQJg+XGi
 5qPl0I04dFIWE3XuHURYyLkAAacgNA4=
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38f4156f3daso5264000f8f.2
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Feb 2025 06:04:57 -0800 (PST)
Date: Wed, 26 Feb 2025 15:04:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <CAGxU2F5N7MrLU_Wsr0D1nBS_C=ojjm-NUmf5_a00j6+jiuDtJw@mail.gmail.com>
References: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [svsm-devel] Using a linux bus for SVSM devices
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev

Hi James,

On Tue, 25 Feb 2025 at 20:27, James Bottomley <James.Bottomley@hansenpartnership.com> wrote:
>
> It looks like I'm not going to make the next SVSM meeting, so here is a
> brain dump on how the linux bus type for virtio works.  Basically it's
> a capsule for matching (and automatically finding driver modules) for
> discovered devices.
>
> The way we should use it is pretty much the same as virtio (see
> drivers/virtio/virtio.c for the bus definitions).  There's also a nice
> series of blog posts which documents this:
>
> https://www.redhat.com/en/blog/virtio-devices-and-drivers-overview-headjack-and-phone
> https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
>
> The only real difference is the configuration signalling, which is done
> over a pluggable configuration interface (which is either mmio, vdpa or
> pci).  The SVSM only signals over the architectural mailbox API as
> defined by the SVSM API Spec, so we don't need to bother with the
> config_ops and can use a simple static C based API instead.
>
> So I would say we copy virtio bus type, pretty much, with the standard
> groups, match/probe/remove and uevent for driver binding and put it
> under the drivers/virt/coco (or we could go with a new
> drivers/virt/svsm).  Next we simply need a defined API for calling into
> the SVSM (so something like the AMD abstraction which hides the calling
> convention) which we define in a header instead of using config_ops.
> The body of the API would vary between architectures, so the
> implementation would likely be in architecture specific code.
>
> The only other question is what we do about device IDs.  I'm strongly
> tempted simply to use strings, but all the other code does use fixed
> length ids, so we could probably follow virtio_device_id except have a
> single u32 for device_id (I've no idea what virtio uses vendor_id for
> since every driver I've looked at leaves it as a wildcard).

Yes, I also never saw the vendor_id populated with anything other than 
VIRTIO_DEV_ANY_ID.

>
> The final thing would be to think about interrupts, but since the TPM
> driver is strictly request/response, we can defer that until we know if
> the observability driver will need them or not.

Thanks for this report!

IIUC the SVSM vTPM driver will be the first one using the new bus.
Since I have the new version almost ready (need to finish writing better 
commit descriptions), do you think I should post it in any case as RFC, 
or better to wait to include also the SVSM bus?

The current version is here [1] but it still uses platform devices, even 
though I removed one as requested during the review of the previous 
version.

If no one is working on the new SVSM bus or planning to (don't want to 
step on anyone's toes), I can try adding something to that branch and 
send an RFC here.

Thanks,
Stefano

[1] https://github.com/stefano-garzarella/linux/commits/vtpm-svsm-upstream/

