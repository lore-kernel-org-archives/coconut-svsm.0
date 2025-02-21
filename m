Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com
 [198.37.111.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id F09DF42B10
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 14:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1740144695;
 bh=koX6bbusXK1K0mmqxq8fnmkfDhdOMrjUXhjl9PBqQf4=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=pubL9j+2jP24N7sOGRyPbiS2GQaAzgNNOHrax7rHSJFLWfbuYxUk8HiumCaUCA8I+
 wZ604oKrpAxmBXxe0R6JHNabY8JkAquza+j9cMUy6njVzMo2dWZT0ykaJY+XauAk6g
 3DYifhjFFczmd/rpRlC6cqfUc6ydVFNaPxX48yrQ=
Message-ID: <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Fri, 21 Feb 2025 08:31:34 -0500
In-Reply-To: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, svsm-devel@coconut-svsm.dev

On Thu, 2025-02-20 at 17:17 -0800, Dionna Amalie Glaze wrote:
> I'd like to propose a new version to the vTPM protocol that is
> clearer
> about its EK information.
> It's possible to create multiple primary endorsement keys with
> different algorithms.
> 
> For manifest version 1, we have a list of created primary keys in
> TPM_ALG enum order, not creation order.
> 
> 0x000 uint32 Number of primary endorsement keys
> 0x004 Variable Number-many TPMT_PUBLIC structures
> 
> I don't want to try to load a lot into this change request. For
> reducing pain with make/activatecredential, there's more to discuss.

I'm not sure I exactly understand the proposal, but I think it's that
the type of endorsement key should be part of the input data to the
vTPM protocol attestation?  In which case I agree.

However, the last sentence about make/activate credential makes me
think you're being too traditional about this.  That protocol is really
only required because physical TPMs are only shipped with encryption EK
certificates to force the privacy preserving algorithms.  Since there's
no privacy concerns about the vTPM in a confidential system, we can
just produce a signing EK, which can itself certify TPM objects without
the need for doing the AK creation dance.

That argues that there should be two input arguments: algorithm and key
type.

Reegards,

James

