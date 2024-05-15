Return-Path: <clopez@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CCBB71C4481
 for <svsm-devel@coconut-svsm.dev>; Wed, 15 May 2024 13:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715774396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
 b=I+uepwujIF1yk9SvDrneLFi89dMeOqF6OPdapeuBvZdTVRg/QQQXHZU0PVjJPQObC5jT2c
 WMyatiOrqnR0fyH+ZMry5W0D+IqcE8iV0+8iimYPkzE11Dkd5Mm09Rey1jIldLFgdlJkk0
 B6BGv3Y/V80vehuNCgfVwniooBSx6yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715774396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
 b=gdf4cc49tzfkiH5qLjfQ/qEomrKxPPvWN64Oy58sz9YgmHqeUvWCJ2wJZnCSgoaAHnaDtT
 wRlMQvskSnrPqeCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715774396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
 b=I+uepwujIF1yk9SvDrneLFi89dMeOqF6OPdapeuBvZdTVRg/QQQXHZU0PVjJPQObC5jT2c
 WMyatiOrqnR0fyH+ZMry5W0D+IqcE8iV0+8iimYPkzE11Dkd5Mm09Rey1jIldLFgdlJkk0
 B6BGv3Y/V80vehuNCgfVwniooBSx6yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715774396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
 b=gdf4cc49tzfkiH5qLjfQ/qEomrKxPPvWN64Oy58sz9YgmHqeUvWCJ2wJZnCSgoaAHnaDtT
 wRlMQvskSnrPqeCQ==
Message-ID: <d62c34bd-62c0-4f09-8612-0c20dc62ea44@suse.de>
Date: Wed, 15 May 2024 13:59:55 +0200
MIME-Version: 1.0
References: <Zj30Nqq3OS58DwpP@8bytes.org> <ZkMpkfepqUWfq1RY@8bytes.org>
 <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] Development Plan Document
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Reshetova, Elena" <elena.reshetova@intel.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"


Hi,

On 15/5/24 12:20, Reshetova, Elena wrote:
> 5. Section 12.2: by double-validation you mean the case when a private page
> is added twice to the CVM (reaccept in TDX terms)?

I am not familiar with TDX, but I think so, yes. It means that the same
GPA is accepted twice by the guest. This opens a window for the
hypervisor to remap the GPA to a different HPA, at least on SEV-SNP.

Best,
Carlos

-- 
Carlos López
Security Engineer
SUSE Software Solutions
