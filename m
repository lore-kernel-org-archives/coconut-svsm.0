Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CAF1A23A4
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157638; cv=none; b=kxhSk9JyzPk+R62r8KXOP7jOwueKD2OUjoKI2gYSfEB8rKhDdtuPmzRg/D9jsd1ocgcC5atDIUhXXpGubspyEqA+mm0WIuGofx9DMDU0yPTr5fM8YhaNAueRnKMEiN+IiEgH772FcgZQ2MnKtDglJgN76A1p6RdOLekeNbR3N9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157638; c=relaxed/simple;
	bh=DZLPXMz5TspsTngUrvIIMfCLV9SvsSn8rqr6pwh5Zsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWCi5ZV0yP/VtFfyfJ9TpwpfIOXxe12KlL5/b8U8rbUh3vxzVB8NvT8uYSnJ62PEb9zxlqHKKFyHIZkgITw4EsH8cnYg8EjKXrDfqzS2RQMj6u9Wa2bINfjczRTOCtpBc8OQPEXTcBgvy2cSQvMYqF4Nk0qqPbbQE4HNnBNugtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=P5amAsiz; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="P5amAsiz"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EB8071C26C4;
	Tue, 14 Apr 2026 11:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776157636;
	bh=DZLPXMz5TspsTngUrvIIMfCLV9SvsSn8rqr6pwh5Zsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5amAsizcbcpiZgy9Ig1yRSzg9gqSPeyXQsVRrnCtq5EetA0wJP5rl2/qpfe5N44h
	 mh96NvkNWZnOjVe7/Pu9mGUrBLG1cCyXvSO9Hioi+ZZGNNmgCJE4nbYk6y0KUTzQ3c
	 FuaxRODpIXNf+EAhDFD2stN2FJd3HU5nA8XvDb2uRgAFtWFWBkYjzcHwVI2FTUrKdR
	 DH3dE2LH1pXwuudCyyV57sWPjDRNXESVA+3M53G+X2ctCTqcsTcPCs7FgmalqXdiHk
	 K8jEtghIUF9DJGh3fnRQU0yw6JSWxC+dPGQI1ufWmjSwOS3OrxF3b+8gH36Gb7jEol
	 tRFLdmuehdu1A==
Date: Tue, 14 Apr 2026 11:07:14 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolai Stange <nstange@suse.de>
Cc: coconut-svsm@lists.linux.dev, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: SVSM Observability and Configuration Protocol draft
Message-ID: <u3espexb4toaxc6w5sz6w72hgbwep2chgj2ej4op2ye3z5lys5@5o6ihdapythk>
References: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
 <87mrz6lyja.fsf@>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrz6lyja.fsf@>

Hi Nicolai,

On Tue, Apr 14, 2026 at 10:46:33AM +0200, Nicolai Stange wrote:
> > | Offset | Size (Bytes) | Description                         |
> > |-------:|-------------:|-------------------------------------|
> > | `0x00` | 4            | Flags                               |
> > | `0x04` | 124          | Name of the source encoded as UTF-8 |
> 
> Just a generic comment: as in my understanding there's no central
> authority managing the names, would it perhaps make sense to split the
> Name from above into something like a 16 byte UUID + a human readable
> name, the latter being only informative (or, alternatively, whose
> semantics are defined only within the scope of the UUID)?

I am not sure how much value UUIDs add because the read operations work on
indexes, but I agree that it makes sense to have a defined set of fixed sources
with their indexes as part of the spec. The question is what should be
pre-defined besides the log buffer?

> > The format of the data allowed to write is source dependent. If a given data
> > format is not understood by the source the call will also return
> > `SVSM_ERR_INVALID_PARAMETER`.
> 
> I assume other errors would be allowed as well? I'm thinking of a
> situation where a "source/configuration" is backed by storage, and
> writes to that could fail.

True, maybe it makes sense to add some protocol-specific error codes in the
0x8000_0000-0xFFFF_FFFF range.

-Joerg
