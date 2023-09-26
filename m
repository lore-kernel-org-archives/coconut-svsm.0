Return-Path: <crobinso@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 17D561A21CC
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 17:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695742446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHBQDKrNsz+fOt0vmhfyIInXju+Z68vko1h08CKsjmw=;
 b=fSLKB97IT8g/xoicp3Xm+qDQuszji3c0tVzL3LKwcQFDcOIb+3pOKY88b6wvTRD0jnueNv
 z5elBn4CgKtpSXF+IbAHL+lJEv0FLyNMBXMYQdkB4Yd/XnnYAbAHN7H1q53txIDTwoghuv
 P6lrhTQB4elyLOGhx55zv0KtCHTkG4k=
Message-ID: <4ed6003f-c49e-3e02-b807-32939fa62b4c@redhat.com>
Date: Tue, 26 Sep 2023 11:34:03 -0400
MIME-Version: 1.0
References: <5d1197e055790683c7653272d5f1ef7e5f9e576e.camel@ibm.com>
From: Cole Robinson <crobinso@redhat.com>
In-Reply-To: <5d1197e055790683c7653272d5f1ef7e5f9e576e.camel@ibm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [svsm-devel] SVSM guest setup
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

On 9/26/23 12:08 AM, Claudio Siqueira de Carvalho wrote:
> Hi everyone, 
> 
> I have tried to reuse the AMD linux-svsm scripts to create and run a Coconut
> SVSM guest (ubuntu or OpenSUSE), but I haven't had success with that.
> 
> I updated the linux-svsm/scripts/stable-commits file to point to the Coconut
> qemu, linux-guest, linux-host and ovmf; however, I get a segfault when I use the
> launch-qemu.sh script to run the guest.
> 
> Could you share how you have setup and run the Coconut SVSM guest? (including
> what distro you have used in the guest)
> 

If you're on Fedora host, we have packages you can use in a copr repo:
https://copr.fedorainfracloud.org/coprs/g/virtmaint-sig/sev-snp-coconut/

Usage docs are in the web landing page. VM creation isn't covered but it
was something like:

wget
https://download.fedoraproject.org/pub/fedora/linux/releases/38/Cloud/x86_64/images/Fedora-Cloud-Base-38-1.6.x86_64.qcow2
sudo virt-install --boot uefi --os-variant fedora-38 --cloud-init --disk
Fedora-Cloud-Base-38-1.6.x86_64.qcow2
(inside VM: login, dnf update, enable the copr, install kernel-snp-upm)

And then follow copr instructions. Once you've got a guest booting,
start swapping out packaged components for locally built versions as
needed, like passing `coconut.sh -svsm /path/to/your/coconut.bin`

- Cole

