Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B3E092A903D
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 16:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730821814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+qVf2UrsVrrNJt8rHDjbTHpgFUox+tg9hTjPKjTSIA=;
 b=b2osv3zyK9vxh6ORaHB9Iikijugskzq9Pl+QL470P7l62+syEXN/zl9qXqy1BqgHOm278R
 4D+64qntmiDhkzw4uejcYX0RtpeMhDlTTBiBXTWtuSTemUBMSs2kw8o5Gr0LZHjqqaZt4U
 dmvwPKzrknzYSW4EA0c/bjlx9Hy/tnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730821814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+qVf2UrsVrrNJt8rHDjbTHpgFUox+tg9hTjPKjTSIA=;
 b=AsNYg2ta94F88PyKbyQU6d6cZqG2s5P6PZFTv84tFAOKvC2T8xyq6/7Kp/H5aza2pPG0F9
 dvG5Us/vAFCyPFBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730821814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+qVf2UrsVrrNJt8rHDjbTHpgFUox+tg9hTjPKjTSIA=;
 b=b2osv3zyK9vxh6ORaHB9Iikijugskzq9Pl+QL470P7l62+syEXN/zl9qXqy1BqgHOm278R
 4D+64qntmiDhkzw4uejcYX0RtpeMhDlTTBiBXTWtuSTemUBMSs2kw8o5Gr0LZHjqqaZt4U
 dmvwPKzrknzYSW4EA0c/bjlx9Hy/tnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730821814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+qVf2UrsVrrNJt8rHDjbTHpgFUox+tg9hTjPKjTSIA=;
 b=AsNYg2ta94F88PyKbyQU6d6cZqG2s5P6PZFTv84tFAOKvC2T8xyq6/7Kp/H5aza2pPG0F9
 dvG5Us/vAFCyPFBQ==
Date: Tue, 5 Nov 2024 16:50:13 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <Zyo-tSnk3agmV6KV@suse.de>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
 <ZyoEPMNhmjWLwY7A@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyoEPMNhmjWLwY7A@redhat.com>
Subject: Re: [svsm-devel] [RFC] COCONUT-SVSM Release Process
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Hi Daniel,

On Tue, Nov 05, 2024 at 11:40:44AM +0000, Daniel P. Berrangé wrote:
> At the RPM packaging level,  the "R" release will always compare as
> newer than the "D" release, simply because the "R" is larger than
> "D" in ascii.

Do you expect development and stable releases within the same package
stream? My expectation is that distributions package the stable and
development releases with different package names (e.g. coconut-svsm vs.
coconut-svsm-unstable).

> If you use a "NN" counter instead of month, then you can follow the
> approach that even numbers are stable releases and odd numbers are
> development releases. This is a simple rule to understand and has
> well defined version comparison behaviour

Okay, that is another option. I find that slightly less intuitive, but
since other projects do it this way I might be wrong with this and we
actually don't need to intensively teach users about that sheme.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
