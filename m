Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1714732393;
 bh=8Hg9KR5LRR/8FNnquA38GhC+zUlLWvCxwAAus1ejlnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b4/VLvAo4mVqF2XurTHH6BjKtAdanQ9VOXT8xf3cv1KWompbjhoZt4DYNg6E0j7Y4
 l7MsvFtBjMN5/RFNuSdhB74TdSevGDQOYNw3E108GJhzu2WP1rCvCT7KB3nGg9E/+G
 QxndvPBKzW7VdnZZoUm/Dr5ZXEK7XviRd32oER67YBC5Crh1Nr0X8h2XIYCXXrXtY4
 THuHd56/S9s/nCTLCYAvO04uxkcOg2Fa0y4BPdYKCcsF56UtknnfWwymoQXTnO2pnP
 ZkjN/xfg6QcKhdwPsM7ouVDipuYF0xrcYf1BwP3jcdnJgm9ODo/p41k9g6RmA9tPul
 LWI2zF81wZPtA==
Date: Fri, 3 May 2024 12:33:12 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZjS9aMGyuO0lpn-3@8bytes.org>
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
 <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
 <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <4f398d58-830f-405f-bca1-4a424bbe6d60@suse.de>
 <BL3PR11MB6458C36EE179B77E16D68E248D1F2@BL3PR11MB6458.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR11MB6458C36EE179B77E16D68E248D1F2@BL3PR11MB6458.namprd11.prod.outlook.com>
Subject: Re: [svsm-devel] [EXTERNAL] Re:  x86 decoder further steps
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Cc: Thomas Leroy <tleroy@suse.de>, "Lange, Jon" <jlange@microsoft.com>, Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

On Fri, May 03, 2024 at 09:23:21AM +0000, Dong, Chuanxiao wrote:
> We made a prototype
> https://github.com/intel-staging/td-partitioning-svsm/tree/svsm-tdp
> which extended the coconut-SVSM to support Intel TD partitioned guest.
> It can decode and emulate some basic MMIO and String I/O instructions
> used by the Linux guest. Currently it is part of TD partitioned guest
> specific code, but if this code is also helpful to the NAE events
> instruction as well, we can see how to integrate it with the existing
> decoder?

I agree with Jon that it is best to implement our own limited
instruction decoder. This has security advantages as this decoder will
be smaller than a more complete one we pull in, which is especially
important as instruction decoding will mostly be done in the SVSM kernel
for performance reasons. So itegrating the MMIO and String I/O emulation
support from the Intel branch into our own instruction decoder would be
really great. 

Regards,

	Joerg
