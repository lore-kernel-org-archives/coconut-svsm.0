Return-Path: <jacobhxu@google.com>
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 605E91C3C3E
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Jan 2024 18:46:31 +0100 (CET)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-36192e5d2f8so146955ab.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Jan 2024 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705513590; x=1706118390; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTKMsVfgPN3dX5Bxo71zqeqMSBCzkJajVmflW4l7M3s=;
 b=qdInpfk2PwG2018o39zy19ARE5Jgk8g4UZr34Hdb6ZYC5QMS2nP9ab7kixhghnCQDW
 Z34H3JV7sIAxyqTtH+wxU7Fgst5QI4glzTJm181aaWlmeC86PC5UTajeuGcaTpkhgoa+
 vKNnANxKUwekKifpd7Azy5Bsu86fUlMWSQn9ShusFeGFz1qthdc7NF/oP8YuL48iiJ8P
 gCJMmZsRGGQgk3OPRUywBe/t8DfW8AMTRKobhjG5DLLdYoKLI5N6hHqVlieVUTIUMlVM
 B9pi85zvUovWANNe1kfaxNb8xROU7xV4uLj3I2Bin46/WiXgNq8siZwASqMrR1xa2INN
 dUlg==
MIME-Version: 1.0
References: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de>
 <CAJ5mJ6ix_+pJc+ty8OgEdZt4gwBXhJd00DbhccESJYZh9_wsUQ@mail.gmail.com>
In-Reply-To: <CAJ5mJ6ix_+pJc+ty8OgEdZt4gwBXhJd00DbhccESJYZh9_wsUQ@mail.gmail.com>
From: Jacob Xu <jacobhxu@google.com>
Date: Wed, 17 Jan 2024 09:46:18 -0800
Message-ID: <CAJ5mJ6hJ_u62YwYae8Y6b7EFe6HRh8LBmtKyN5nCW8V8654_5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call Jan 17th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, carlos.bilbao@amd.com
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

(re-sending as plain text instead of html message)

Hi Carlos,

Here's a link to the AP boot race condition mentioned during the call,
it's on the SNP host-kernel patches.

https://www.spinics.net/lists/kernel/msg5058122.html


On Wed, Jan 17, 2024 at 9:39=E2=80=AFAM Jacob Xu <jacobhxu@google.com> wrot=
e:
>
> Hi Carlos,
>
> Here's a link to the AP boot race condition mentioned during the call, it=
's on the SNP host-kernel patches.
>
> https://www.spinics.net/lists/kernel/msg5058122.html
>
> Jacob
>
> On Wed, Jan 17, 2024 at 4:48=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@sus=
e.de> wrote:
>>
>> Hi all,
>>
>> Just a reminder for todays SVSM Development call at 9am PST/6pm CET.
>>
>> If you have any agenda items you want to see covered, please let me know=
. Otherwise we will just do the usual rounds of updates and Q&A.
>>
>> We meet as usual at https://meet.google.com/ppv-xehx-dvb
>>
>> Regards,
>>
>> J=C3=B6rg R=C3=B6del
>> jroedel@suse.de
>>
>> SUSE Software Solutions Germany GmbH
>> Frankenstra=C3=9Fe 146
>> 90461 N=C3=BCrnberg
>> Germany
>> https://www.suse.com/
>>
>> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew McDonald, Werner Knoblich
>> (HRB 36809, AG N=C3=BCrnberg)
>>
>>
