Return-Path: <Huibo.Wang@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 472134A80E
 for <svsm-devel@coconut-svsm.dev>; Thu,  8 May 2025 00:24:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm+r5xMWAW+HZd9NXHJlPe0140VQnKTMTRRzzR3sByg=;
 b=Rms23FtmZPkXHXYg0wpapkgD1pLlgsu5IWG9iWJM/eGj5H6000BfhOz5RJ3Ql7j9ibdfGvG2ykKseuWypi3uXyfGuLSQjBQ9LtCXPbqNJ5gll8J0tugYQMrwGj6K3DwiUprN/jhbWxTCKzBeu8x51hU0Ls69upUVKBlacVYputg=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Wed, 7 May 2025 22:24:48 +0000
Message-ID: <IA1PR12MB82855443C02E2E6A948BE2BC9588A@IA1PR12MB8285.namprd12.prod.outlook.com>
References: <86219652-1174-4965-8aaa-11a05f2c1f46@amd.com>
 <SA6PR21MB4303E5A246588F3CC3E6C288CA8E2@SA6PR21MB4303.namprd21.prod.outlook.com>
 <b5b827f6-79f3-4012-be17-4317b0ed965d@amd.com>
 <1c49bccf-0ca2-482a-9ed0-c1f5b563e9e5@amd.com>
 <SA6PR21MB4303AC7E8DEA9C48B34A8641CA88A@SA6PR21MB4303.namprd21.prod.outlook.com>
In-Reply-To: <SA6PR21MB4303AC7E8DEA9C48B34A8641CA88A@SA6PR21MB4303.namprd21.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_IA1PR12MB82855443C02E2E6A948BE2BC9588AIA1PR12MB8285namp_"
MIME-Version: 1.0
Subject: Re: [svsm-devel] [EXTERNAL] Extended Interrupt Information
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jon Lange <jlange@microsoft.com>
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_IA1PR12MB82855443C02E2E6A948BE2BC9588AIA1PR12MB8285namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Thank you for the confirmation.

Thanks,
Melody

Get Outlook for iOS<https://aka.ms/o0ukef>
________________________________
From: Jon Lange <jlange@microsoft.com>
Sent: Wednesday, May 7, 2025 1:49:17 PM
To: Wang, Huibo <Huibo.Wang@amd.com>
Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com>; J=F6rg R=F6del <joro@8bytes=
.org>; svsm-devel@coconut-svsm.dev <svsm-devel@coconut-svsm.dev>
Subject: RE: [EXTERNAL] Extended Interrupt Information

Correct.  The #HV doorbell info is 256 bytes total, with 64 bytes dedicated=
 to each VMPL.  The first four bytes of each 64 bytes have identical format=
s across VMPLs, but the vmpl[123]_irq fields are only meaningful in the are=
a associated with VMPL 0.  The next 28 bytes (pending interrupt vector bitm=
ap) also have identical formats across VMPLs.  The last 32 bytes of each 64=
 bytes are reserved in case we need to define new per-VMPL information in t=
he future.

-Jon

-----Original Message-----
From: Melody (Huibo) Wang <huibo.wang@amd.com>
Sent: Wednesday, May 7, 2025 1:44 PM
To: Jon Lange <jlange@microsoft.com>
Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com>; J=F6rg R=F6del <joro@8bytes=
.org>; svsm-devel@coconut-svsm.dev
Subject: Re: [EXTERNAL] Extended Interrupt Information

Hi Jon,

I am updating the GHCB spec with Alternate Injection info.

Regarding this paragraph in the AI spec: "To indicate separate interrupt so=
urces for each VMPL, the #HV doorbell page is further extended to define th=
e first 256 bytes. Bytes 0-31 contain interrupt information associated with=
 VMPL0 itself."

So this is 256 bytes in total (!) and the first 4 bytes - PendingEvent and =
InjectionInfo - are included in those 256 bytes, correct?

The layout is NOT PendingEvent, InjectionInfo, 256 more bytes for a total o=
f 260 bytes, right?

IOW, the first 4 bytes are part of the SVSM interrupt information, which is=
 how I did it in my test program.

Sorry but I would like to absolutely make sure this is crystal clear in the=
 GHCB spec so that there are no ambiguities.

Thanks a lot!

Melody



