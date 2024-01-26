Return-Path: <Carlos.Bilbao@amd.com>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C5D151E1FF1
 for <svsm-devel@coconut-svsm.dev>; Fri, 26 Jan 2024 14:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5p7IR6BkTviTBw7pZGN7MaqhtprBKB0xk2b7nUVedM=;
 b=maoWR+lS4tucNoUS5no03sAOfr3j9LjjIjjm9Wzij7kNAspT2lRI4U811Yx/ldevll306lgg+PnXYjxv3RjjcFuE7a9ZwuZGEkZAxrHddQg2kl5a0l/2axPBaf2F9niq1V385t5Or9ZqS+geTgtWd29anCkEOGk+nvaSpyWT2UM=
Message-ID: <720ee881-e3f3-4beb-a567-fed6e5b9949e@amd.com>
Date: Fri, 26 Jan 2024 07:40:27 -0600
Content-Language: en-US
References: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de>
 <CAJ5mJ6ix_+pJc+ty8OgEdZt4gwBXhJd00DbhccESJYZh9_wsUQ@mail.gmail.com>
 <CAJ5mJ6hJ_u62YwYae8Y6b7EFe6HRh8LBmtKyN5nCW8V8654_5w@mail.gmail.com>
From: Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <CAJ5mJ6hJ_u62YwYae8Y6b7EFe6HRh8LBmtKyN5nCW8V8654_5w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] SVSM Development Call Jan 17th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jacob Xu <jacobhxu@google.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

Thanks Jacob!

Carlos

On 1/17/24 11:46, Jacob Xu wrote:
> (re-sending as plain text instead of html message)
> 
> Hi Carlos,
> 
> Here's a link to the AP boot race condition mentioned during the call,
> it's on the SNP host-kernel patches.
> 
> https://www.spinics.net/lists/kernel/msg5058122.html
> 
> 
> On Wed, Jan 17, 2024 at 9:39 AM Jacob Xu <jacobhxu@google.com> wrote:
>>
>> Hi Carlos,
>>
>> Here's a link to the AP boot race condition mentioned during the call, it's on the SNP host-kernel patches.
>>
>> https://www.spinics.net/lists/kernel/msg5058122.html
>>
>> Jacob
>>
>> On Wed, Jan 17, 2024 at 4:48 AM Jörg Rödel <jroedel@suse.de> wrote:
>>>
>>> Hi all,
>>>
>>> Just a reminder for todays SVSM Development call at 9am PST/6pm CET.
>>>
>>> If you have any agenda items you want to see covered, please let me know. Otherwise we will just do the usual rounds of updates and Q&A.
>>>
>>> We meet as usual at https://meet.google.com/ppv-xehx-dvb
>>>
>>> Regards,
>>>
>>> Jörg Rödel
>>> jroedel@suse.de
>>>
>>> SUSE Software Solutions Germany GmbH
>>> Frankenstraße 146
>>> 90461 Nürnberg
>>> Germany
>>> https://www.suse.com/
>>>
>>> Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
>>> (HRB 36809, AG Nürnberg)
>>>
>>>
