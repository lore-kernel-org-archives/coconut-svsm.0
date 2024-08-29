Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1724914941;
 bh=l3txK5KcV788XDyGYBdt3EvzuvGknrcR9h+N/UIMjm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2Be8dqYvag8qikKnHY8ZcJwBWPcSVCUpmXgtd3yGHb2/2sTxKBU1rn/+5H2RpP3X5
 q9ei9aQ8ddMucrw/C2HghtcZSgWagqmFAZKwQtquDGqydGcRZjDz0P03OZ9jpYHIL+
 C6eOB5RCQukri8ALDFPvSQm1GPbA4EEk5numlF07NeL7Nf8+iPb0xLtTe1bAx5vHjI
 SG4WxmGxob0Y8/Mk0pIq8XViGZwiFparrjmjp+Ozf/HhK+8GPBmX3popbpMnPJkcYc
 YaaciWM2H032qvB2Ser0lZt38jXU7xeRwE/5nxjCu1j46850QkxDKe7rDn1XefCyxo
 qvgLMrkwnfhRA==
Date: Thu, 29 Aug 2024 09:02:20 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZtAc_MgFsl11As6t@8bytes.org>
References: <59a0b153-b2a5-464b-a72d-7fa7408882da@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59a0b153-b2a5-464b-a72d-7fa7408882da@suse.com>
Subject: Re: [svsm-devel] Kernel security features
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Thomas Leroy <thomas.leroy@suse.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi Thomas,

On Wed, Aug 28, 2024 at 03:37:53PM +0200, Thomas Leroy wrote:
> The current list currently contains:
> - KASLR
> - Read-only GDT and IDT
> - SMEP and SMAP
> - Heap hardening
> - Shadow stacks

Thanks for starting this list, I think this is very relevant. The
project already has the ground-work for KASLR. Making GDT and IDT
read-only should be a low-hanging fruit. SMEP and SMAP is a bit more
work, though also not that complicated.

Shadow stacks is probably the hardest item to implement. What about
KPTI, is that still necessary with recent processors? If we do KPTI then
we also need PCID.

Regards,

	Joerg
