Return-Path: <Carlos.Bilbao@amd.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A8EC11C4A29
 for <svsm-devel@coconut-svsm.dev>; Tue,  6 Feb 2024 19:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0fG76dmgQh/KPApHoNgeoyqy1loK9WJJTGdAlmysL4=;
 b=ZfLi8kxQdvbhnbKu9uvS9ve1syT/gRgZTnHP9NSH3334bMNPf20jkCbPyDmgW+TpHtZ5TnTCi38imA9IRcXYPN9sUyj7fHZ5PkXTJitgMeF5LUpw2RIbWlQQkXzINGE4Vx5iLL895xQUTuGh47HxoHE9gDw2fev/C0beiz6cH0A=
Message-ID: <e9fb3fdf-dc00-421b-a44f-2b2b231607c8@amd.com>
Date: Tue, 6 Feb 2024 12:10:16 -0600
Content-Language: en-US
References: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
 <MN0PR21MB3072D34761004C4555CA635DCA462@MN0PR21MB3072.namprd21.prod.outlook.com>
From: Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <MN0PR21MB3072D34761004C4555CA635DCA462@MN0PR21MB3072.namprd21.prod.outlook.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [EXTERNAL]  SVSM Development Call Feb. 7th,
 2024 (and Cargo workspace transition)
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jon Lange <jlange@microsoft.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hello,

I have an open PR and don't mind rebasing it. Since we already have both
Cargo.lock and Cargo.toml, I'd appreciate it if tomorrow we could go
through what this change may entail in practice.

Thanks,
Carlos Bilbao

On 2/6/24 11:41, Jon Lange wrote:
> Realistically, there will not be a point in time at which there are no pending PRs, so there will always be some number of PRs subject to conflict no matter when the transition is made.  It seems much better to make the transition as early as possible to reap the benefits of the transition.  Count me as another voice in strong support of option (1).
> 
> -Jon
> 
> -----Original Message-----
> From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of Jörg Rödel
> Sent: Tuesday, February 6, 2024 8:29 AM
> To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: [EXTERNAL] [svsm-devel] SVSM Development Call Feb. 7th, 2024 (and Cargo workspace transition)
> 
> Hi,
> 
> As some of you already noticed there is a PR now which transforms the SVSM repository into a cargo workspace.
> 
> I consider the move to a cargo workspace an important change which should better happen sooner than later, but it is also very intrusive, basically breaking any other pending PR.
> 
> So there are two possible strategies right now:
> 
> 1) Merge the cargo workspace PR and let everyone else rebase their work on-top. That is work for everyone, but should not cause major hickups as only file paths will change and not the actual file content
> 2) Merge some of the pending PRs first and then do the cargo workspace transition. This requires re-basing the cargo workspace PR, which is also quite some work.
> 
> I am leaning towards option 1) as I think the sooner the transition is done the better, but I am open to other opinions on this. So if you think option 1) will not work/causes too much hassle or we should do something different, please speak up. Merging PRs is stopped until there is a decision on this, which I hope will be made after the SVSM Development call tomorrow.
> 
> The call is happing as usual tomorrow at 9am PST/5pm UTC/6pm CET.
> 
> You are all invited to join the discussion at:
> 
> https://meet.google.com/ppv-xehx-dvb
> 
> Please also let me know of any additional agenda items you want to discuss, either by replying to this email or raising them in the meeting.
> 
> A public Google calendar is available here:
> 
> https://calendar.google.com/calendar/u/0?cid=Y181NWEzOGYzNDYwYzYzODc2MmE3NWQ0ZmQ2ZWRhM2IxY2Y0NTVlYzRjZmQ3ZjgzMjAxZTNjYmY4MTdiNDIwZGQ4QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20
> 
> Looking forward to see you all there and discuss the above topics!
> 
> Regards,
> 
> Jörg Rödel
> jroedel@suse.de
> 
> SUSE Software Solutions Germany GmbH
> Frankenstraße 146
> 90461 Nürnberg
> Germany
> https://www.suse.com/
> 
> Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich (HRB 36809, AG Nürnberg)
> 
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
> 
