Return-Path: <cclaudio@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A36C61A6743
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 Nov 2023 14:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ocgQWnsz8MNMPZvaCIKFKXG18LUvYom/eYFbip9W6Pk=;
 b=TGYyTSYw4nTZ3XgVrCPb4v/dN3Tzkn1OlggZMxdJGU6iy0v+WAhvpeTwrgAdGXvtnAoQ
 nKabz5gqL7Lm+9yXcwt9uy3UOqbPQBfGnrYzBuY+k8pPvcbaKb/U/fnS4xT/n+lpxyra
 CzVhHT6/otmj5c2moQr8gyBHCwtJXxFF64JsbkKq6ojveBCmdcNra041sPrOuwjZsqqq
 hx3nnU5kHRkws5xrbjIIqfaVY8k+pcEzP/78r6JxRSpn9FcOrGOtTujAT1fbNLkSwgvE
 UZycMXnySI+X/k5UptCHGPpFp+6tQYACfEYXHtBiQVx/mwPhSNy+6oxdzpLpze00L0ae XA== 
Message-ID: <64fdfbf99f8e20339464187a9f4d82bb6c514b73.camel@linux.ibm.com>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Thu, 02 Nov 2023 09:56:44 -0400
In-Reply-To: <d3f765f9-3d15-46d6-9715-6cabb1902a85@suse.de>
References: <1279ce20004b4c9023b8746f5833fe0da96b13f9.camel@ibm.com>
 <d3f765f9-3d15-46d6-9715-6cabb1902a85@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] Allocating 4 contiguous pages and set them shared
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Carlos =?ISO-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

On Thu, 2023-11-02 at 13:37 +0100, Carlos L=C3=B3pez wrote:
> Hi Claudio,

Hi Carlos,

> I'll preface this by saying I'm not completely familiar with the mm
> code, so I could be completely wrong here. That being said, IIUC, page
> order does not have much to do with the page table, but rather with the
> size of the blocks in the free list.
>=20
> `MemoryRegion` in src/mm/alloc.rs is initialized with a range of virtual
> addresses (in `root_mem_init()`) and manages that range in blocks of
> determined sizes. It stores a free list for each order, with each free
> list holding blocks of `(1 << order)` pages.
>=20
> You'll notice that the code in mm/alloc does not call into the page
> table code at all, meaning that it has no knowledge of page table
> hierarchy (or at least none that I could see). In other words, you
> should be able to give `PageTable::set_shared_4k()` the address of any
> page, and it will (un)set the appropriate bit in the corresponding
> entry. Even if you give it the address of a huge page, the function
> will handle it by calling `PageTable::split_4k()` first.
>=20
> In other words, something like this should work:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 let p =3D allocate_pages(get_order(4*PAGE_SIZE))=
?;
> =C2=A0=C2=A0=C2=A0=C2=A0 let pgtable =3D this_cpu_mut().get_pgtable();
> =C2=A0=C2=A0=C2=A0=C2=A0 for page in (p..p + PAGE_SIZE * 4).step_by(PAGE_=
SIZE) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgtable.set_shared_4k(pa=
ge);
> =C2=A0=C2=A0=C2=A0=C2=A0 }

Yeah, that makes sense. It looks like I'm on the right direction then. I ha=
ve
some code in my PR #69 that does something like this. I will just go ahead =
and
move it to the mm.

>=20
> Again, maybe I'm wrong here, so maybe someone else can confirm or refute
> my explanation. J=C3=B6rg wrote most of the mm/alloc code according to gi=
t
> blame, but he's out this week.
>=20
> PS: with my new `MemoryRegion` type in PR#131, (not to be confused with
> the `MemoryRegion` above), the for loop should be simplified quite a
> bit, as `allocate_pages()` could return a `MemoryRegion<VirtAddr>`,
> which would allow:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 for page in pages.iter_pages(PageSize::Regular) =
{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgtable.set_shared_4k(pa=
ge);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20

Nice, I will take a look at it.

Thank you so much Carlos.

Best,
Claudio

