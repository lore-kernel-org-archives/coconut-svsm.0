Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id EE8B626A2C5
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Sep 2023 15:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS6zSCCMRjZqVWpMNwl71XI69g5w4J01ImQRXnnVnn4=;
 b=2cSpP1KwPECcYFVXy2jNkKWm2YU1ro6RLWFxnwAhKONAsA4VozOOLBO1ayRuHBFWcPN+Xo5AzRsIzZ/cIixbhBZ84mYltmZn2K+jD5I6Nx2JLtVEwnQsafyFX0jO3jp+EJRrnPAXlo93TPfJwrvCeYhrkrs5//QBZ1CH7AlBPvo=
Message-ID: <e9f2f62f-10cb-fbb7-5fba-858f1cfcb175@amd.com>
Date: Tue, 5 Sep 2023 08:12:59 -0500
References: <ZPBqvbMM28sdqewQ@suse.de>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <ZPBqvbMM28sdqewQ@suse.de>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 8/31/23 05:26, Jörg Rödel wrote:
> Hi,
> 
> I talked to a couple of people recently about our SVSM project and the
> idea came up to schedule a semi-regular call where the community can
> sync on development and direction of the project.
> 
> It also fits my wish to be more transparent about our direction and work
> and helps move discussions out of private formats to a more public
> community forum.
> 
> So I wanted to propose a couple of time slots and see what people think.
> The idea is to have a meeting every 2 weeks, I will collect and post an
> agenda beforehand and we can always cancel if there is nothing to talk
> about.
> 
> Some time slots that would work for me:
> 
>                    CEST   ET     CT     PST
> 
> 	Tuesday	  5pm    11am   10am   8am
> 	          6pm    12pm   11am   9am
> 
> 	Wednesday 5pm    11am   10am   8am
> 	          6pm    12pm   11am   9am
> 
> 	Thursday  6pm    12pm   11am   9am
> 
> 	Friday    4pm    10am    9am   7am

Wednesday and Friday work best for me, but I can make any of them work.

Thanks,
Tom

> 
> I have only considered slots that work well for participants joining
> from America or Europe/Africa because most people I talked to live in
> these areas. If people living in Asia/Australia time zones want to join
> as well please let me know. We can use alternating time slots to make
> this possible.
> 
> Please let me know what you think.
> 
> Thanks,
> 
