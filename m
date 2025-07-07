Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F8B289808
	for <coconut-svsm@lists.linux.dev>; Mon,  7 Jul 2025 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887478; cv=none; b=oeVqdM41HBYw0f017WDRgTDCSUxVS3vCSFPxkW4Kcxc8Mkjy4p8S6H5lv2Gen0HVggkM2vXwV6lbZd6WWXFYe0bfskauJVyF2PtD77eRjDnDzeqtG7pscmd1PTJdhgE2YwWWyAlRCgRBvOA3r+2mKckWWd4PoV3YBnEJNV5WLfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887478; c=relaxed/simple;
	bh=wh2KSgb0irKa6lPpDAe8sHM4XdVTf50LEBUzhMgkMaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cn3FaF+omWBJz5D9HdhHJlwm4i/U0xAa9Gm5pNnGiR9gFZFQCc0X45SVB7AA1ZxjPi7WADC0ExlW5wtfCX7fpcTxSIc5rQT3eYL2MnR3Z71Cf3lHd5uR3UJg0X2Q/zcMoNxAvUq6IMti2IJ+hApXfZ+oQcvjpUBw5AhgHmf1OWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V29S7lpN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V29S7lpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751887474;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mt2KE+i859rVEYYNnLiy5IBOByRxRFQTsDiWdKTrfaQ=;
	b=V29S7lpNi4V1F1sVU9+GsRyC5AybNK8Ivq2XSeP65jw2tfJSTWQD+8x6Ko5J2EzQh5W9bm
	lCzV/42HY6WeGiMs5CsTHyr85olshI7RNWKGjv0Jg83NXXWQUpYiyd6Nu71naBfHqK8f7S
	+xZKlqjwRCyLyZacW1PuLphd6iJTlPs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-ZNgJESM9PzKIiJpxHzStDw-1; Mon,
 07 Jul 2025 07:24:33 -0400
X-MC-Unique: ZNgJESM9PzKIiJpxHzStDw-1
X-Mimecast-MFC-AGG-ID: ZNgJESM9PzKIiJpxHzStDw_1751887472
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4D3E1800290;
	Mon,  7 Jul 2025 11:24:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.155])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C322319560AD;
	Mon,  7 Jul 2025 11:24:29 +0000 (UTC)
Date: Mon, 7 Jul 2025 12:24:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jakub =?utf-8?B?UsWvxb5pxI1rYQ==?= <jakub.ruzicka@matfyz.cz>
Cc: coconut-svsm@lists.linux.dev, pankaj.gupta@amd.com,
	thomas.lendacky@amd.com, sgarzare@redhat.com
Subject: Re: Steps towards live migration
Message-ID: <aGuuaV8kAGhKhof_@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <DAXD0VKXZ7KH.2WNLX124KC7HZ@matfyz.cz>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DAXD0VKXZ7KH.2WNLX124KC7HZ@matfyz.cz>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hf-gekFVm11tiMTZvFwPAMKx331CtbeWluVJji40rb4_1751887472
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 27, 2025 at 03:45:56PM +0200, Jakub Růžička wrote:
> The QEMU patch[2] implements communication with the SVSM migration handler and
> block transfer from source to destination. The idea is that creating the
> communication channel is all the hypervisor should do, the rest should be done
> in SVSM.

QEMU normally has device state that needs to be preserved across a live
migration. If this isn't done then the target VM devices will all be in
their initial state from after a machine board reset, which won't match
the state the guest OS believes the devices are currently in.

I very much doubt QEMU will want to support a new SNP migration protocol
and monitor commands, as opposed to integrating SNP migration into their
existing protocol & monitor commands.

Also this migration memory transfer code in QEMU is completely single
threaded over a single channel, while QEMU is moving towards expecting
multi-threaded and multi-TCP chanels being its baseline. Achieving live
migration convergence with only a single thread & TCP channel is often
not practical under highly loaded VMs.  So ideally any comms protocol
for QEMU<->SVSM would be designed to enable QEMU to transfer guest
pages to/from SVSM in parallel across many threads.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

