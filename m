Return-Path: <cclaudio@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3DD121A20E5
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 23:04:52 +0200 (CEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38ML2Oc6004639
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=S9ARLHZso0W4GS9ZOI1NrmRC2HncNMTStdzChzK5Mxs=;
 b=jx0B45KKeWHDCgtky+/sK+Q/eJtYhyG5S8iik1Ojrf4gzhz+h3zaB9VjXN7LZpV3fRkb
 Q9VCT6S348tL1BtjxfMmxObeA+MbEET1luB+u/PgPuqdQ2wcxC8kz/P8ANO+flFQnhSP
 RcwmAQe+r6DlY+YxsoJfsQ+FKkM4blUrWPyjbyMv0x8+iFfZgreiuHGkZFq0TxAsa7TO
 bzo4hmgOCt0UysmNBMCSxRrQZ3lVSPOpAm1sAitH0IFFN56ZmLnMHFndXevRcoO1Y9ca
 Ha+2NsLvU2yFNMr3HiBzaYBi0IZ3qi1H+4WqgWNSiZ+MZY0442hQHnVfWjV/hiZ9T60H HQ== 
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t9jg507gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:49 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MK0pKR017442
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:46 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t8tsmra7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:46 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38ML4kFf786972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:46 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A8EA5803F
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:46 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5EFC58056
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:45 +0000 (GMT)
Received: from li-a300cfcc-3261-11b2-a85c-fa2d52d0d140.ibm.com (unknown
 [9.61.53.150]) by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP
 for <svsm-devel@coconut-svsm.dev>; Fri, 22 Sep 2023 21:04:45 +0000 (GMT)
Message-ID: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Fri, 22 Sep 2023 17:04:45 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: [svsm-devel] Questions about crypto support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi everybody,

In the last SVSM meeting we started to discuss some design questions relate=
d to
crypto support and I mentioned that I could open a github issue for us to
continue the discussion. However, I have the impression that mailing lists =
have
worked better for discussions. Let me know if this is not the case.

Since the crypto support questions applies directly to the context of vTPM =
and
attestation, I also added a block diagram below to help us visualize the bi=
g
picture.

Feel free to add new questions or information that you find relevant.

Thanks,
Claudio


Questions
---------

Q1) FIPS 140 certification. Should we consider OpenSSL as a static or share=
d
library?=20

Q2) How should we handle build dependencies between CPL3 modules? E.g. the =
vTPM
(Microsoft TPM impl.) build depends on the OpenSSL library.

Q3) What libc implementation should we use to build OpenSSL and other CPL3
modules?

Q4) Interface 1. How CPL0 code should communicate with CPL3 code?

Q5) Interface 2. CPL0 to CPL3 communication may need to carry secrets (e.g.
VMPCK0 key), how should we do that securely?

Q6) Interface 3. How a CPL3 module should communicate with other CPL3 modul=
es?
It may also need to carry secrets such as keys.


Appendix 1: vTPM and attestation as a use case
----------------------------------------------

           .-------------.     .-------------.
           |   Runtime   |     | Attestation |
  -------->|  Protocols  |---->|   Report    |
           '-------------'     '-------------'
                  |                   |
                  |                   v
                  |            .------------.
                  |            | Crypto API |-----.
                  |            '------------'     v
                  |                           .------.
              Interface 1                     | ossl |
                  |                           '------'
                  |                               |=20
          CPL0    |                          Interface 2
      |-------------------------------------------|-------|
          CPL3    |                               |
                  |                               |
                  v                               v
           .------------.                    .---------.
           |    vTPM    |                    | OpenSSL |
           |   Module   |----Interface 3---->| Module  |
           '------------'                    '---------'


A1-1) CPL0: Runtime Protocols
-----------------------------

SVSM protocols described in the SVSM spec:
- Core
- Attestation
- vTPM

A1-2) CPL0: Attestation Report
------------------------------

Implements the attestation report feature. When a VMPL0 attestation report =
is
requested, the request needs to be encrypted/decrypted with the VMPCK0 key
using AES-GCM.

A1-3) CPL0: Crypto API
----------------------

SVSM kernel interface (Rust trait) that abstracts the crypto module running=
 in
CPL3.

Example in pseudo-code:

aes_gcm_encrypt(key, iv, aad, cleartext, ciphertext, authtag)
aes_gcm_decrypt(key, iv, aad, ciphertext, authtag, cleartext)

A1-4) CPL0: ossl
----------------

Crypto API implementation (wrappers) for OpenSSL.

A1-5) CPL3: vTPM Module
-----------------------

Microsoft TPM 2.0 reference (ms-tpm-20-ref) implementation; only the TPM
Simulator interface is exported.

The ms-tpm-20-ref build requires OpenSSL (or WolfSSL).

A1-6) CPL3: OpenSSL Module
--------------------------

OpenSSL library built to run in the restricted SVSM environment. Summary of=
 the
build steps we have used (inspired on how OVMF builds OpenSSL):

- create a svsm_openssl.config that sets some compiler flags and inherited
  configs.
- disable crypto modules not needed
- reduce memory footprint
- link it against the libcrt library, which is a small libc we crafted to b=
uild
  OpenSSL (libcrt) and the Microsoft TPM.