On 5/5/2025 3:31 PM, Melody (Huibo) Wang wrote:
> Thanks for confirming, it helps. :)
>
> Thanks,
> Melody
>
> On 5/5/2025 3:19 PM, Jon Lange wrote:
>> I believe your definitions are correct.
>>
>> -Jon
>>
>> -----Original Message-----
>> From: Melody (Huibo) Wang <huibo.wang@amd.com>
>> Sent: Sunday, May 4, 2025 1:28 PM
>> To: Jon Lange <jlange@microsoft.com>
>> Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com>; J=F6rg R=F6del
>> <joro@8bytes.org>; svsm-devel@coconut-svsm.dev
>> Subject: [EXTERNAL] Extended Interrupt Information
>>
>> Hi Jon,
>>
>> I have written a small C program that implements the new #HV doorbell pa=
ge with extended interrupt information.
>>
>> Could you please confirm that my reading of the spec is correct, especia=
lly fields layout and order?
>>
>> #include <errno.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <string.h>
>> #include <assert.h>
>>
>> #define PAGE_SIZE            4096
>>
>> #define DIV_ROUND_UP(n,d)    (((n) + (d) - 1) / (d))
>>
>> #define BITS_PER_TYPE(type)  (sizeof(type) * 8)
>> #define BITS_TO_LONGS(nr)    DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
>>
>> #define DECLARE_BITMAP(name,bits) \
>>       unsigned long name[BITS_TO_LONGS(bits)]
>>
>> typedef unsigned char u8;
>> typedef unsigned short u16;
>>
>> /*
>>  * Hypervisor doorbell page:
>>  *
>>  * Used when restricted injection is enabled for a VM. One page in
>> size that
>>  * is shared between the guest and hypervisor to communicate
>> exception and
>>  * interrupt events.
>>  */
>> struct ext_irq_desc {
>>       /* first 16-bit word */
>>       struct {
>>               u16 si_vector:          8,
>>                   nmi:         1,
>>                   mce:         1,
>>                   trigger_mode:        1,
>>                   reserved1:           3,
>>                   multi_interrupts:    1,
>>                   reserved2:           1;
>>       } word0;
>>
>>       /* Second 16-bit word */
>>       struct {
>>               u16 reserved5:          15,
>>                   interrupt_vector:    1;
>>       } word1;
>>
>>       /*
>>        * Set the corresponding vmpl?_irq bit in inj_info after setting
>>        * multiple bits here.
>>        */
>>         u16 interrupt_bit_vector[14];
>>
>>       /*
>>        * Reserved for future use.
>>        * TODO: Code should check them and fail if set.
>>        */
>>         u8 reserved6[32];
>> } __attribute__((packed));
>>
>> struct hvdb {
>>       /* first 16-bit word PendingEvent */
>>       struct {
>>               /* Non-maskable event indicators */
>>               u16 reserved1:          8,
>>               nmi:                    1,
>>               mce:                    1,
>>               reserved2:              5,
>>               no_further_signal:      1;
>>       } pending_event;
>>
>>       /* Second 16-bit word InjectionInfo */
>>       union {
>>               struct {
>>                       u16 no_eoi_required:    1,
>>                           reserved3:           7,
>>                           vmpl1_irq:           1,
>>                           vmpl2_irq:           1,
>>                           vmpl3_irq:           1,
>>                           reserved4:           4;
>>               } inj_info;
>>               u16 injection_info;
>>       };
>>
>>       /* IRQ info associated with the SVSM itself */
>>       /* XXX: code should enforce bytes [32-63] are zero */
>>       u8 svsm_irq_info[64 - 4];
>>
>>       /* VMPL[1-3] extended IRQ descriptors */
>>         struct ext_irq_desc irqs[3];
>>
>>         /* Remainder of the page is for software use */
>>         u8 reserved[PAGE_SIZE - 256]; } __attribute__((packed));
>>
>> int main(void)
>> {
>>       struct hvdb h =3D { };
>>
>>       assert(sizeof(struct ext_irq_desc) =3D=3D 64);
>>
>>       printf("sizeof(struct ext_irq_desc): %zu\n", sizeof(struct
>> ext_irq_desc));
>>
>>       h.inj_info.no_eoi_required =3D 1;
>>       h.inj_info.vmpl3_irq =3D 1;
>>
>>       printf("injection_info: 0x%x\n", h.injection_info);
>>
>>       return 0;
>> }
>>
>>
>> Thanks,
>> Melody
>


