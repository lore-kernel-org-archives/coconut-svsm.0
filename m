Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1695753892;
 bh=k2PrbGxTDjtZS++t5+fgETdPE3t5LH4/5ZboJG/Hzvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zJIZRSr8JE9dcm34iT09xudt3gfgYdilWrlbBu/LoSDdnJzgCl6ckGEJ0X9XB9IKt
 Ark1mZlcukg5wg5ze9XFY/2LIW2SG30X83M1Bg4hGXT2r9QvFfTBN5S8LunS/DMhbc
 XDz5vgRFnnjWU2vg4mN3xSpzRrddyyIS6Ib1DOy7B9aPvNGIXEuOJZRNYrckZu6wWt
 vR2wNQLckw5L5LG2IfXrpVHal8MjYizQI4jlCHFflhpTlr1UaVfbRKeXto9zweIMmL
 1jfanU0lwXQWhmx4QsEhZLnZ9kkz5BHadfxC14D4fDV7AFUWw3pLP/IBwFSX1Dm6Nk
 bN/DMvkSvJktA==
Date: Tue, 26 Sep 2023 20:44:51 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZRMmo6tLZ4jA5UOl@8bytes.org>
References: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
 <CAAH4kHaa3v6125D1HQwt_6AbKP34N8rkH+gJQwyRa8zQM+-E8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAH4kHaa3v6125D1HQwt_6AbKP34N8rkH+gJQwyRa8zQM+-E8w@mail.gmail.com>
Subject: Re: [svsm-devel] Questions about crypto support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>, svsm-devel@coconut-svsm.dev

Hi Dionna,

On Fri, Sep 22, 2023 at 09:57:52PM -0700, Dionna Amalie Glaze wrote:
> Is there a plan for dynamic linking support for shared libraries to be
> possible in SVSM? I would think everything is going to be statically
> linked, loaded as part of the boot image, and not even
> position-independent.

So yes, everything is part of the boot image, as it contains the archive
for the RamFS, with all module binaries in it. But from a conceptual
level we can support shared linking. The requirement came from the fact
that FIPS certification is done on binaries, not source code. So we like
to get to a situation where we can ship crypto support for all modules
in a single binary, be it a RPC based module or a shared library.

> I don't expect a full VFS system to make shared memory a thing to
> implement IPC.

Well, we are almost there already. The RamFS implementation builds on
reference-counted page allocations which allow easy sharing of pages.
And the upcoming VMM support also has the idea of shared mappings built
in.

> I would imagine that you would send messages to different modules by
> handing a buffer and a module identifier to CPL0 to go deliver to that
> module's mailbox and return success, mailbox full & try again later,
> or message too large.

I would appreciate something more clever than copying data around for
IPC. Since the SVSM is very modularized there will protentially be a lot
IPC and that should not be too big of a bottleneck. Doing IPC using
shared memory is certainly a good start thinking about this.

Regards,

	Joerg
