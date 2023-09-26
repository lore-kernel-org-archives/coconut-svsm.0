Return-Path: <cclaudio@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E8C5F1A22D7
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 05:38:59 +0200 (CEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38Q2dAj0026823
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 03:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=coomeCxPJJzCJKt1YUYry3/56l0g/xNKWSxUckzMLA4=;
 b=adcjHDwRriOQx53HljpR8YO993q7ycRlwBVCo9AkpOrx706m02dyoY1S3c+zV3yRQ8v6
 vZpSHZd//aQVOXDaJezubCJNNNiwZ9fH34ckWLvJht5E4cLV5nBaKJ5vthTKAVr50RpW
 eNOIx8DfAiyZKrEDxlfuo2GXiJt0Dp0gIW9ZuSoGWzrxTZrwOyjRBF95rRcyeV/Auz8B
 4KBdZdK9TRRj7TO4ya0ioUo8TC0iXzYYRRzCnuLgGYfWoH6hKGoE/fupDF6ThWWL+Do0
 TdvoPgkbICAFnha6PwEvKxW4YSvyRe8eCICOxYFyIZVksbijoWeJ28L6jNEhTsZdrR4V rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tbkdevjft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 03:38:57 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38Q3MM24031767
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 03:38:56 GMT
Message-ID: <56cd11971a4bc07e88f91a53f1918615362bdaec.camel@linux.ibm.com>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Mon, 25 Sep 2023 23:38:54 -0400
In-Reply-To: <CAAH4kHaa3v6125D1HQwt_6AbKP34N8rkH+gJQwyRa8zQM+-E8w@mail.gmail.com>
References: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
 <CAAH4kHaa3v6125D1HQwt_6AbKP34N8rkH+gJQwyRa8zQM+-E8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] Questions about crypto support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: svsm-devel@coconut-svsm.dev

On Fri, 2023-09-22 at 21:57 -0700, Dionna Amalie Glaze wrote:
> On Fri, Sep 22, 2023 at 2:04=E2=80=AFPM Claudio Carvalho <cclaudio@linux.=
ibm.com>
> wrote:
> >=20
> > Hi everybody,
> >=20
> > In the last SVSM meeting we started to discuss some design questions re=
lated
> > to
> > crypto support and I mentioned that I could open a github issue for us =
to
> > continue the discussion. However, I have the impression that mailing li=
sts
> > have
> > worked better for discussions. Let me know if this is not the case.
> >=20
> > Since the crypto support questions applies directly to the context of v=
TPM
> > and
> > attestation, I also added a block diagram below to help us visualize th=
e big
> > picture.
> >=20
> > Feel free to add new questions or information that you find relevant.
> >=20
> > Thanks,
> > Claudio
> >=20
> >=20
> > Questions
> > ---------
>=20
> Forgive me if my answers wrt CPL0 and CPL3 are full of misconceptions
> about how SVSM plans to implement this support. I'm quite new here.
>=20
> >=20
> > Q1) FIPS 140 certification. Should we consider OpenSSL as a static or s=
hared
> > library?
> >=20
>=20
> Is there a plan for dynamic linking support for shared libraries to be
> possible in SVSM? I would think everything is going to be statically
> linked, loaded as part of the boot image, and not even
> position-independent.

We have used FIPS 140 certification as one criterion to choose between cryp=
to
libraries and approaches. However, multiple questions popped up on how diff=
icult
would be to certify OpenSSL. So I added this question.=20

The aspect we started to discuss is if the OpenSSL should be built as a sta=
tic
or shared library. If we are concerned about FIPS 140, the recommendation i=
s to
use an OpenSSL version that has been FIPS validated, such as [1].

[1] says that the OpenSSL FIPS provider is a shared library (fips.so). IIUC=
, it
would be complicated to support a Linux shared library in the SVSM. On the =
other
hand, certifying any static crypto library would also be complicated.

