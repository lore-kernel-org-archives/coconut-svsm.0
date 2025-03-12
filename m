Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1741773735;
 bh=A1uVqH95CJPqwqijOjOOLii3c7rnY58wxAgsubZzoV8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gw/pueRaVz5Vvb24gCX2yKDBnZ0a1cymUa7fJxHTzlBQ8fYzjX71706b0T321dt0a
 aCkPCCnU8qThsVxAQDPt9IE5zfBhI/vh5JsIauhNGndc1FtWpyJZ4pmlTH7MveUDs7
 UUTa4RiQv5rj+pCTjcsYXAkIf6rTOwS8bF5Qz727o4aQkdFrZn5wo5pL8uMgGuCHS0
 E3gdx0Qo9y0OK27Icfdkb/p/6ZVBY3dpnMkrO6ykFdxy1socjVoZ1OsIP3hrKVagLJ
 F+U2vflh9cREttMVbT6Vl0J8kvu5XlyO8HDYc5dfKbzxThCnyaEIhytgswEIHAGzIl
 G+LdjpuexpLGw==
Date: Wed, 12 Mar 2025 11:02:14 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z9FbpnCBjpYgOYI3@8bytes.org>
References: <Z9FSCnYWkV0g12R0@8bytes.org>
 <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com>
Subject: Re: [svsm-devel] SVSM Host Kernel KVM Update Required
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: svsm-devel@coconut-svsm.dev

Hi Pankaj,

On Wed, Mar 12, 2025 at 10:36:17AM +0100, Gupta, Pankaj wrote:
> Would you mind sharing the #PR? Now, I am wondering why I did not notice any
> no boot scenario at all.

The PR that triggered the breakage on the SVSM side was:

	https://github.com/coconut-svsm/svsm/pull/630

The PR removing the intercepts and fixing boot for the SVSM Linux
repository was:

	https://github.com/coconut-svsm/linux/pull/10

Note that part of the problem was that COCONUT determines CET support
by checking whether it can successfully change the CR4.CET bit. With a
CPUID check this would probably not have happened, but that early in the
SVSM boot process CPUID is not working yet.

Regards,

	Joerg
