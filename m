Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 438F71A1606
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 20:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694630908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9O4307aFENsskHfJx0i92UfG27kd89Py8ejy8qku/VY=;
 b=UBb07bjCnRFYVlZZmw2VunVFbFAbxmD+wQElVmSKv8gtXxBU8s5w/VAqyBGtFtShRgSc/e
 fhZEDenvpVMjEOl2SDe4kAME9B5kvOwZ1yE5hLsBuUwep/ZS6HcqAsBx/gO2fxPLib6Tl1
 lfe4mVA1vl5RCTW/ypNYs2nNKakpdUA=
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b8405aace3so1083401fa.3
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 11:48:26 -0700 (PDT)
MIME-Version: 1.0
From: Oliver Steffen <osteffen@redhat.com>
Date: Wed, 13 Sep 2023 20:48:13 +0200
Message-ID: <CA+bRGFrbQPcVKs4suEkM1c-5GxqGYrxLp48DLBT3knwgx=nABA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [svsm-devel] Notes: SVSM Call 2023-09-13
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi all,
I tried to capture the conversation during the meeting as best I
could. But it definitely has some holes, sorry. We talked about a lot of
things during this 1h.

Please feel free to comment, correct, and extend where necessary.

---

Recording of the meeting was not possible due to technical reasons.

The introduction round was skipped due to the number of participants
(>20).

Agenda:

- J=C3=B6rg: Goal of this call is to raise awareness in the community on wh=
o
  is doing what and to sync on plans and wishes for the project.

Development update from SUSE:
  - Work on CPL3 support ongoing
    J=C3=B6rg showed a diagram of the virtual memory management data
    structures.

   @J=C3=B6rg, can you describe it again here? I was not able to correctly
     capture this during the meeting. Also please attach the diagram :-)

Crypto support

  - Claudio's PR uses the RustCrypto crate, which is fine for now.
     Later, we need something different to get certification.
  - J=C3=B6rg: We could create a separate crypto module, that could be in C=
,
    and make use of well established libraries
  - Claudio: could be a good idea, but this needs more infrastructure
    for exchanging data between the modules, etc.
  - James: IPC vs library based approach, IPC might have architectural
    problems if used in a kernel (as the SVSM is)
  - J=C3=B6rg: OTOH, including crypto lib into each module requires
    certification for each module. We should look at the performance
    impact of IPC, see if it is feasible.
    We could use shared memory between tasks.
  - Nicolai: We might need an object file for FIPS certification,
    a static Rust crate might not be sufficient.
  - J=C3=B6rg: We would need a userspace library linker
  - James: Look at the a.out format.
  - Carlos: Separate libraries would also help with fuzzing.

  The discussion is to be continued on the mailing list.

Launch protocol

  J=C3=B6rg talked about the IGVM file format from Microsoft
  (https://github.com/microsoft/igvm)
  - It is a hypervisor independent description of a CVM
  - usable for both AMD SEV-SNP and Intel TDX
  - It is under MIT license
  - Comes with a Rust crate (for use on the hypervisor side)
  - This could be a replacement for the current launch protocol
  - With this we could get rid of the stage2 loader
  - Would not have to touch Qemu's fw_cfg mechanism in Coconut
  - The implementation on the Qemu side is still missing.
  - The question is, will this be adopted widely?
  - It might become a maintenance burden if nobody else is using it.
  - OVMF also needs to adopt it.

Priorities of features

 - J=C3=B6rg:
    - CPL3 has highest priority
    - it is hard to parallelize this work across people
    - but other features can be developed in parallel
 - J=C3=B6rg was asked to share diagrams or description of the intended CPL=
3
   design, so the community can discuss in parallel.
 - Would it help to implement a simplified CPL3 support as a first step?
   So that work on dependent parts (vTPM module, for example) can start
   sooner?

Governance

  - J=C3=B6rg: From face to face discussions at KVM forum:
    - A model of 3 top-level maintainers from different entities.
    - But how to choose?
  - Candidates should have a significant track record in the project
    (code contribution and/or reviews)
  - Which entities are to consider?
  - Claudio volunteered to look after the vTPM implementation, but so
    far no other candidates.
  - Currently approx. 14 contributions according to GitHub, many have
    very few commits.
  - Maybe we should wait some more time and see who is active in the
    project?

The call ended abruptly due to the time limit of 1h imposed by gmeet.


Oliver

