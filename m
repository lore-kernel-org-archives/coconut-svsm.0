Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9B9B51C4ACE
 for <svsm-devel@coconut-svsm.dev>; Thu, 30 May 2024 19:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717088789; bh=NIJhHBYRXpsOpCMDaZBRg66bIGp2F6TZ3LYJusBswTw=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=D0hx+6mW4KXBs5YWbfF192f9g1dp5vAbEAD0981MrCo83AR/hJgT6La4iNba4zp9B
 dFN8/FbZLldqWdoKULCvGhdrRoRS56tWw4L66fKKQyT6VclbzJPERJmkVqwczxVJFO
 hKLkBTV7RD0+KeCO6rwcAZWYIL3yXMLgqcAN5ueR94KaIDM7sjw+GbamIQJVQpycO5
 rgF3H5FpayfB/FmnKe1ubeOi1AgSntci3VvO+OYk0b5QWwGJVYer4ge0hpyUlwvQfe
 wyHkkQ3EFV2qH4Y/DOjLU5UlEDGQF0OPpB2le5gMz8Dc64x2F9KObQkEmmYzskD+ab
 60sAn8zCNCcCePMi4gPf5PtuQyWJN5mPo2lr7HJ9MHqjcMYLyZCuLTaGupDCiSm3rU
 YaqRw2XxCkwGES2WPBkkwuwLJhYtU71Zj1SrLBWqBe3SvX52VGXGmXGDSuOpo5l5lx
 Lxt8TlWT8Ro8e+/aYn2sutgwusaNlapdKQt2i5vSL4j4lItPB4MSO97Etfoax66XiR
 jzk/Zik2POMYZWQvXAP4umo9iZ4QL4hFPkxiGSSnST/2Q2PgZ8JONrygfkbMQm9sP+
 DChBobSMA5+8kPsHqZ0AtNR64Dr4QIQx4+La2zo88n5AHj/WkHIXWMKjizTK/Viq+8
 q6rYMpwgbpXd34TsX+9srG6M=
Date: Thu, 30 May 2024 19:06:12 +0200
From: Borislav Petkov <bp@alien8.de>
In-Reply-To: <e7c24be1-dbea-0efd-2661-b626fd655478@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <435f78e07c76e25d2d857138724098bc2a729b0a.1713974291.git.thomas.lendacky@amd.com>
 <20240527135101.GBZlSPxQ6iBSlMDefY@fat_crate.local>
 <e7c24be1-dbea-0efd-2661-b626fd655478@amd.com>
Message-ID: <D5A4D31B-4A37-48B7-8EBC-C8A4062B4813@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] [PATCH v4 09/15] x86/sev: Provide guest VMPL level
 to userspace
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On May 28, 2024 11:08:35 PM GMT+02:00, Tom Lendacky <thomas=2Elendacky@amd=
=2Ecom> wrote:
>I can move it there=2E Or what about creating a coco folder under /sys/ke=
rnel/? This would then create /sys/kernel/coco/sev/?
>

Sysfs hierarchy is special - can't just add stuff willy nilly=2E This doc =
hints at that:

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/t=
ree/Documentation/filesystems/sysfs=2Erst

And then those things get documented here:

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/t=
ree/Documentation/ABI

and supported forever and ever until the end of time=2E

So the usage needs to be precisely documented and weighed whether we reall=
y need it=2E=2E=2E

Thx=2E

--=20
Sent from a small device: formatting sucks and brevity is inevitable=2E 
