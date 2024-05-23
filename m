Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1716457953;
 bh=t72ds1a9tPvIHi+0m7UGqYMr+HpevzYQBBemqmIY8vI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wwDBPo2RkdERKWBJDnsmlhNrp3bpZ0WXKSYh2ubzEzCLH7O7gzCGMZIT/Dtsgbh3A
 xrwmhCNNrYmMALLP78Ba2lMlgHQx0xfUgg4dNm1MIRP4TdIRPM6+H8R7WXKJPGEx27
 RBJkAXnSpxx6yrwYL4nPwHCD5H23QpVJIsiMdOOGPT56t+q312H1R/o0anREjeUTxf
 U6oVegerKoY8AWBZXQLp4BE3aEPqi5nP4xmVELWxHJubgMrg8We5ZOYtEimPxMOUb3
 45IyUvUpSU9gg8dEi+9CHlE2v/TdMlwURUstgnzr4DedT9SYSdpr0k9C5H5I+XJoL1
 Rx8V6Qa2STp+A==
Date: Thu, 23 May 2024 11:52:32 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Zk8R4F-etafWOs4a@8bytes.org>
References: <Zj30Nqq3OS58DwpP@8bytes.org> <ZkMpkfepqUWfq1RY@8bytes.org>
 <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZkSnP5-FbaApB1Av@suse.de>
 <DM8PR11MB575028924239348043427677E7EE2@DM8PR11MB5750.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB575028924239348043427677E7EE2@DM8PR11MB5750.namprd11.prod.outlook.com>
Subject: Re: [svsm-devel] Development Plan Document
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Rodel, Jorg" <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

Hi Elena,

On Fri, May 17, 2024 at 10:01:01AM +0000, Reshetova, Elena wrote:
> Coconut as a service VM closely relates to the concept of service TDs that
> we have in TDX (for example a Migration TD is an example of a such a service TD).
> However, in my understanding there was not enough general
> interest in this model (due to complexities of managing separate service VM
> in addition to the guest OS VM) but looks like I had a wrong impression.

Service VMs might be a niche use-case in the end. But since there is not
much effort needed to make them work I see no reason to not support
them.

> We are affected by a double accept albeit differently. Since every page
> that is accepted by a guest starts as a zero page, host/vmm can turn any
> private page into a zero page (with potential security consequences) at
> any time if acceptance status for the page is not tracked.

Okay, right. Seems like the attacks work on Intel as well, just with a
different outcome. Anyway, the mitigation should work on TDX as well.

> Yes, anything that can affect coconut-svsm itself and which can be
> security-relevant but at the same time stays stable over different boots.
> Memory map is likely not stable, so i dont think we can measure it, 
> Coconut-svsm just should sanitize the values. ACPI tables is a candidate.
> I know that currently coconut-svsm takes very little of such inputs/configurations,
> but it will probably grow in the future, so having a guidance on what configuration
> must be measured or not is good to have imo.

We briefly touched that topic in yesterdays development call, it seems
there are diverging requirements for different platforms. Some platforms
do not want to measure any configuration data while others want to
measure at least parts of it.

Currently IGVM is used to pass any configuration data to the SVSM and
the specification requires this data to be unmeasured. So an IGVM
extension would be needed as well to pass measured configuration data.

Regards,

	Joerg
