Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0642E1A655B
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 Nov 2023 13:37:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698928672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oxddugKU1WmK+FGuakRnUYKGamQFoZ+fREZk17DdD0=;
 b=OCXSnJ5qiIjfVRaRtIgp4Qf1gFjjYEaZ6TuSomodXCoBxgRtfPMb5OmmtnwUjpVqU2gI4y
 wxzJ6KO5lF4vhogVrK+kxjwoGIqpodCViBgA8fyEfMcjaHl6Rb/Z2Mbvq7h5qL1Bpz2TSk
 4m+vVSxZL0Mo1sbCdrERCoI6O63GS5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698928672;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oxddugKU1WmK+FGuakRnUYKGamQFoZ+fREZk17DdD0=;
 b=ECuXo+1a5GsIy8Ykg2n8nkvtQLC6MrcbjbaW9x+kXYugHvBHH1oTADSOBJvrRCO2bCtleP
 1B26Za8GlkPmPFDA==
Message-ID: <d3f765f9-3d15-46d6-9715-6cabb1902a85@suse.de>
Date: Thu, 2 Nov 2023 13:37:01 +0100
MIME-Version: 1.0
Content-Language: en-US
References: <1279ce20004b4c9023b8746f5833fe0da96b13f9.camel@ibm.com>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <1279ce20004b4c9023b8746f5833fe0da96b13f9.camel@ibm.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] Allocating 4 contiguous pages and set them shared
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hi Claudio,

On 2/11/23 3:57, Claudio Siqueira de Carvalho wrote:
> My question is how should I share 4 pages with the hypervisor in this case? I
> could call "this_cpu_mut().get_pgtable().set_shared_4k()" for the first 4
> contiguous pages of p, but it seems that set_shared_4k() was meant for pages of
> order zero. Am I missing something? Any thoughts?

I'll preface this by saying I'm not completely familiar with the mm
code, so I could be completely wrong here. That being said, IIUC, page
order does not have much to do with the page table, but rather with the
size of the blocks in the free list.

`MemoryRegion` in src/mm/alloc.rs is initialized with a range of virtual
addresses (in `root_mem_init()`) and manages that range in blocks of
determined sizes. It stores a free list for each order, with each free
list holding blocks of `(1 << order)` pages.

You'll notice that the code in mm/alloc does not call into the page
table code at all, meaning that it has no knowledge of page table
hierarchy (or at least none that I could see). In other words, you
should be able to give `PageTable::set_shared_4k()` the address of any
page, and it will (un)set the appropriate bit in the corresponding
entry. Even if you give it the address of a huge page, the function
will handle it by calling `PageTable::split_4k()` first.

In other words, something like this should work:

     let p = allocate_pages(get_order(4*PAGE_SIZE))?;
     let pgtable = this_cpu_mut().get_pgtable();
     for page in (p..p + PAGE_SIZE * 4).step_by(PAGE_SIZE) {
         pgtable.set_shared_4k(page);
     }

Again, maybe I'm wrong here, so maybe someone else can confirm or refute
my explanation. Jörg wrote most of the mm/alloc code according to git
blame, but he's out this week.

PS: with my new `MemoryRegion` type in PR#131, (not to be confused with
the `MemoryRegion` above), the for loop should be simplified quite a
bit, as `allocate_pages()` could return a `MemoryRegion<VirtAddr>`,
which would allow:

     for page in pages.iter_pages(PageSize::Regular) {
         pgtable.set_shared_4k(page);
     }

But this is still a WIP.

Best,
Carlos

-- 
Carlos López
Security Engineer
SUSE Software Solutions
