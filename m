Return-Path: <dionnaglaze@google.com>
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E3CBB1A1A98
 for <svsm-devel@coconut-svsm.dev>; Sat, 23 Sep 2023 06:58:06 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53317e29b00so7729a12.0
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695445086; x=1696049886; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTdwQySWQlZ7mfkwVwVwpt6BMaf2UuiO0BTMhW1puwM=;
 b=qGTHb048aS3gDH5B29xcChhKOfZ/SvCWpzze9qqa1bm7y+NYk05Sv9QCzu1jdvEdLW
 NiwikFFbIo3pxwVxI0zp/vb0VPpOoNjZwPlCSBnIVesNQqXn7Cudg+XsWy3vyDn9uBap
 ncbdr/okGRl85x8KB5HC64uaxibosbLhCQ47eXGVP+U64jOIn53XXYpaQamRhsl7eg/z
 kTh+3pkp/q1CFJy6VP190vwEAZHdav4Nz9tXuGC5hzHPxCCMMbrXSTbru3O1ufm9iWp2
 fKLCNBw8963zU520N2IOSAPb6jl8c03AvGScJG2jUd2dQEnpbBeaTR+qm/HVhIemAMHr
 WMIg==
MIME-Version: 1.0
References: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
In-Reply-To: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 22 Sep 2023 21:57:52 -0700
Message-ID: <CAAH4kHaa3v6125D1HQwt_6AbKP34N8rkH+gJQwyRa8zQM+-E8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] Questions about crypto support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Cc: svsm-devel@coconut-svsm.dev

On Fri, Sep 22, 2023 at 2:04=E2=80=AFPM Claudio Carvalho <cclaudio@linux.ib=
m.com> wrote:
>
> Hi everybody,
>
> In the last SVSM meeting we started to discuss some design questions rela=
ted to
> crypto support and I mentioned that I could open a github issue for us to
> continue the discussion. However, I have the impression that mailing list=
s have
> worked better for discussions. Let me know if this is not the case.
>
> Since the crypto support questions applies directly to the context of vTP=
M and
> attestation, I also added a block diagram below to help us visualize the =
big
> picture.
>
> Feel free to add new questions or information that you find relevant.
>
> Thanks,
> Claudio
>
>
> Questions
> ---------

Forgive me if my answers wrt CPL0 and CPL3 are full of misconceptions
about how SVSM plans to implement this support. I'm quite new here.

>
> Q1) FIPS 140 certification. Should we consider OpenSSL as a static or sha=
red
> library?
>

Is there a plan for dynamic linking support for shared libraries to be
possible in SVSM? I would think everything is going to be statically
linked, loaded as part of the boot image, and not even
position-independent.

> Q2) How should we handle build dependencies between CPL3 modules? E.g. th=
e vTPM
> (Microsoft TPM impl.) build depends on the OpenSSL library.
>

Different CPL3 modules will be have their own CR3 values, right?
Unless you develop an library envelope service to turn library calls
into RPCs across process boundaries, I would guess everything needs to
just be duplicated with static linking.

> Q3) What libc implementation should we use to build OpenSSL and other CPL=
3
> modules?
>
> Q4) Interface 1. How CPL0 code should communicate with CPL3 code?
>
> Q5) Interface 2. CPL0 to CPL3 communication may need to carry secrets (e.=
g.
> VMPCK0 key), how should we do that securely?
>

I think that whichever CPL3 module(s) that will handle VMPCK0 will
need to be hardcoded such that only specific vetted code is allowed to
have that data copied into its context. That code is trusted to manage
that key material correctly and destroy it after use. I wouldn't want
that access to be arbitrarily available.

> Q6) Interface 3. How a CPL3 module should communicate with other CPL3 mod=
ules?
> It may also need to carry secrets such as keys.
>

I don't expect a full VFS system to make shared memory a thing to
implement IPC. I would imagine that you would send messages to
different modules by handing a buffer and a module identifier to CPL0
to go deliver to that module's mailbox and return success, mailbox
full & try again later, or message too large.

