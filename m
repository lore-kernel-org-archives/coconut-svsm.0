Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com
 [198.37.111.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E177242B10
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 17:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1740156695;
 bh=/y07lfrLuX5yOrIhSM7wpPzlT5GyjuN8EbQaFCI0kEA=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=OsibaMbsBPRuYt7fqQJtzhs1Dkb9j55TA/mQ7FXWB+eFVtNEEBzPBKQS6mu2LpJKD
 mvUsod1q/+XLTyVbuS0wYU5QAKDUrQEJgr74teb8LrYTSdeGYJH+Nw+2gvE6PIF1lH
 4hYYUXIga6m+bkswT7lQdiZ6+8bFPYxDd7UWJjbU=
Message-ID: <b3c0d8e776738a7b94577f652f1a6da2b2dbb78d.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Fri, 21 Feb 2025 11:51:33 -0500
In-Reply-To: <CAAH4kHYrCLoT3x50MN+STaFapEPysDNH2udttr0snYJTVjkdaw@mail.gmail.com>
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <CAAH4kHYrCLoT3x50MN+STaFapEPysDNH2udttr0snYJTVjkdaw@mail.gmail.com>
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
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: svsm-devel@coconut-svsm.dev, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

On Fri, 2025-02-21 at 08:33 -0800, Dionna Amalie Glaze wrote:
> > However, the last sentence about make/activate credential makes me
> > think you're being too traditional about this.
> 
> If instead we use TPM2_CreatePrimary with a public key template that
> has its bit 18 set in objectAttributes and use the EK handle for
> TPM2_Quote, then there's a great deal to change in user space.
> tpm2_createek doesn't give this as an option for example. Is adding a
> --non-anonymous-ak (or some such) to the TSS for EK creation part of
> your plan?

Well, I don't use the Intel tools, so I'm not much of an expert there.
However, assuming it's similar to the IBM TSS you don't use createek
(because it's mostly used for TPM resident certificates) you use
tsscreateprimary with -sir as the option instead of -st which tells it
to create the primary signing key instead of the storage one (and you
usually don't bother with the policy).

Since the validation tools for the kernel are now using
attest_tpm2_primary from openssl_tpm2_engine, you can also use that (it
does everything internally and doesn't need you to use the tss
primitives):

attest_tpm2_primary --eksign

Will construct the name of the signing EK which you can save to a file.
Then you use that file to do certifications:

attest_tpm2_primary --certify null --name <eksign name file> /sys/class/tpm/tpm0/null_name

To certify the null storage primary the kernel used (although you can
also get it to certify the storage primary, which is probably what
you'd want).

Regards,

James