--_000_IA1PR12MB82855443C02E2E6A948BE2BC9588AIA1PR12MB8285namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div>
<div dir=3D"ltr">Thank you for the confirmation.&nbsp;</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Thanks,</div>
<div dir=3D"ltr">Melody&nbsp;</div>
</div>
<div id=3D"ms-outlook-mobile-body-separator-line" dir=3D"auto"><br>
</div>
<div id=3D"ms-outlook-mobile-signature">Get <a href=3D"https://aka.ms/o0uke=
f">Outlook for iOS</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jon Lange &lt;jlange@=
microsoft.com&gt;<br>
<b>Sent:</b> Wednesday, May 7, 2025 1:49:17 PM<br>
<b>To:</b> Wang, Huibo &lt;Huibo.Wang@amd.com&gt;<br>
<b>Cc:</b> Lendacky, Thomas &lt;Thomas.Lendacky@amd.com&gt;; J=F6rg R=F6del=
 &lt;joro@8bytes.org&gt;; svsm-devel@coconut-svsm.dev &lt;svsm-devel@coconu=
t-svsm.dev&gt;<br>
<b>Subject:</b> RE: [EXTERNAL] Extended Interrupt Information</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Correct.&nbsp; The #HV doorbell info is 256 bytes =
total, with 64 bytes dedicated to each VMPL.&nbsp; The first four bytes of =
each 64 bytes have identical formats across VMPLs, but the vmpl[123]_irq fi=
elds are only meaningful in the area associated
 with VMPL 0.&nbsp; The next 28 bytes (pending interrupt vector bitmap) als=
o have identical formats across VMPLs.&nbsp; The last 32 bytes of each 64 b=
ytes are reserved in case we need to define new per-VMPL information in the=
 future.<br>
<br>
-Jon<br>
<br>
-----Original Message-----<br>
From: Melody (Huibo) Wang &lt;huibo.wang@amd.com&gt; <br>
Sent: Wednesday, May 7, 2025 1:44 PM<br>
To: Jon Lange &lt;jlange@microsoft.com&gt;<br>
Cc: Lendacky, Thomas &lt;Thomas.Lendacky@amd.com&gt;; J=F6rg R=F6del &lt;jo=
ro@8bytes.org&gt;; svsm-devel@coconut-svsm.dev<br>
Subject: Re: [EXTERNAL] Extended Interrupt Information<br>
<br>
Hi Jon,<br>
<br>
I am updating the GHCB spec with Alternate Injection info. <br>
<br>
Regarding this paragraph in the AI spec: &quot;To indicate separate interru=
pt sources for each VMPL, the #HV doorbell page is further extended to defi=
ne the first 256 bytes. Bytes 0-31 contain interrupt information associated=
 with VMPL0 itself.&quot;
<br>
<br>
So this is 256 bytes in total (!) and the first 4 bytes - PendingEvent and =
InjectionInfo - are included in those 256 bytes, correct?<br>
<br>
The layout is NOT PendingEvent, InjectionInfo, 256 more bytes for a total o=
f 260 bytes, right?<br>
<br>
IOW, the first 4 bytes are part of the SVSM interrupt information, which is=
 how I did it in my test program.<br>
<br>
Sorry but I would like to absolutely make sure this is crystal clear in the=
 GHCB spec so that there are no ambiguities.<br>
