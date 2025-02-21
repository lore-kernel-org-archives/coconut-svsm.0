Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com
 [198.37.111.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9162D42B10
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 17:53:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1740156831;
 bh=xQfaeghAx9mFH/ywiOF1m/Doq0jP864531zlsZNwgKM=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=pDGtgHgj1JonMeokgsAeLVgJ4AEC9XYv5U5ioJfbgLjVqb8R+DdTlYoJYCkzcmXUq
 l5VIZreO6cBVI/Cf1/tfYLJG77/NA4xWVGPdyX8EL8VT9Ggg2Qz/N/oN1VqQXEYXM7
 1tq/rWPvZXBmFm75sQDgywM+puEpdcJogCiFUJfE=
Message-ID: <596e9f2233a8938ec1360159df4f84238db2b20a.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Fri, 21 Feb 2025 11:53:48 -0500
In-Reply-To: <CAAH4kHay7jEbjpV19BG6Ghsr4fy2Gxce2Ud6Gtc3QPX4aYgTjQ@mail.gmail.com>
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <CAAH4kHay7jEbjpV19BG6Ghsr4fy2Gxce2Ud6Gtc3QPX4aYgTjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: svsm-devel@coconut-svsm.dev, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 2025-02-21 at 08:39 -0800, Dionna Amalie Glaze wrote:
> > I'm not sure I exactly understand the proposal, but I think it's
> > that the type of endorsement key should be part of the input data
> > to the vTPM protocol attestation?  In which case I agree.
> > 
> 
> Service attestation has no inputs other than the service guid and
> manifest version. If you want the key type to be an "input", then we
> need a service guid for each specific EK algorithm. We can treat the
> existing guid as for rsa_2048 if you prefer. That makes this an
> extension request rather than a change request.

That's a lot of GUIDs; why not simply define a guid for the additional
arguments and then pass them in in TPM form (except probably native
endian)?

Regards,

James


