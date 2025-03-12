Return-Path: <Pankaj.Gupta@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::604])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A1FB1455FD
 for <svsm-devel@coconut-svsm.dev>; Wed, 12 Mar 2025 21:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwBLM0aWSCZd2yMlXkNTyRR9JkgcuH+uXduvpQSiwK4=;
 b=aTmjYc79hXT8FlIn4G0LpfWFR6vT3zr/nkidIg8Ht3n3DktqaTTqQdU8+qv92KUck9+Lo2iw3CYh16xC+gYUnzO9eqWn3r/owBL1wkWBc2yISimib+QgLTuuvdFuMz//36PZiLTro+ON/y0/Uq4z0Lk6PQN3cEFzLzV07x8WfW4=
Message-ID: <46ddc943-8501-4af3-b676-2cdd7e87b378@amd.com>
Date: Wed, 12 Mar 2025 21:05:50 +0100
References: <Z9FSCnYWkV0g12R0@8bytes.org>
 <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com> <Z9FbpnCBjpYgOYI3@8bytes.org>
 <c289de63-1723-4c00-9c3d-69628b80bec8@amd.com> <Z9GgKF7w6Qa-HpIM@8bytes.org>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <Z9GgKF7w6Qa-HpIM@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: svsm-devel@coconut-svsm.dev, Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>

+CC [Tom & John]

> On Wed, Mar 12, 2025 at 03:33:15PM +0100, Gupta, Pankaj wrote:
>> So, the support was not working and got triggered when config check in
>> 'determine_cet_support()' was removed.
> 
> Right, actually it was broken before already when building with the
> shadow-stack feature. But since this was not enabled by default nobody
> noticed. With the feature check removed it triggered for everyone.

O.k. Should the KVM fix also goto Upstream KVM as well?

Thanks,
Pankaj
