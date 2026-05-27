Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8D43634A
	for <coconut-svsm@lists.linux.dev>; Wed, 27 May 2026 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896092; cv=none; b=ecodCHShAzkU9zQMS7qFJRboJopso7o5xeYIlg1UpHi7Zo3EIVmf9ItpZ6K6NpUsgLD2+IbdbNBmyge+VGjSwV0ciyGiaQFqsFGZqvBWmCCXv/Qwm+O4ZfB7/bMX3qhWEkCO7t/poOFHPFBHDk0NF2qKaCmyrJ5X8vmV1P1VgyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896092; c=relaxed/simple;
	bh=1ec+pVpqeVLhWCe7xUB7KjuK6D+1xR+jbGakCt2aScw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r129XKY9CoXxuunQ5AblCD1UBqVW4BLtWuM2yB6lUYr8Dc3s9HmatA0aR3r8sycBzP/bXw8x9ZeprKW5Mp//RrKEb31mjhHvZ90M3gYw2gfODrOpJjSnsmiA9aeCeMKKmwcOIQJaNBLxYdM0RnPX0gs+KTdWEB8rwvaism9LtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9sLs+M0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9sLs+M0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4905e190c71so41624905e9.3
        for <coconut-svsm@lists.linux.dev>; Wed, 27 May 2026 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779896087; x=1780500887; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rF1sdUt+x3ES0J+bZHKGMYq3dPxPJDXhYXNfFWraH5k=;
        b=C9sLs+M0aYiltT2/XRiNLKxjAW/jQBpAAY7Xq3QsGm6uffPm/iBdlkr1ath0XAHXOT
         p4B4pk9QXnki8tYarjMsMlC+p3O5WnUSpYHl83Jbd3suIPoVfhrb7NZyfhYj+cWpxMcO
         RT2pDc+64HMw25KMCqMtNhuavwuG8R9u5BXDQCeg1oGw1mM+yNr+UBtD31GTiRUB3lVP
         PvJXIYYmb1CWncorJ2LOImaHKZnu8tncViL50wRxLIc9SmxmTySYZ3Bi/m3PUlm5LV6Z
         ui5nam/i+1pbmkCvI3hS7zfzQLJ61KK+mZFRHCYkpnsoqt84snwiKRgkuME3CTok3zBT
         Kc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896087; x=1780500887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rF1sdUt+x3ES0J+bZHKGMYq3dPxPJDXhYXNfFWraH5k=;
        b=ci7PCNYE3g27dpvaIP9Jx1sorM5zmx84Pe6LW5WIk5x3CbJUSP+nhBmsMImixRzrZq
         eNzVoUFFz+7Tj3QWuXtUCn2IuzXixDHqzEjHsKKnBzQi2MKYh3K55OnEqlUmltd2ilvT
         47ufWaaPUv0vVKx3zMkU8hqaguJeu0l+EbGnHh8VUVcQ5cIupD/VLZuWZ2uiDw/2+bKp
         Ryus8sYQZxZp5El87PoKbWdowO9AQcF8TpaggjLvZcbB7Dg7YePFH9/KS3pCw7OLPrp3
         avF/uTFVLSRlkNUgIhQHyoWM36f5FjtdSGZs8mcVErt1kAdXdzUZ6jqrgXa7bECqM7Bb
         toVA==
X-Forwarded-Encrypted: i=1; AFNElJ8vb0uQRHLCQ9fKlt3WHwioBtLs2xCAXq+gSLQ/IOxdnkyllUSAEucL5OH4zTxOUXcTGJTxcDEhl3Z7MFE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9MWjc/ElRLRIGVP/MZCetkw7+IGi2o86/b8lY4CrcyTSO6Ss6
	0BANqMSpSNO5SGJ8FfDbxgPFCPZ9TgiZ1wRJnpXDhadA/txacrUxvMnT
X-Gm-Gg: Acq92OEpmFb4+njBlJGFlJZcd/SgHBZDmyZdCAu68HrcSSBOvB2rxuFhY3TABCgJLWL
	2nzQGnK3ZHnB7W7XS0YlstIaIO6nZWaqRImcEjKfJiuvEOi/dAggAnibnu9zCVJbMhBoTZT1iYE
	CC8Ee+tm/M6QrkOO7KzfdOM/5jKCaNsbsvIIYK3sx+BtW95EFkzLen7kFDO4nsg/e4/OfE1P6fQ
	aB0D3gvPoUxtJapG0M1xZIvy/hiTKLCNiaq7WwDYB9jXe0uxjakqlqZa+dCxEaUdDmW9qfHUgkO
	Y29Zsbs1dWyKRhaAnI9YTpwtJLiGeBHuvfWjKksQMpG53qOJAinUcOSIf6qJ2UCOXeMvw9dsFLE
	TqOwijH/oFZ/RQegOVPc7IB6j/GfHnwaxfX/CgeLSR7UHKkvmrlA4QHjujBgRey8B+Y+pJTCruY
	2qMNNajyolazMcM2DE6b5rSHzvHRCK1L1ZJY4om47/Ud6RcvPumq3wg+aq5xzPFBSV/IV73C4c4
	zW4I8k=
X-Received: by 2002:a05:600c:c4a1:b0:490:3fd9:e78b with SMTP id 5b1f17b1804b1-490426cef8bmr400420045e9.17.1779896087157;
        Wed, 27 May 2026 08:34:47 -0700 (PDT)
Received: from [192.168.1.50] (static-82-85-206-37.clienti.tiscali.it. [82.85.206.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908098f57asm18458415e9.20.2026.05.27.08.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:34:46 -0700 (PDT)
Message-ID: <ecd045de-8649-4bd6-a3e2-fecb6371f7b3@gmail.com>
Date: Wed, 27 May 2026 17:34:45 +0200
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call May 27th, 2026
To: Stefano Garzarella <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev,
 linux-coco@lists.linux.dev
Cc: Tanish Desai <tanishdesai37@gmail.com>
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
 <CAGxU2F4uJLH5OTv+y4712vmNBogfSspN-nJHzDJAz9N6HWeg2g@mail.gmail.com>
Content-Language: en-US
From: Nicola Ramacciotti <niko.ramak@gmail.com>
In-Reply-To: <CAGxU2F4uJLH5OTv+y4712vmNBogfSspN-nJHzDJAz9N6HWeg2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 5/27/26 17:12, Stefano Garzarella wrote:
> On Tue, 26 May 2026 at 17:46, Stefano Garzarella <sgarzare@redhat.com> wrote:
>> Hi,
>>
>> Here is the call for agenda items for this weeks SVSM development
>> call. Please send any agenda items you have in mind as a reply to this
>> email or raise them in the meeting.
> One topic could be the 2 GSoC projects we have this year.
> If Nicola and Tanish join, it would be nice to allow them some time to
> present their projects. They will work with the COCONUT community
> during the summer :-)


Great. I'll be there!

Regards,
Nicola


>
> Stefano
>
>> We will use the LF Zoom instance. Details of the meeting can be found
>> in our governance repository at:
>>
>>          https://github.com/coconut-svsm/governance
>>
>> The link to the COCONUT-SVSM calendar is:
>>
>>          https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week
>>
>> The meeting will be recorded and the recording eventually published.
>>
>> Regards,
>> Stefano
