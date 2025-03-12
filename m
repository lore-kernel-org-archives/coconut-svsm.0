Return-Path: <Pankaj.Gupta@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::601])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A4DEE457E0
 for <svsm-devel@coconut-svsm.dev>; Wed, 12 Mar 2025 15:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnEQ3RtiKbfvl3nkIkTkJCWuznGrihMAp9SiQCencIs=;
 b=LMXlH3sbvJHp4Q+M7NkK9NCZdNT+SXkJtPGpgG01FxLXbpiXMsSOFDJedIaeC9yv/Je+lDGTC+iXrZEnj6xRryC7DKKxJizS6D48TAMRS/Hay1NcAjHIWiwY1KuEm2M01CKQWeKlKGZcu3lFP5ZhSevkAEKno6SvxJB9hVTakIg=
Message-ID: <c289de63-1723-4c00-9c3d-69628b80bec8@amd.com>
Date: Wed, 12 Mar 2025 15:33:15 +0100
References: <Z9FSCnYWkV0g12R0@8bytes.org>
 <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com> <Z9FbpnCBjpYgOYI3@8bytes.org>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <Z9FbpnCBjpYgOYI3@8bytes.org>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] SVSM Host Kernel KVM Update Required
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 3/12/2025 11:02 AM, Jörg Rödel wrote:
> Hi Pankaj,
> 
> On Wed, Mar 12, 2025 at 10:36:17AM +0100, Gupta, Pankaj wrote:
>> Would you mind sharing the #PR? Now, I am wondering why I did not notice any
>> no boot scenario at all.
> 
> The PR that triggered the breakage on the SVSM side was:
> 
> 	https://github.com/coconut-svsm/svsm/pull/630
> 
> The PR removing the intercepts and fixing boot for the SVSM Linux
> repository was:
> 
> 	https://github.com/coconut-svsm/linux/pull/10
> 
> Note that part of the problem was that COCONUT determines CET support
> by checking whether it can successfully change the CR4.CET bit. With a
> CPUID check this would probably not have happened, but that early in the
> SVSM boot process CPUID is not working yet.

Thanks for sharing more details about the cause and fixing it!

So, the support was not working and got triggered when config check in 
'determine_cet_support()' was removed.

Best regards,
Pankaj

