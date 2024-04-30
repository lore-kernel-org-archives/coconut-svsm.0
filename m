Return-Path: <jlange@microsoft.com>
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c102::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BD8591C9C6D
 for <svsm-devel@coconut-svsm.dev>; Tue, 30 Apr 2024 19:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=am0y1cOoK58788qfo/GGCHy83JMQPNimLYBCsppVeAg=;
 b=PIgaPwXt8H6G5UEkxgBmcswonR7AgXfvmuPWvhJIwpR2Zi0xvPZVNTGsJkTB6Ye2I8xxZnypJDeoNMcnn5t0NZj5+C5lCBoSCSiFkBZ9NiHo77GkHd2/854jxwRwghckb5OGQ71FSLgpcYc7c1GPH8r0g07ogb2Tj21E5eUsR8o=
From: Jon Lange <jlange@microsoft.com>
Date: Tue, 30 Apr 2024 17:01:14 +0000
Message-ID: <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
 <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
In-Reply-To: <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] [EXTERNAL] Re:  x86 decoder further steps
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?iso-8859-1?Q?Carlos_L=F3pez?= <clopez@suse.de>, Thomas Leroy <tleroy@suse.de>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

As COCONUT-SVSM grows into additional configurations, it will become necess=
ary for the SVSM to emulate MMIO instructions on behalf of the guest OS.  T=
his will require instruction emulation as well.  It would seem a poor choic=
e to have two different instruction emulators for handling #VC and guest in=
struction emulation.  At the same time, it would be a poor choice to incorp=
orate a fully functional instruction emulator both because it would be big =
(which has impact both on resources and attack surface) and because it woul=
d be excessively flexible (which dramatically increases the possibility of =
exploitation).  I expect the best strategy would be to continue to expand t=
he existing instruction emulator so it can handle decode of the common MMIO=
-handling instructions, such as moves (including 16-byte moves), common ALU=
 operations (especially bitwise operations like AND/OR/XOR/BTS/BTR as well =
as TEST, plus their atomic equivalents), and others that may be determined =
through experimentation.  Limiting the scope of emulator capabilities in th=
is way by expanding the existing emulator should strike an appropriate bala=
nce between functionality and safety.

-Jon

-----Original Message-----
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of Carlos =
L=F3pez
Sent: Tuesday, April 30, 2024 7:39 AM
To: Thomas Leroy <tleroy@suse.de>
Cc: svsm-devel@coconut-svsm.dev
Subject: [EXTERNAL] Re: [svsm-devel] x86 decoder further steps

[Some people who received this message don't often get email from clopez@su=
se.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdenti=
fication ]

Hi,

On 30/4/24 11:56, Thomas Leroy wrote:
> Hi everyone,
>
> As you may know, the current #VC handler uses a naive x86 instruction
> decoder
> that is used to find the appropriate NAE event handler to call.
>
> As I said, the current decoder is very naive and does only byte matching =
to
> identify cpuid, in/out{bwl}, rdmsr/wrmsr, and rdtsc{p} instructions [0].
> Since we currently don't support all NAE events in the #VC handler, we ha=
ve
> to find a clean way to decode the remaining NAEs.

Yes, it will require at least a small rework to handle instruction
prefixes (namely REP).

> If the decoder's only use is for the #VC handler, I guess we can stick
> to what
> we currently do. It shouldn't be too hard to match the remaining NAE
> instructions
> in the decoder. However, if we need a complete instruction decoder
> somewhere,
> we'll have to decide if we write our own or if we use an existing one.
> I'm not aware of the full SVSM development plan, so I don't really know t=
he
> possible other uses of the decoder.
>
> As you may also noticed, the instruction decoder is an attack surface
> since it
> deals with untrusted raw bytes. For this reason, we should make it as sma=
ll
> (and secure of course) as possible. So if we finally need a complete
> decoder,
> we'll have to choose between write our own, which will be time consuming =
and
> could introduce security bugs (especially when #VC exceptions will be rai=
sed
> from a less privileged context), or rely on a third-party one (that we
> shouldn't consider prefect security-wise).
>
> What's your opinion between these solutions?
>
> I recently discovered the iced-x86 [1] crate looks easy to incorporate
> to the
> SVSM project, and supports no_std, so I think it would be a candidate.
> Finally, if we go for a third-party one, a security audit of the chosen
> decoder would be needed, at least a fuzzing campaign (I could take care
> of it).

I haven't attempted to the decode the remaining instructions, but other
than the prefix issue I mentioned above I don't think we need much more.
On the other hand, iced-x86 has a lot of features that can be disabled,
since we only want instruction decoding, so we wouldn't be importing
that much code. The project also already has fuzzing, so I assume it's
well tested overall.

> Cheers,
> Thomas
>
> [0]
> https://github.com/coconut-svsm/svsm/blob/104ca723cdd6a272f40c31548dd6c05=
010494c84/kernel/src/cpu/insn.rs#L110
>
> [1] https://docs.rs/iced-x86/latest/iced_x86/
>

--
Carlos L=F3pez
Security Engineer
SUSE Software Solutions
--
Svsm-devel mailing list
Svsm-devel@coconut-svsm.dev
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
