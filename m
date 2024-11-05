Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 94F962A98A7
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 18:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730826013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyVABGLF0+lidold0uTV6qjNzJxKrW4t03gIMMw3b7k=;
 b=j9e9ULW2PQnziCRIYBfJM3ytJsj9BNuDtMhxh7hJ0Z4ltxVUJZ91AOJ1Z0muxEskYF9j8L
 fW993cZQHd8OqWkG+38X50tAElhf9h3rQGpGV4CDaXzM5dCOy9+r7hYphnWlgI5OCCQ0vb
 LIXs2eUKMjVIzRE2ag6sfzwtgtOeEm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730826013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyVABGLF0+lidold0uTV6qjNzJxKrW4t03gIMMw3b7k=;
 b=hlke03q/UHfwPYN1nxa8mXj8Yoom5sR6nAbzBDuMGbVR8AY6QAiFchBVCzCreYQVpIIgpK
 93/PWy8l76UWJxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730826013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyVABGLF0+lidold0uTV6qjNzJxKrW4t03gIMMw3b7k=;
 b=j9e9ULW2PQnziCRIYBfJM3ytJsj9BNuDtMhxh7hJ0Z4ltxVUJZ91AOJ1Z0muxEskYF9j8L
 fW993cZQHd8OqWkG+38X50tAElhf9h3rQGpGV4CDaXzM5dCOy9+r7hYphnWlgI5OCCQ0vb
 LIXs2eUKMjVIzRE2ag6sfzwtgtOeEm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730826013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyVABGLF0+lidold0uTV6qjNzJxKrW4t03gIMMw3b7k=;
 b=hlke03q/UHfwPYN1nxa8mXj8Yoom5sR6nAbzBDuMGbVR8AY6QAiFchBVCzCreYQVpIIgpK
 93/PWy8l76UWJxDQ==
Date: Tue, 5 Nov 2024 18:00:03 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZypPEwp7Vj5N2YcO@suse.de>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
 <ZypD1pGNxRXFjZxS@suse.de>
 <CAAH4kHbjYOPhUgqHtYUEx-5Z9jfH-Dd_r8xi5EaON2P9+nz6=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAH4kHbjYOPhUgqHtYUEx-5Z9jfH-Dd_r8xi5EaON2P9+nz6=w@mail.gmail.com>
Subject: Re: [svsm-devel] [RFC] COCONUT-SVSM Release Process
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Hi Dionna,

On Tue, Nov 05, 2024 at 08:20:03AM -0800, Dionna Amalie Glaze wrote:
> A scheme we use has been YYYY-MM[-DD][-profile][-rcX]
> The profile marker is to allow for different build profiles from the same trunk.
> I don't think that releases from a SHA1 hash make sense, since I would
> always presume that cutting a release tag means creating a branch upon
> which to cherry-pick fixes. Cherry-picking on top of the named SHA1
> hash changes the head hash and kind of ruins it.
> If you want D to mean unstable features but are not broken outright,
> I'd say to call it the unstable profile. That way you make sure to
> track experimental/unstable additions behind features that you can
> later promote to stable.

Using a profile approach for version strings is a good way for the SVSM
as well, thanks for that suggestion.

I will set this topic on the agenda of tomorrows call as well.

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
