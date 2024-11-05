Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E2F0A2A903D
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 17:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730825873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiIHFx9X5VSDIrZNB8VHcJuXsN4h28M3YH82b+ItEE0=;
 b=HdqUQcSzKhmL4p4AzNI20KqS45YBMczIYXd10/gBb++dFKkMvOemVCrf2i/bHGdC7VAaNp
 MSqsdHFNMJU0Fu8FtjblqjJoCDxFwHnQxgJpVsDbnynA5MNPJAT/0pAwDkqHEAtwO8MYM1
 KTT26kvMUTDZDawPhzuGDxi0eh9Mprw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730825873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiIHFx9X5VSDIrZNB8VHcJuXsN4h28M3YH82b+ItEE0=;
 b=JY1W6oUuTxB9dVtjULkXoCsMrrgBuhCaXP8jc3IWLpF3xxVvGKO47jsSpAGf2okoeWDRmY
 fHdmvVfdEKBhkfAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730825873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiIHFx9X5VSDIrZNB8VHcJuXsN4h28M3YH82b+ItEE0=;
 b=HdqUQcSzKhmL4p4AzNI20KqS45YBMczIYXd10/gBb++dFKkMvOemVCrf2i/bHGdC7VAaNp
 MSqsdHFNMJU0Fu8FtjblqjJoCDxFwHnQxgJpVsDbnynA5MNPJAT/0pAwDkqHEAtwO8MYM1
 KTT26kvMUTDZDawPhzuGDxi0eh9Mprw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730825873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiIHFx9X5VSDIrZNB8VHcJuXsN4h28M3YH82b+ItEE0=;
 b=JY1W6oUuTxB9dVtjULkXoCsMrrgBuhCaXP8jc3IWLpF3xxVvGKO47jsSpAGf2okoeWDRmY
 fHdmvVfdEKBhkfAg==
Date: Tue, 5 Nov 2024 17:57:47 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZypOi2zgpi9QmU7S@suse.de>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
 <ZyoEPMNhmjWLwY7A@redhat.com> <Zyo-tSnk3agmV6KV@suse.de>
 <ZypHN-0o4XNBeUwI@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZypHN-0o4XNBeUwI@redhat.com>
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

On Tue, Nov 05, 2024 at 04:26:31PM +0000, Daniel P. Berrangé wrote:
> I can't speak for all distros, but in Fedora / RHEL we will generally
> aim to ship a single stream of software, unless there's a very compelling
> backcompat need to ship multiple *stable* versions.
> 
> In Fedora rawhide, we'll sometimes ship development releases, in
> situations where we expect a followup stable release to be ready,
> before the Fedora relase branches. The idea of this is that it
> gets earlier testing of the forthcoming stable release, so we can
> identify and resolve problems more quickly. This does assume that
> the upstream project in question is shipping development releases
> that are considered high quality, which may or may not the case.

Okay, thanks. That is a valid point and works well with projects that
have a single release stream for development and stable versions. In the
longer run I can see the SVSM following such a model as well. Maybe we
can go this way following Dionna's suggestion, see below.

> I would flip the question around and ask why there is a need to have
> distinct version number series for development vs stable releases.
> It is very unusual - personally I can't think of examples of projects
> doing this. A single version number series is the standard practice.

I made the distinction because I want to avoid the impression that we
consider a release ready for production. My criteria production
readiness is that the SVSM has a fallible alloctor API and can handle
out-of-memory situations without crashing.

So I want the release name used now to send the message that the code is
still under development.

For this release profiles as suggested by Dionna would also work.
Something like '2025.03[.NN][-devel]' would work as well and would solve
the above situation where packages start with development releases and
switch to stable ones later on.

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