Other aspects about FIPS 140:
- The same problem also exists for OVMF since it also builds its own crypto
library (OpenSSL).
- Even if we use a FIPS validated crypto, we still need to make sure that t=
he
consumers will support it. IIUC, the Microsoft TPM implementation does not
support a FIPS validated OpenSSL.

My impression is that FIPS 140 is a complicated problem when it comes to
firmware and it seems too big to be considered now. I would like to hear wh=
at
you guys think about that and if CPL0 should have it's own crypto (e.g.
RustCrypto) in order to simplify the design. At the moment, the only crypto
requirement we have for CPL0 code is AES_GCM, which is required by the
attestation report feature.

[1] - Latest FIPS validated OpenSSL -
https://github.com/openssl/openssl/blob/openssl-3.0.8/README-FIPS.md

>=20
> > Q2) How should we handle build dependencies between CPL3 modules? E.g. =
the
> > vTPM
> > (Microsoft TPM impl.) build depends on the OpenSSL library.
> >=20
>=20
> Different CPL3 modules will be have their own CR3 values, right?
> Unless you develop an library envelope service to turn library calls
> into RPCs across process boundaries, I would guess everything needs to
> just be duplicated with static linking.
>=20
> > Q3) What libc implementation should we use to build OpenSSL and other C=
PL3
> > modules?
> >=20
> > Q4) Interface 1. How CPL0 code should communicate with CPL3 code?
> >=20
> > Q5) Interface 2. CPL0 to CPL3 communication may need to carry secrets (=
e.g.
> > VMPCK0 key), how should we do that securely?
> >=20
>=20
> I think that whichever CPL3 module(s) that will handle VMPCK0 will
> need to be hardcoded such that only specific vetted code is allowed to
> have that data copied into its context. That code is trusted to manage
> that key material correctly and destroy it after use. I wouldn't want
> that access to be arbitrarily available.
>=20
> > Q6) Interface 3. How a CPL3 module should communicate with other CPL3
> > modules?
> > It may also need to carry secrets such as keys.
> >=20
>=20
> I don't expect a full VFS system to make shared memory a thing to
> implement IPC. I would imagine that you would send messages to
> different modules by handing a buffer and a module identifier to CPL0
> to go deliver to that module's mailbox and return success, mailbox
> full & try again later, or message too large.
>=20

Jorg mentioned that IPC could be an option for communication between CPL3
modules, but then James mentioned that crypto operations may not perform we=
ll
over IPC. I added this question to check if we need to revisit this.

