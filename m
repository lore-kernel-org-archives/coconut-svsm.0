Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0575C269E4B
 for <svsm-devel@coconut-svsm.dev>; Fri,  1 Sep 2023 09:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693552580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=w3pk97PZNfEbXxDeyUY23UGSl06xmIBix9vt7Hwj+Dk=;
 b=fTqiCTviT9I398WDAbZirWkNJ4N6090MjP+Vv1tOmo8rZcWdn2wfuWChXo6oBOp0xT9FgW
 9hcvUJptkROTBFfFxd2w1MmfRBZYcuaUmHX45QT6TOnNioFE9wP44QqQ0QGLnNxnk93D0J
 p7D0PKe0G6bUAxosnw3mdtuUDhV8CGA=
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-52a0f6f7a3bso2613195a12.1
 for <svsm-devel@coconut-svsm.dev>; Fri, 01 Sep 2023 00:16:19 -0700 (PDT)
Date: Fri, 1 Sep 2023 09:16:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <z2vwvalpnvne2yj7kuui7or5l37hzq53l5jdmvg7wu3s5hwvqg@jqc2tsajdppq>
MIME-Version: 1.0
In-Reply-To: <PBqvbMM28sdqewQ@suse.de>
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: jroedel@suse.de
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hi Jörg,
Thursday and Friday are preferable for me.

Thanks,
Stefano

On Fri, Aug 31, 2023 at 12:26:07AM -0700, Jörg Rödel wrote:
>> Hi,
>>
>> I talked to a couple of people recently about our SVSM project and the
>> idea came up to schedule a semi-regular call where the community can
>> sync on development and direction of the project.
>>
>> It also fits my wish to be more transparent about our direction and work
>> and helps move discussions out of private formats to a more public
>> community forum.
>>
>> So I wanted to propose a couple of time slots and see what people think.
>> The idea is to have a meeting every 2 weeks, I will collect and post an
>> agenda beforehand and we can always cancel if there is nothing to talk
>> about.
>>
>> Some time slots that would work for me:
>>
>>                   CEST   ET     CT     PST
>>
>>         Tuesday   5pm    11am   10am   8am
>>                   6pm    12pm   11am   9am
>>
>>         Wednesday 5pm    11am   10am   8am
>>                   6pm    12pm   11am   9am
>>
>>         Thursday  6pm    12pm   11am   9am
>>
>>         Friday    4pm    10am    9am   7am
>>
>> I have only considered slots that work well for participants joining
>> from America or Europe/Africa because most people I talked to live in
>> these areas. If people living in Asia/Australia time zones want to join
>> as well please let me know. We can use alternating time slots to make
>> this possible.
>>
>> Please let me know what you think.
>>
>> Thanks,
>>
>> --
>> Jörg Rödel
>> jroedel@suse.de
>>
>> SUSE Software Solutions Germany GmbH
>> Frankenstraße 146
>> 90461 Nürnberg
>> Germany
>>
>> (HRB 36809, AG Nürnberg)
>> Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>>
>
>-- 
>Svsm-devel mailing list
>Svsm-devel@coconut-svsm.dev
>https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel

