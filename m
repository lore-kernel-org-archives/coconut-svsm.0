Return-Path: <Huibo.Wang@amd.com>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6BDAE1A73CA
 for <svsm-devel@coconut-svsm.dev>; Fri, 15 Dec 2023 15:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2f5aHb2oMswT3VXwVvYSW2OBYO3cY4h3UpPXQhH7RI=;
 b=MQMUvouOcUCzPoZRkMYgxKbSye+2PhJeZdCXljo4NjaOd/aaz056O3+/VK86JeqkVL6Ky7sV0LeslnPO2kX8VWoylj/HNEXqrs9KlfjQva2Egd+xoawNWeVr7I73ycOCc+iCYrXQ1MbWaE4trJfmeskZVz+HC++Qf4joimJhKXM=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Fri, 15 Dec 2023 14:43:46 +0000
Message-ID: <IA1PR12MB8285C2EBBEE24D0689CA5C5D9593A@IA1PR12MB8285.namprd12.prod.outlook.com>
References: <mailman.1.1702638001.1836193.svsm-devel@coconut-svsm.dev>
In-Reply-To: <mailman.1.1702638001.1836193.svsm-devel@coconut-svsm.dev>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_IA1PR12MB8285C2EBBEE24D0689CA5C5D9593AIA1PR12MB8285namp_"
MIME-Version: 1.0
Subject: Re: [svsm-devel] Svsm-devel Digest, Vol 5, Issue 7
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_IA1PR12MB8285C2EBBEE24D0689CA5C5D9593AIA1PR12MB8285namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Great news! Thank you for the effort! :)

Thanks
Melody

Get Outlook for iOS<https://aka.ms/o0ukef>
________________________________
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> on behalf of svsm-de=
vel-request@coconut-svsm.dev <svsm-devel-request@coconut-svsm.dev>
Sent: Friday, December 15, 2023 3:00 AM
To: svsm-devel@coconut-svsm.dev <svsm-devel@coconut-svsm.dev>
Subject: Svsm-devel Digest, Vol 5, Issue 7

Send Svsm-devel mailing list submissions to
        svsm-devel@coconut-svsm.dev

To subscribe or unsubscribe via the World Wide Web, visit
        https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
or, via email, send a message with subject or body 'help' to
        svsm-devel-request@coconut-svsm.dev

You can reach the person managing the list at
        svsm-devel-owner@coconut-svsm.dev

When replying, please edit your Subject line so it is more specific
than "Re: Contents of Svsm-devel digest..."


Today's Topics:

   1. CCC TAC acceptance of COCONUT-SVSM (J?rg R?del)
   2. Re: CCC TAC acceptance of COCONUT-SVSM (Stefano Garzarella)


----------------------------------------------------------------------

Message: 1
Date: Thu, 14 Dec 2023 20:16:19 +0100
From: J?rg R?del <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev
Subject: [svsm-devel] CCC TAC acceptance of COCONUT-SVSM
Message-ID: <7F00DB2D-7BB2-4E2C-95D7-7C48C622AED4@8bytes.org>
Content-Type: text/plain;       charset=3Dutf-8

Hey,

As mentioned yesterday in our call, I presented the SVSM project submission=
 today in the TAC meeting and there were no major objections, so the CCC dr=
ove it to a vote.

I am happy to announce that the TAC uniformly voted to accept the COCONUT-S=
VSM project!

There are some more steps necessary within the CCC (Legal review and board =
vote), but what happened today is already a bit step forward to make the CO=
CONUT-SVSM an official CCC project.

Cheers,

J?rg

------------------------------

Message: 2
Date: Fri, 15 Dec 2023 11:59:09 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: J?rg R?del <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] CCC TAC acceptance of COCONUT-SVSM
Message-ID:
        <CAGxU2F6E35cBMSBo81u+qr7WGWGiLmi+3de_w5=3DzJOA_9cPToA@mail.gmail.c=
om>
Content-Type: text/plain; charset=3D"UTF-8"

On Thu, Dec 14, 2023 at 8:16?PM J?rg R?del <joro@8bytes.org> wrote:
>
> Hey,
>
> As mentioned yesterday in our call, I presented the SVSM project submissi=
on today in the TAC meeting and there were no major objections, so the CCC =
drove it to a vote.
>
> I am happy to announce that the TAC uniformly voted to accept the COCONUT=
-SVSM project!

Great news, thanks for the effort!

>
> There are some more steps necessary within the CCC (Legal review and boar=
d vote), but what happened today is already a bit step forward to make the =
COCONUT-SVSM an official CCC project.

If some help is required, just ask ;-)

Stefano



------------------------------

Subject: Digest Footer

Svsm-devel mailing list
Svsm-devel@coconut-svsm.dev
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel


