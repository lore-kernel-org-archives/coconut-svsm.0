Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1710427479;
 bh=NMU1o5HTSN8heZw0ktuw5A5NjoDzqs44cHYJS7DvABA=;
 h=From:Subject:Date:Cc:To:From;
 b=6D0xTnlnfAdVnhj+3oujVPK+BUvV95XRegbTGz6sv3VbVMwiq7lDWiNhbSsalyQsL
 C3DdzvPZ6Yw2tFf+9/gkgtzQSYdJ/Yu9Ru77815RuorK1zcBMGPP6JQnwyY0Kyz6Yp
 3MJidk9TtsId7EEH4mR6GRdI/0w2Lom/2J6SiPyg2Byf7sLkvY+yKgMKV8Z54P8E+L
 8zrubCgS2K+J3yFk3dRkRnNH4X9nsm7dz4jDY6P2tNEMV18ew6FEeJF/vERrELdNn8
 2YxL7Cb2u1gjHov94wuilGwjhnmoOJdSbLsRXNHn0AIFfsXLGvrdwA1EfNcKSHvQAx
 cm4Y7eJg4k0pA==
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Message-Id: <4C094744-BB2C-4102-9593-67B8C38E0C97@8bytes.org>
Date: Thu, 14 Mar 2024 15:44:25 +0100
Subject: [svsm-devel] SVSM vTPM state
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Cc: Claudio Siqueira de Carvalho <cclaudio@ibm.com>

Hi,

In the last days I looked at Claudio=E2=80=99s vTPM PR and tested it.  =
That went well and I left a few minor review comments, other than that =
the changes look good to go.

This means, if there are no further objections, I *plan* to merge the =
code into the SVSM main branch next week (not before our development =
call). This gives everyone some time for final review and testing to =
make the merge as smooth as possible. If there are any objections, =
please raise them in the PR or via email.

 As a side note, I already updated the Linux and EDK2 repositories in =
the COCONUT project to include the vTPM drivers.

Regards,

J=C3=B6rg=
