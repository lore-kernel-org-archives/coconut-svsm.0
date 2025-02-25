Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com
 [198.37.111.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id ADEB841A0F
 for <svsm-devel@coconut-svsm.dev>; Tue, 25 Feb 2025 20:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1740511651;
 bh=vLuEqX20VcpwMfixBHjSSmmoeHRSdapWEDYaIrVVVpU=;
 h=Message-ID:Subject:From:To:Date:From;
 b=DZ9koJouo231pHZNW0cfPg1hwuoVuJdvNT+swcuHZQ1B4wt72iKbb0kaSWsPzAdS2
 TBfQK8mMOPr1zZsYyUqs9S1I3vUMw11/3D8jaE0wLsCeT8EcJB2/x2NJawNXjwOx0j
 mYxqbsXXxUiEqD2ft+PPNJnhgrlvCYSY8GAqKw/w=
Message-ID: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Tue, 25 Feb 2025 14:27:30 -0500
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [svsm-devel] Using a linux bus for SVSM devices
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev

It looks like I'm not going to make the next SVSM meeting, so here is a
brain dump on how the linux bus type for virtio works.  Basically it's
a capsule for matching (and automatically finding driver modules) for
discovered devices.

The way we should use it is pretty much the same as virtio (see
drivers/virtio/virtio.c for the bus definitions).  There's also a nice
series of blog posts which documents this:

https://www.redhat.com/en/blog/virtio-devices-and-drivers-overview-headjack-and-phone
https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels

The only real difference is the configuration signalling, which is done
over a pluggable configuration interface (which is either mmio, vdpa or
pci).  The SVSM only signals over the architectural mailbox API as
defined by the SVSM API Spec, so we don't need to bother with the
config_ops and can use a simple static C based API instead.

So I would say we copy virtio bus type, pretty much, with the standard
groups, match/probe/remove and uevent for driver binding and put it
under the drivers/virt/coco (or we could go with a new
drivers/virt/svsm).  Next we simply need a defined API for calling into
the SVSM (so something like the AMD abstraction which hides the calling
convention) which we define in a header instead of using config_ops. 
The body of the API would vary between architectures, so the
implementation would likely be in architecture specific code.

The only other question is what we do about device IDs.  I'm strongly
tempted simply to use strings, but all the other code does use fixed
length ids, so we could probably follow virtio_device_id except have a
single u32 for device_id (I've no idea what virtio uses vendor_id for
since every driver I've looked at leaves it as a wildcard).

The final thing would be to think about interrupts, but since the TPM
driver is strictly request/response, we can defer that until we know if
the observability driver will need them or not.

Regards,

James