> >=20
> > Appendix 1: vTPM and attestation as a use case
> > ----------------------------------------------
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .---------=
----.=C2=A0=C2=A0=C2=A0=C2=A0 .-------------.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 Runtime=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 | Attestation |
> > =C2=A0 -------->|=C2=A0 Protocols=C2=A0 |---->|=C2=A0=C2=A0 Report=C2=
=A0=C2=A0=C2=A0 |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '---------=
----'=C2=A0=C2=A0=C2=A0=C2=A0 '-------------'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 .------------.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Crypto API |-----.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 '------------'=C2=A0=C2=A0=C2=A0=C2=A0 v
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .------.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Interface 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ossl |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '------'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPL0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Interface 2
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |---------------------------------------=
----|-------|
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPL3=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .---------=
---.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .---------.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 vTPM=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | OpenSSL |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 Module=C2=A0=C2=A0 |----Interface 3---->| Module=C2=A0 |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '---------=
---'=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '---------'
> >=20
> >=20
> > A1-1) CPL0: Runtime Protocols
> > -----------------------------
> >=20
> > SVSM protocols described in the SVSM spec:
> > - Core
> > - Attestation
> > - vTPM
> >=20
> > A1-2) CPL0: Attestation Report
> > ------------------------------
> >=20
> > Implements the attestation report feature. When a VMPL0 attestation rep=
ort
> > is
> > requested, the request needs to be encrypted/decrypted with the VMPCK0 =
key
> > using AES-GCM.
> >=20
> > A1-3) CPL0: Crypto API
> > ----------------------
> >=20
> > SVSM kernel interface (Rust trait) that abstracts the crypto module run=
ning
> > in
> > CPL3.
> >=20
> > Example in pseudo-code:
> >=20
> > aes_gcm_encrypt(key, iv, aad, cleartext, ciphertext, authtag)
> > aes_gcm_decrypt(key, iv, aad, ciphertext, authtag, cleartext)
> >=20
> > A1-4) CPL0: ossl
> > ----------------
> >=20
> > Crypto API implementation (wrappers) for OpenSSL.
> >=20
> > A1-5) CPL3: vTPM Module
> > -----------------------
> >=20
> > Microsoft TPM 2.0 reference (ms-tpm-20-ref) implementation; only the TPM
> > Simulator interface is exported.
> >=20
> > The ms-tpm-20-ref build requires OpenSSL (or WolfSSL).
> >=20
> > A1-6) CPL3: OpenSSL Module
> > --------------------------
> >=20
>=20
> Big organizations will have their pet crypto libraries they'll prefer.
> We'll need dedicated maintainers from each one if we're going to
> strive for compatibility, or we run the risk of forks and separately
> vendored binaries.
>=20
> I'm very interested what people are thinking in terms of binary
> distributions and co-endorsement of verified builds, since signatures
> are so much easier to work with operationally than always verifying an
> attestation's measurement back through a transparent build process.
>=20
> WRT source -> measurement transparency, Google has been working on
> slsa.dev for build security, provenance tracking and verifiable build
> artifacts, and Project Oak has a transparent release project to tie
> sources + toolchain container through to the slsa artifact that gets
> signed and added to the sigstore.dev repository of build artifacts.
> A fork is a big deal due to the downstream effects that has on
> auditors of this code as it flows through a transparency toolchain.
> We'll need a approach transparently built binaries of the favored
> varieties (crypto library x,y,z crossed with TPM simulator x,yz) as
> "public good" work, further with the community's agreement about which
> toolchain containers are trustworthy. Google Cloud build doesn't quite
> hit the SLSA L3 target we'd like with their container marketplace, so
> I'm still running that one down.
>=20
> > OpenSSL library built to run in the restricted SVSM environment. Summar=
y of
> > the
> > build steps we have used (inspired on how OVMF builds OpenSSL):
> >=20
> > - create a svsm_openssl.config that sets some compiler flags and inheri=
ted
> > =C2=A0 configs.
> > - disable crypto modules not needed
>=20
> From my understanding of FIPS 140-2 certification, the process
> involves a 100% audit of all of the machine code, and for
> organizations like Google, it's best to not mess with the linked
> object. We're locked into a 2MiB blob for all crypto operations done
> in any regulated workload. This bloat-shedding is typically not worth
> the annual O($300,000) cost of recertification.
>=20
> > - reduce memory footprint
> > - link it against the libcrt library, which is a small libc we crafted =
to
> > build
> > =C2=A0 OpenSSL (libcrt) and the Microsoft TPM.
>=20
> I'm not particularly familiar with libcrt. Do you have a link to the
> project? How healthy is it?
> There's also the nanolibc project Google has for similar situations
> (which I'm not suggesting we use. It has exactly 1 commit by Bill
> Cox=E2=80=93solid guy working in sealed computing, but busy).
> I'm not saying this for tribal reasons, more that I'm not sure who's
> responsible for maintenance of all these dependencies, their
> reputation or level of qualification, and that makes the enterprise
> tech leaders I need to discuss risks to... itchy.

Libcrt is a libc implementation we created for the SVSM-vTPM proof-of-conce=
pt we
developed some time ago [2]. It is subset of musl + some OVMF stubs that we=
 put
together to easily build OpenSSL and the Microsoft TPM. However, with CPL3
support, we may want to have more complete libc implementation.

[2] Libcrt - https://github.com/svsm-vtpm/libcrt


	Claudio

>=20
> > --
> > Svsm-devel mailing list
> > Svsm-devel@coconut-svsm.dev
> > https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
>=20
>=20
>=20
> --
> -Dionna Glaze, PhD (she/her)

