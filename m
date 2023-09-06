Return-Path: <Carlos.Bilbao@amd.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 003B226623D
 for <svsm-devel@coconut-svsm.dev>; Wed,  6 Sep 2023 16:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWleLnQR07X12m/dfEqrED7givW5IfrXJKZ3ZCdQQFY=;
 b=hEF246VvzufMY5MaQbAXUG35yXWDGtP8+/LjKch032tr7ar2TCtX+nYx336UYdO2tP4h4yNOYo8G5n540j99nMglXGVq8aRv4kFRZMesX57wBgN2Ox9QQgoxTyAE/GcV0xKhSOaSH4bQc3j/5CD/wLYK0noTa6PYaxewCk4ZiOU=
Message-ID: <9ff1416f-5436-9148-73e1-fdd72ceb6285@amd.com>
Date: Wed, 6 Sep 2023 09:29:00 -0500
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: [svsm-devel] [RFC] task/schedule: Idle process?
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, Roy Hopkins <roy.hopkins@suse.com>

Hello,

The PR for the scheduler (#64) is still under review. In traditional OSs,
it makes sense to include an idle userspace process that does nothing and
is always there to be scheduled. So I was wondering if we should do the
same for the SVSM.

Currently, SVSM schedules the "root" task responsible for running the
request loop. However, in the event of a SvsmReqError:FatalError, this
process may terminate prematurely. This raises the question: should we
introduce an idle process in SVSM, or is it irrelevant in that context?

My first intuition is that if we don't have an idle process, then the SVSM
itself would terminate, and perhaps that would difficult further debugging
of potential errors. Or maybe it would not?

Thanks,
Carlos
