Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B02A2EE607;
	Wed, 12 Nov 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936034; cv=none; b=aFyDuQkOVX1EF7RD2ap2jQGyhOOzHoP2rra1bSE1zW9CjGBbFWbHjT54+VybZ077IcdUcFbgPgo2wnN0d8DTLTIAgoDqeLJL8aQMdXwO8oQIn3PV+WD3dBLBlC+SugrPVMWZZzgvkmFwbKDMisoUXPtPi11/xwQiLsV1EVxsfRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936034; c=relaxed/simple;
	bh=/Sde2y4U1S9D0UlYjVsLGj0HNOqS+t+EQr2tYXcOcFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TA1y9CHuxNAvdCX1bkEuG/OnSt9275QmK/u1PEo4dwyR+UtgkO26vVUurja7LQoSNJgyCy883HOScW+BF6g6eydhcTJVyJm9FLsilL4cdHaoUXSttIEoegTGtGpvse+VLVg6j/Jc0okttZ4awS8KmdlGUMf3sSQTl/N++v2sa+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=TntmaZg5; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="TntmaZg5"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E8CF45ADFF;
	Wed, 12 Nov 2025 09:27:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1762936030;
	bh=/Sde2y4U1S9D0UlYjVsLGj0HNOqS+t+EQr2tYXcOcFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TntmaZg53H6hoIrIwCRVetNlPXBwIU6JLdDC+8ZV6caUav4Sp3BvgkIORvUnD3OUx
	 bom7XkWNgDjl+a5EvEzoB7rhQCT0f2ftTQm03kMf6tNdZLJ04TcgYBOr517Ps0kcN7
	 IBcBmayqUHtzGng7pzKVxgnE9evgbk6LCeWr2v6200IfXzIN4e7JMmvV3Y1mJCk3/c
	 9kAt6dbtNKVIhlr0/t09RCh61TYu7Hiy+a/oTRaL/n3Mg3+jGQu+AEajMNYpGl/KUR
	 /xbU/m8E15TxpK2F7yZei7dvSN+BFDxQyoCHcORK2igvGAvzBkGgyQdAybwWJ87w6p
	 r6XCAttdBa/5A==
Date: Wed, 12 Nov 2025 09:27:07 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: "Relph, Richard" <Richard.Relph@amd.com>
Cc: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: One pager on SVSM_REBOOT_EXECUTE
Message-ID: <cgiypgi34vkzsmn6vsdvxpgh6v2oaddfrb6nozdvru2xrswyxb@magqcoyl3xw5>
References: <A8B4CD4A-DB61-44C2-B1B5-B1E6F38A244B@amd.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A8B4CD4A-DB61-44C2-B1B5-B1E6F38A244B@amd.com>

Hey Richard,

On Wed, Nov 05, 2025 at 05:32:58PM +0000, Relph, Richard wrote:
> In our 15-October-2025 Coconut SVSM meeting, I agreed to write up a one-pager
> describing the initial implementation of the SVSM Reboot Protocol.
> 
> I’ve attached Tom’s original 2-pager full specification for the protocol with
> modifications. The substantive change is to replace "Rebooting the guest will
> restore the guest state to match that of a newly booted guest.” With
> "Rebooting the guest invalidates memory pages that were validated by the
> guest and resets the CPU register state to their initial state. No other
> system state is modified.”

Thanks for putting this together. I have two comments:

	1. The protocol needs a separate feature detection call so the guest
	   can determine which version of the reboot protocol is supported by the
	   SVSM.

	2. The call definition for SVSM_REBOOT_EXECUTE needs to specifically
	   define what state is reset with this call. My understanding is that
	   it only resets memory and CPU state, but explicitly not any service
	   state (like TPM).

Could you please add that to the specification?

Thanks,

	Joerg

