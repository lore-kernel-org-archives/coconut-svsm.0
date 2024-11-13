Return-Path: <Huibo.Wang@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::624])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E67792C0B04
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Nov 2024 21:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQu8NzcO1zvIrqEC5vqm3/ZA6RdvlUBMOZOwqa6wqQw=;
 b=w/Hp1EPwCjTDpr58e3uCGafagwDBgLdoFwQVq03Neon49Ymdh9AwSMzSHNoaZWMxdJxxq7L+vwPehxCXaUwJkM+BLJMFn55imCh7d9o3Ip1e1bXZU6wrWCK4hdFduCpM5AS2tmKn81Svu10POoQCB4rNAKI9v3PXe5xUqMdbS4o=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Wed, 13 Nov 2024 20:31:46 +0000
Message-ID: <IA1PR12MB8285AF49FE3789017C84BF89955A2@IA1PR12MB8285.namprd12.prod.outlook.com>
References: <mailman.137.1715929719.1000.svsm-devel@coconut-svsm.dev>
In-Reply-To: <mailman.137.1715929719.1000.svsm-devel@coconut-svsm.dev>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] Svsm-devel Digest, Vol 10, Issue 19
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "jlange@microsoft.com" <jlange@microsoft.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, Joerg Roedel <jroedel@suse.de>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Jon,

For SVSM APIC Protocol changes, there are 4 listed in the spec, SVSM_APIC_Q=
UERY_FEATURES, SVSM_APIC_READ_REGISTER, SVSM_APIC_WRITE_REGISTER, SVSM_APIC=
_CONFIGURE_VECTOR. In the coconut svsm github, there is one more "const SVS=
M_REQ_APIC_CONFIGURE: u32 =3D 1", should this one also be included in the s=
pec?

Thanks
Melody

-----Original Message-----
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of svsm-de=
vel-request@coconut-svsm.dev
Sent: Friday, May 17, 2024 12:09 AM
To: svsm-devel@coconut-svsm.dev
Subject: Svsm-devel Digest, Vol 10, Issue 19

Send Svsm-devel mailing list submissions to
        svsm-devel@coconut-svsm.dev

To subscribe or unsubscribe via the World Wide Web, visit
        https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
or, via email, send a message with subject or body 'help' to
        svsm-devel-request@coconut-svsm.dev

You can reach the person managing the list at
        svsm-devel-owner@coconut-svsm.dev

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of Svsm-devel digest..."


Today's Topics:

   1. RFC: Alternate Injection SVSM support (Jon Lange)


----------------------------------------------------------------------

Message: 1
Date: Fri, 17 May 2024 04:40:24 +0000
From: Jon Lange <jlange@microsoft.com>
To: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Subject: [svsm-devel] RFC: Alternate Injection SVSM support
Message-ID:
        <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod=
.outlook.com>

Content-Type: text/plain; charset=3D"us-ascii"

Attached is a specification I am proposing to handle support for Alternate =
Injection in SNP guests through the use of an SVSM.  This document proposes=
 changes to the AMD GHCB specification and to the AMD SVSM specification to=
 enable the negotiation required to make Alternate Injection work correctly=
.

Support for this protocol will not be possible in KVM until KVM is able to =
include native support for multiple VMPLs with separate interrupt sources f=
or each.  That work is underway elsewhere, and my expectation is that this =
proposed specification will align with the capabilities that KVM will be in=
troducing as part of the multi-VMPL support.

I will be submitting changes to COCONUT-SVSM to implement this protocol.  I=
 welcome all feedback to the spec, and will update the code to match whatev=
er spec changes are agreed upon.

-Jon



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://mail.8bytes.org/pipermail/svsm-devel/attachments/20240517/e74a=
eb2f/attachment.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Alternate Injection Support for SEV-SNP 20240513.pdf
Type: application/pdf
Size: 114718 bytes
Desc: Alternate Injection Support for SEV-SNP 20240513.pdf
URL: <http://mail.8bytes.org/pipermail/svsm-devel/attachments/20240517/e74a=
eb2f/attachment.pdf>

------------------------------

Subject: Digest Footer

Svsm-devel mailing list
Svsm-devel@coconut-svsm.dev
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel


------------------------------

End of Svsm-devel Digest, Vol 10, Issue 19
******************************************