<br>
Thanks a lot!<br>
<br>
Melody<br>
<br>
<br>
<br>
On 5/5/2025 3:31 PM, Melody (Huibo) Wang wrote:<br>
&gt; Thanks for confirming, it helps. :)<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Melody<br>
&gt; <br>
&gt; On 5/5/2025 3:19 PM, Jon Lange wrote:<br>
&gt;&gt; I believe your definitions are correct.<br>
&gt;&gt;<br>
&gt;&gt; -Jon<br>
&gt;&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Melody (Huibo) Wang &lt;huibo.wang@amd.com&gt;<br>
&gt;&gt; Sent: Sunday, May 4, 2025 1:28 PM<br>
&gt;&gt; To: Jon Lange &lt;jlange@microsoft.com&gt;<br>
&gt;&gt; Cc: Lendacky, Thomas &lt;Thomas.Lendacky@amd.com&gt;; J=F6rg R=F6d=
el <br>
&gt;&gt; &lt;joro@8bytes.org&gt;; svsm-devel@coconut-svsm.dev<br>
&gt;&gt; Subject: [EXTERNAL] Extended Interrupt Information<br>
&gt;&gt;<br>
&gt;&gt; Hi Jon,<br>
&gt;&gt;<br>
&gt;&gt; I have written a small C program that implements the new #HV doorb=
ell page with extended interrupt information.
<br>
&gt;&gt;<br>
&gt;&gt; Could you please confirm that my reading of the spec is correct, e=
specially fields layout and order?
<br>
&gt;&gt;<br>
&gt;&gt; #include &lt;errno.h&gt;<br>
&gt;&gt; #include &lt;stdio.h&gt;<br>
&gt;&gt; #include &lt;stdlib.h&gt;<br>
&gt;&gt; #include &lt;string.h&gt;<br>
&gt;&gt; #include &lt;assert.h&gt;<br>
&gt;&gt;<br>
&gt;&gt; #define PAGE_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 4096<br>
&gt;&gt;<br>
&gt;&gt; #define DIV_ROUND_UP(n,d)&nbsp;&nbsp;&nbsp; (((n) + (d) - 1) / (d)=
)<br>
&gt;&gt;<br>
&gt;&gt; #define BITS_PER_TYPE(type)&nbsp; (sizeof(type) * 8)<br>
&gt;&gt; #define BITS_TO_LONGS(nr)&nbsp;&nbsp;&nbsp; DIV_ROUND_UP(nr, BITS_=
PER_TYPE(long))<br>
&gt;&gt;<br>
&gt;&gt; #define DECLARE_BITMAP(name,bits) \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long name[BITS_TO_LON=
GS(bits)]<br>
&gt;&gt;<br>
&gt;&gt; typedef unsigned char u8;<br>
&gt;&gt; typedef unsigned short u16;<br>
&gt;&gt;<br>
&gt;&gt; /*<br>
&gt;&gt;&nbsp; * Hypervisor doorbell page:<br>
&gt;&gt;&nbsp; *<br>
&gt;&gt;&nbsp; * Used when restricted injection is enabled for a VM. One pa=
ge in <br>
&gt;&gt; size that<br>
&gt;&gt;&nbsp; * is shared between the guest and hypervisor to communicate =
<br>
&gt;&gt; exception and<br>
&gt;&gt;&nbsp; * interrupt events.<br>
&gt;&gt;&nbsp; */<br>
&gt;&gt; struct ext_irq_desc {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* first 16-bit word */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; u16 si_vector:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 8,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nmi:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mce:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trigger_mode:&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reserved1:&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multi_interrupts:&nbsp;&nbsp;&nbs=
p; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reserved2:&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } word0;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Second 16-bit word */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; u16 reserved5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 15,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt_vector:&nbsp;&nbsp;&nbs=
p; 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } word1;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Set the corresponding =
vmpl?_irq bit in inj_info after setting<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * multiple bits here.<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 interrupt_bit_=
vector[14];<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Reserved for future us=
e.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * TODO: Code should chec=
k them and fail if set.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 reserved6[32];<=
br>
&gt;&gt; } __attribute__((packed));<br>
&gt;&gt;<br>
&gt;&gt; struct hvdb {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* first 16-bit word PendingEv=
ent */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; /* Non-maskable event indicators */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; u16 reserved1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 8,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; nmi:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; mce:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; reserved2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; no_further_signal:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } pending_event;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Second 16-bit word Injectio=
nInfo */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 no_eo=
i_required:&nbsp;&nbsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; reserved3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 7,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; vmpl1_irq:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; vmpl2_irq:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; vmpl3_irq:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 1,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; reserved4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 4;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; } inj_info;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; u16 injection_info;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IRQ info associated with th=
e SVSM itself */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* XXX: code should enforce by=
tes [32-63] are zero */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 svsm_irq_info[64 - 4];<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* VMPL[1-3] extended IRQ desc=
riptors */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ext_irq_des=
c irqs[3];<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Remainder of th=
e page is for software use */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 reserved[PAGE_S=
IZE - 256]; } __attribute__((packed));<br>
&gt;&gt;<br>
&gt;&gt; int main(void)<br>
&gt;&gt; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hvdb h =3D { };<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(sizeof(struct ext_irq_d=
esc) =3D=3D 64);<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;sizeof(struct ext=
_irq_desc): %zu\n&quot;, sizeof(struct <br>
&gt;&gt; ext_irq_desc));<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h.inj_info.no_eoi_required =3D=
 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h.inj_info.vmpl3_irq =3D 1;<br=
>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;injection_info: 0=
x%x\n&quot;, h.injection_info);<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Melody<br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_IA1PR12MB82855443C02E2E6A948BE2BC9588AIA1PR12MB8285namp_--
