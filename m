Return-Path: <roy.hopkins@suse.com>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 1370A2818D8
 for <svsm-devel@coconut-svsm.dev>; Wed,  3 Apr 2024 15:13:55 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d6fd3cfaa6so88376901fa.2
 for <svsm-devel@coconut-svsm.dev>; Wed, 03 Apr 2024 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1712150035; x=1712754835; darn=coconut-svsm.dev;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x3XCl/p2KPzimUKCL/CvKKo8zchiJrWW/kXFxgQoYxM=;
 b=Q2EMyMkW/f9tEhiEBPbBUkK1BwTmwh/DOWiCkyAQNbcCv7k5Pj+nEUIRaCmC3pB+IM
 jFSWEqXIjAbtDqap5d8mQXUfxw0uZvKM2iAOR7e14/YAtXZgpIysFHkAccRNQNEyomXW
 xTCSrnGRbLBldUVavJ1G+1pH3K+/LvQqcSLlxEzcB+i4vOAjo3ehCGYtTDj+EHiI9xZD
 Yn9vZ5oqb0PRI7wn4YfrtFa9vqHy+MHTYAstlrssWhq6YRwwwcAa4b2Tz0Mc8JD9XfF4
 AhJmOpRUBccd5c7VC9rU2tOAd9dr/jTTPEkehMGGL2jp7/lhfUOOzjiASYuco31phBv6
 Aw4g==
Message-ID: <09b8f5808aa97bae901929a776e473e12a31389f.camel@suse.com>
From: Roy Hopkins <roy.hopkins@suse.com>
Date: Wed, 03 Apr 2024 14:13:54 +0100
In-Reply-To: <e43228aada00c5560c97387318f5b52b18d576a5.camel@ibm.com>
References: <9a2a2fec29450701145a97b52ce70844eaac793d.camel@ibm.com>
 <ZcZKBdaSWI4cNDBP@8bytes.org>
 <2e6bf651-c720-405f-a598-2f2a2b911049@amd.com>
 <8e5d6e1b-96e6-4248-819b-2ef613a57913@amd.com>
 <e43228aada00c5560c97387318f5b52b18d576a5.camel@ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] Launch coconut-svsm using IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "joro@8bytes.org" <joro@8bytes.org>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

On Thu, 2024-03-28 at 18:06 +0000, Claudio Siqueira de Carvalho wrote:
> On Thu, 2024-03-28 at 11:54 -0500, Tom Lendacky wrote:
> > On 3/27/24 16:49, Tom Lendacky wrote:
> > > On 2/9/24 09:51, J=C3=B6rg R=C3=B6del wrote:
> > > > Hi Claudio,
> > > >=20
> > > > On Fri, Feb 09, 2024 at 02:46:03PM +0000, Claudio Siqueira de Carva=
lho=20
> > > > wrote:
> > > > > I was doing some research on IGVM, but I did not find any example=
.
> > > > > Does=20
> > > > > anybody
> > > > > have an example of an IGVM file and a QEMU command line that I co=
uld=20
> > > > > use to
> > > > > launch the coconut-svsm?
> > > > >=20
> > > > > This might be helpful for other people too.
> > > >=20
> > > > The COCONUT build process will generate two IGVM files, one for use=
 with
> > > > QEMU and one for use with Hyper-V.
> > > >=20
> > > > To use it with QEMU, you need an IGVM-enabled QEMU, instructions on=
 how
> > > > to get one can be found in here:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > > https://github.com/roy-hopkins/svsm/blob/igvm_install_doc/Documenta=
tion/IN
> > > > STALL.md
> > > >=20
> > > > This is a file from Roy's pending PR on updating the documentation =
for
> > > > the IGVM switch.
> > >=20
> > > I just tried building everything fresh on a new system based on the=
=20
> > > installation instructions and can't get the firmware to launch. Doing=
 some
> > > debugging, the firmware loading appears to be off by a page (0x1000).=
 In=20
> > > other words, the code that should be at the CS:RIP 0xfffffff0 is actu=
ally=20
> > > located at 0xffffeff0, with all 0's at 0xfffffff0.
> > >=20
> > > I don't have a full grasp on the Qemu IGVM support to understand if i=
t is=20
> > > the IGVM file that is built wrong or the Qemu IGVM support that ends =
up=20
> > > off by a page. It appears that the firmware is handled as the last it=
em in
> > > igvm_process() and if process_mem_page() is invoked with "i - 1" inst=
ead=20
> > > of "i", then the firmware begins booting.
> >=20
> > Just to supply a bit more info, the failing launch ends with the follow=
ing:
> >=20
> > ...
> > [SVSM] Launching Firmware
> > [SVSM] Launching request-processing task on CPU 0
> > qemu-system-x86_64: warning: memory fault: GPA 0x0 size 0x1000 flags 0x=
8
> > qemu-system-x86_64: cpus are not resettable, terminating
> >=20
> >=20
> > The following patch to Qemu works around the issue, but I'm unsure if t=
his=20
> > is a proper fix. The error can either be in Qemu or the IGVM creation
> > process.
>=20
> I am also having the same problem. If I bisected it right, the problem se=
ems
> to
> be in the igvmbuilder.
>=20
> https://github.com/coconut-svsm/svsm/issues/311

Sorry for the delay in replying - I missed this over the Easter holidays. I=
've
responded on the github issue above but replying here for completeness.

The problem was actually caused by a bug in the IGVM handling in QEMU which=
 did
not manifest itself until the SVSM commit Claudio highlighted. I had alread=
y
found and fixed it but it was only available in the opensuse/tumbleweed bra=
nch.
I've now opened a PR that fixes this amongst other changes which has now be=
en
merged into the coconut `svsm-igvm` branch:
https://github.com/coconut-svsm/qemu/tree/svsm-igvm

Regards,
Roy

>=20
> Thanks,
> Claudio
>=20
> >=20
> > diff --git a/backends/igvm.c b/backends/igvm.c
> > index df663b300b..1923d31ad6 100644
> > --- a/backends/igvm.c
> > +++ b/backends/igvm.c
> > @@ -675,7 +675,7 @@ void igvm_process(ConfidentialGuestSupport *cgs)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to reduce the number of memory r=
egions we create. Make sure the=20
> > last group is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * processed with this call.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -=C2=A0=C2=A0=C2=A0 process_mem_page(cgs, i, NULL);
> > +=C2=A0=C2=A0=C2=A0 process_mem_page(cgs, i - 1, NULL);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QTAILQ_FOREACH(parameter, &parameter_dat=
a, next)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> >=20
> > Thanks,
> > Tom
> >=20
> > >=20
> > > Thanks,
> > > Tom
> > >=20
> > > >=20
> > > > Hope that helps.
> > > >=20
> > > > Regards,
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0Joerg

