Return-Path: <erbse.13@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CF57B4866A
 for <svsm-devel@coconut-svsm.dev>; Thu, 17 Apr 2025 18:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1744907036; x=1745511836; i=erbse.13@gmx.de;
 bh=cIgHuBJXHxG+79m16VUE1nwHNRFiDl9SLU/n5pfd09E=;
 h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
 Subject:To:References:From:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZmVtB/3rGi9/mRpdGFNwrl4q5HkM0fMUmORH5SZJAjE6ufZhqWE2yvdtUBL0bzaw
 6ghp8F8tWXssWZAJ8dDIwqKsYcsspubELqNkkrHsh8vKxu+p7mq1ZQJlLEkhvZtWV
 xUGvWX31jITUkeat22VBnT/sgBPIzmg2Z5ZTUUgQVttvwaXDI4e7lIanXVxyPLYBz
 ymJ/5h+roF26oe0UqF74DBVfCHAsktl2yrArjFPZGv5DUinZfx0htUmebrYo8aZow
 zD65D5VbJyFqsC/siJEvc0ZN01tCEpYBnH3EnO9SRPMJJqWxzMaJrKvKUSFKaCBw5
 kA40pMsczh0NcgQlZQ==
Received: from [192.168.13.9] ([88.152.43.130]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1unp8h0MYF-00laGz for
 <svsm-devel@coconut-svsm.dev>; Thu, 17 Apr 2025 18:23:56 +0200
Content-Type: multipart/alternative;
 boundary="------------dqRNAY2b2ZzIH8EEEoWRykbq"
Message-ID: <2c9d2894-db39-4a87-a1ab-08a12add6f0d@gmx.de>
Date: Thu, 17 Apr 2025 18:23:55 +0200
MIME-Version: 1.0
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
Content-Language: en-US
From: Tom Dohrmann <erbse.13@gmx.de>
In-Reply-To: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
Subject: Re: [svsm-devel] Potential project on implementing AMD SEV
 emulation in QEMU
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

This is a multi-part message in MIME format.
--------------dqRNAY2b2ZzIH8EEEoWRykbq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RlZmFubywNCg0KKEkgZG8gcmVhbGl6ZSBJJ20gbm90IHRoZSBUb20geW91IHdhbnRl
ZCB0byBhc2spDQoNCkEgd2hpbGUgYWdvLCB0aGVyZSB3YXMgYSBDVEYgZXZlbnQgKGh4cCAz
OEMzIENURikgd2hlcmUgb25lIG9mIHRoZSANCmNoYWxsZW5nZXMgd2FzIGFib3V0IGF0dGFj
a2luZyBzb21lIGNvZGUgcnVubmluZyBpbnNpZGUgYW4gU0VWIGd1ZXN0LiANClRoZSBjaGFs
bGVuZ2UgYXV0aG9ycyBpbXBsZW1lbnRlZCBTTUUgJiBTRVYgZm9yIFFFTVUncyBUQ0cgYmFj
a2VuZCwgc28gDQp0aGF0IHBsYXllcnMgY291bGQgcGFydGljaXBhdGUgZXZlbiBpZiB0aGV5
IGRvbid0IGhhdmUgdGhlIGhhcmR3YXJlLiANClRoZWlyIHBhdGNoZXMgYXJlIHB1YmxpYyAN
CjxodHRwczovLzIwMjQuY3RmLmxpbmsvaW50ZXJuYWwvY2hhbGxlbmdlLzZiN2ZmOWQ3LWVm
YzktNDdmYy1hMDZlLTRhYjlhZTZkOWVhYS8+LiANClRoZWlyIGltcGxlbWVudGF0aW9uIGlz
IHByb2JhYmx5IG5vdCBjb21wbGV0ZS9hY2N1cmF0ZSBhbmQgaXQncyBsaWtlbHkgDQpub3Qg
cGFydGljdWxhcmx5IGNsZWFubHkgaW1wbGVtZW50ZWQsIGJ1dCBJSVJDIGl0IHdhcyBnb29k
IGVub3VnaCB0byBydW4gDQpPVk1GIGFuZCBMaW51eC4gSXQgbWlnaHQgYmUgYSBnb29kIHN0
YXJ0aW5nIHBvaW50IGZvciBzb21lb25lIHRvIGxvb2sgYXQgDQp0byBmaWd1cmUgb3V0IHdo
YXQgbmVlZHMgdG8gYmUgZG9uZS4NCg0KUmVnYXJkcywNClRvbQ0KDQpPbiA0LzE3LzI1IDE3
OjI2LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6DQo+IEhpIFRvbSwNCj4geWVzdGVyZGF5
IGluIHRoZSBDb2NvbnV0LVNWU00gY29tbXVuaXR5IGNhbGwgd2UgdGFsa2VkIGFib3V0IGEN
Cj4gcG90ZW50aWFsIHByb2plY3Qgd2l0aCB0aGUgVW5pdmVyc2l0eSBvZiBQaXNhIHRvIGVt
dWxhdGUgQU1EDQo+IFNFVi9TRVYtRVMvU0VWLVNOUCBzdXBwb3J0IGluIFFFTVUuDQo+DQo+
IEpvZXJnIHJpZ2h0bHkgc3VnZ2VzdGVkIGhhdmluZyBhIHN0ZXAtYnktc3RlcCBhcHByb2Fj
aCwgc3VwcG9ydGluZyBTRVYNCj4gaW5pdGlhbGx5LCBhcyBzdXBwb3J0aW5nIFNFVi1TTlAg
ZGlyZWN0bHkgbWlnaHQgYmUgdG9vIG11Y2ggZm9yIGENCj4gbWFzdGVyJ3MgdGhlc2lzIChh
Ym91dCA2IG1vbnRocyBvZiB3b3JrKS4NCj4NCj4gV2Ugd29uZGVyZWQgaWYgeW91IGtuZXcg
b2YgYW55IGF0dGVtcHRzIGFscmVhZHkgbWFkZSBpbiB0aGlzIHJlZ2FyZCwNCj4gYnV0IGVz
cGVjaWFsbHkgaWYgeW91IHRoaW5rIGl0J3MgYSBmZWFzaWJsZSB0aGluZy4NCj4NCj4gU3Vn
Z2VzdGlvbnMsIGlkZWFzIG9yIHBhcnRpYWwgd29ya3MgdGhhdCBjYW4gYmUgcmV1c2VkIGFy
ZSB2ZXJ5IHdlbGNvbWUhDQo+DQo+IFRoYW5rcywNCj4gU3RlZmFubw0KPg0K
--------------dqRNAY2b2ZzIH8EEEoWRykbq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Stefano,</p>
    <p>(I do realize I'm not the Tom you wanted to ask)</p>
    <p>A while ago, there was a CTF event (hxp 38C3 CTF) where one of
      the challenges was about attacking some code running inside an SEV
      guest. The challenge authors implemented SME &amp; SEV for QEMU's
      TCG backend, so that players could participate even if they don't
      have the hardware. Their patches are <a
href=3D"https://2024.ctf.link/internal/challenge/6b7ff9d7-efc9-47fc-a06e-=
4ab9ae6d9eaa/">public</a>.
      Their implementation is probably not complete/accurate and it's
      likely not particularly cleanly implemented, but IIRC it was good
      enough to run OVMF and Linux. It might be a good starting point
      for someone to look at to figure out what needs to be done.</p>
    <p>Regards,<br>
      Tom</p>
    <div class=3D"moz-cite-prefix">On 4/17/25 17:26, Stefano Garzarella
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=3DGVQBp1BOztw@mail.gm=
ail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Hi Tom,
yesterday in the Coconut-SVSM community call we talked about a
potential project with the University of Pisa to emulate AMD
SEV/SEV-ES/SEV-SNP support in QEMU.

Joerg rightly suggested having a step-by-step approach, supporting SEV
initially, as supporting SEV-SNP directly might be too much for a
master's thesis (about 6 months of work).

We wondered if you knew of any attempts already made in this regard,
but especially if you think it's a feasible thing.

Suggestions, ideas or partial works that can be reused are very welcome!

Thanks,
Stefano

</pre>
    </blockquote>
  </body>
</html>

--------------dqRNAY2b2ZzIH8EEEoWRykbq--