>
> Appendix 1: vTPM and attestation as a use case
> ----------------------------------------------
>
>            .-------------.     .-------------.
>            |   Runtime   |     | Attestation |
>   -------->|  Protocols  |---->|   Report    |
>            '-------------'     '-------------'
>                   |                   |
>                   |                   v
>                   |            .------------.
>                   |            | Crypto API |-----.
>                   |            '------------'     v
>                   |                           .------.
>               Interface 1                     | ossl |
>                   |                           '------'
>                   |                               |
>           CPL0    |                          Interface 2
>       |-------------------------------------------|-------|
>           CPL3    |                               |
>                   |                               |
>                   v                               v
>            .------------.                    .---------.
>            |    vTPM    |                    | OpenSSL |
>            |   Module   |----Interface 3---->| Module  |
>            '------------'                    '---------'
>
>
> A1-1) CPL0: Runtime Protocols
> -----------------------------
>
> SVSM protocols described in the SVSM spec:
> - Core
> - Attestation
> - vTPM
>
> A1-2) CPL0: Attestation Report
> ------------------------------
>
> Implements the attestation report feature. When a VMPL0 attestation repor=
t is
> requested, the request needs to be encrypted/decrypted with the VMPCK0 ke=
y
> using AES-GCM.
>
> A1-3) CPL0: Crypto API
> ----------------------
>
> SVSM kernel interface (Rust trait) that abstracts the crypto module runni=
ng in
> CPL3.
>
> Example in pseudo-code:
>
> aes_gcm_encrypt(key, iv, aad, cleartext, ciphertext, authtag)
> aes_gcm_decrypt(key, iv, aad, ciphertext, authtag, cleartext)
>
> A1-4) CPL0: ossl
> ----------------
>
> Crypto API implementation (wrappers) for OpenSSL.
>
> A1-5) CPL3: vTPM Module
> -----------------------
>
> Microsoft TPM 2.0 reference (ms-tpm-20-ref) implementation; only the TPM
> Simulator interface is exported.
>
> The ms-tpm-20-ref build requires OpenSSL (or WolfSSL).
>
> A1-6) CPL3: OpenSSL Module
> --------------------------
>

Big organizations will have their pet crypto libraries they'll prefer.
We'll need dedicated maintainers from each one if we're going to
strive for compatibility, or we run the risk of forks and separately
vendored binaries.

I'm very interested what people are thinking in terms of binary
distributions and co-endorsement of verified builds, since signatures
are so much easier to work with operationally than always verifying an
attestation's measurement back through a transparent build process.

WRT source -> measurement transparency, Google has been working on
slsa.dev for build security, provenance tracking and verifiable build
artifacts, and Project Oak has a transparent release project to tie
sources + toolchain container through to the slsa artifact that gets
signed and added to the sigstore.dev repository of build artifacts.
A fork is a big deal due to the downstream effects that has on
auditors of this code as it flows through a transparency toolchain.
We'll need a approach transparently built binaries of the favored
varieties (crypto library x,y,z crossed with TPM simulator x,yz) as
"public good" work, further with the community's agreement about which
toolchain containers are trustworthy. Google Cloud build doesn't quite
hit the SLSA L3 target we'd like with their container marketplace, so
I'm still running that one down.

> OpenSSL library built to run in the restricted SVSM environment. Summary =
of the
> build steps we have used (inspired on how OVMF builds OpenSSL):
>
> - create a svsm_openssl.config that sets some compiler flags and inherite=
d
>   configs.
> - disable crypto modules not needed

>From my understanding of FIPS 140-2 certification, the process
involves a 100% audit of all of the machine code, and for
organizations like Google, it's best to not mess with the linked
object. We're locked into a 2MiB blob for all crypto operations done
in any regulated workload. This bloat-shedding is typically not worth
the annual O($300,000) cost of recertification.

> - reduce memory footprint
> - link it against the libcrt library, which is a small libc we crafted to=
 build
>   OpenSSL (libcrt) and the Microsoft TPM.

I'm not particularly familiar with libcrt. Do you have a link to the
project? How healthy is it?
There's also the nanolibc project Google has for similar situations
(which I'm not suggesting we use. It has exactly 1 commit by Bill
Cox=E2=80=93solid guy working in sealed computing, but busy).
I'm not saying this for tribal reasons, more that I'm not sure who's
responsible for maintenance of all these dependencies, their
reputation or level of qualification, and that makes the enterprise
tech leaders I need to discuss risks to... itchy.

> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel



--
-Dionna Glaze, PhD (she/her)