------------------------------

End of Svsm-devel Digest, Vol 5, Issue 7
****************************************

--_000_IA1PR12MB8285C2EBBEE24D0689CA5C5D9593AIA1PR12MB8285namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Great news! Thank you for the effort! :)&nbsp;</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Thanks</div>
<div dir=3D"ltr">Melody&nbsp;</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Get <a href=3D"https://aka.ms/o0ukef">Outlook for iOS</a></div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>From:</b> Svsm-devel &lt;svsm-devel-bounces@coconut-svsm.dev&gt; on behalf=
 of svsm-devel-request@coconut-svsm.dev &lt;svsm-devel-request@coconut-svsm=
.dev&gt;<br>
<b>Sent:</b> Friday, December 15, 2023 3:00 AM<br>
<b>To:</b> svsm-devel@coconut-svsm.dev &lt;svsm-devel@coconut-svsm.dev&gt;<=
br>
<b>Subject:</b> Svsm-devel Digest, Vol 5, Issue 7
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Send Svsm-devel mailing list submissions to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svsm-devel@coconut-svsm.dev<br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://mail.8bytes.o=
rg/cgi-bin/mailman/listinfo/svsm-devel">https://mail.8bytes.org/cgi-bin/mai=
lman/listinfo/svsm-devel</a><br>
or, via email, send a message with subject or body 'help' to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svsm-devel-request@coconut-svsm.=
dev<br>
<br>
You can reach the person managing the list at<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svsm-devel-owner@coconut-svsm.de=
v<br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Svsm-devel digest...&quot;<br>
<br>
<br>
Today's Topics:<br>
<br>
&nbsp;&nbsp; 1. CCC TAC acceptance of COCONUT-SVSM (J?rg R?del)<br>
&nbsp;&nbsp; 2. Re: CCC TAC acceptance of COCONUT-SVSM (Stefano Garzarella)=
<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Thu, 14 Dec 2023 20:16:19 +0100<br>
From: J?rg R?del &lt;joro@8bytes.org&gt;<br>
To: svsm-devel@coconut-svsm.dev<br>
Subject: [svsm-devel] CCC TAC acceptance of COCONUT-SVSM<br>
Message-ID: &lt;7F00DB2D-7BB2-4E2C-95D7-7C48C622AED4@8bytes.org&gt;<br>
Content-Type: text/plain;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; charset=3Dutf=
-8<br>
<br>
Hey,<br>
<br>
As mentioned yesterday in our call, I presented the SVSM project submission=
 today in the TAC meeting and there were no major objections, so the CCC dr=
ove it to a vote.<br>
<br>
I am happy to announce that the TAC uniformly voted to accept the COCONUT-S=
VSM project!<br>
<br>
There are some more steps necessary within the CCC (Legal review and board =
vote), but what happened today is already a bit step forward to make the CO=
CONUT-SVSM an official CCC project.<br>
<br>
Cheers,<br>
<br>
J?rg<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Fri, 15 Dec 2023 11:59:09 +0100<br>
From: Stefano Garzarella &lt;sgarzare@redhat.com&gt;<br>
To: J?rg R?del &lt;joro@8bytes.org&gt;<br>
Cc: svsm-devel@coconut-svsm.dev<br>
Subject: Re: [svsm-devel] CCC TAC acceptance of COCONUT-SVSM<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;CAGxU2F6E35cBMSBo81u+qr7WGWG=
iLmi+3de_w5=3DzJOA_9cPToA@mail.gmail.com&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
On Thu, Dec 14, 2023 at 8:16?PM J?rg R?del &lt;joro@8bytes.org&gt; wrote:<b=
r>
&gt;<br>
&gt; Hey,<br>
&gt;<br>
&gt; As mentioned yesterday in our call, I presented the SVSM project submi=
ssion today in the TAC meeting and there were no major objections, so the C=
CC drove it to a vote.<br>
&gt;<br>
&gt; I am happy to announce that the TAC uniformly voted to accept the COCO=
NUT-SVSM project!<br>
<br>
Great news, thanks for the effort!<br>
<br>
&gt;<br>
&gt; There are some more steps necessary within the CCC (Legal review and b=
oard vote), but what happened today is already a bit step forward to make t=
he COCONUT-SVSM an official CCC project.<br>
<br>
If some help is required, just ask ;-)<br>
<br>
Stefano<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
Svsm-devel mailing list<br>
Svsm-devel@coconut-svsm.dev<br>
<a href=3D"https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel">htt=
ps://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Svsm-devel Digest, Vol 5, Issue 7<br>
****************************************<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_IA1PR12MB8285C2EBBEE24D0689CA5C5D9593AIA1PR12MB8285namp_--
