Return-Path: <clopez@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E55FA1E238D
 for <svsm-devel@coconut-svsm.dev>; Tue, 19 Mar 2024 14:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710854455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
 b=r5o3NEPloGvLFp+IEreqhxc3E5XDLanqEibnSgh/bjm1xtJbBUHnCh3sHi90jyj7rv+di5
 KSKHgq3bqHNCY5Uh5X/KIjgt5Z2G4CnLgamh+dRYMh0W+wMU02TvMBPwjDRjPKS//Y0lji
 pji2WjoIvlW21qdP6hcT5NoceCdjgpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710854455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
 b=IPienAxaCLZNImQQb7APVuXEtwm2sRkDUGtlKkfqJsCj0TnUTIg3kLFVvZVu5gskwLMDuY
 setcMO222uAYYuDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710854455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
 b=r5o3NEPloGvLFp+IEreqhxc3E5XDLanqEibnSgh/bjm1xtJbBUHnCh3sHi90jyj7rv+di5
 KSKHgq3bqHNCY5Uh5X/KIjgt5Z2G4CnLgamh+dRYMh0W+wMU02TvMBPwjDRjPKS//Y0lji
 pji2WjoIvlW21qdP6hcT5NoceCdjgpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710854455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
 b=IPienAxaCLZNImQQb7APVuXEtwm2sRkDUGtlKkfqJsCj0TnUTIg3kLFVvZVu5gskwLMDuY
 setcMO222uAYYuDA==
Message-ID: <7e201984-862f-4503-bdfb-006dc685f205@suse.de>
Date: Tue, 19 Mar 2024 14:20:50 +0100
MIME-Version: 1.0
References: <ZfmPIXGDd-69c9xp@8bytes.org>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <ZfmPIXGDd-69c9xp@8bytes.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] SVSM Development Call March 20th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hi,

On 19/3/24 14:12, Jörg Rödel wrote:
> Hi,
> 
> Here is the usual call for agenda items for this weeks SVSM development
> call. My agenda so far is:
> 
> 	* vTPM merge
> 	* SVSM attestation architecture
> 	* Vendored dependencies in the repo

Should we also discuss the status of the TryBox PR?

Best,
Carlos

-- 
Carlos López
Security Engineer
SUSE Software Solutions
