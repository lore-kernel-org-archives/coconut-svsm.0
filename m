Return-Path: <cclaudio@ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 8CD911C6485
 for <svsm-devel@coconut-svsm.dev>; Thu, 18 Apr 2024 20:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pEm8SxsZRxvPqt1JpAylAhZru+E1m1osZUAONyapR2Q=;
 b=OpR+9doWglbhf2bzhXWX16YDH5XelEA+T+lmSa+D9iPxERMqJZvCY+83UnLlXQjGtX2F
 FG2rg65U8XeiQQiYuc+g93N33+pVRszkiSTWodp4UMhS2bOnshzZru06K+s+kRVpdyqC
 xhWmsDt5aXk6nRfdd848F3hCzgIUtwVv5vzIchi2sCwE49J1i72cUfoTgmb7rRQQ7iQz
 A7VpECsy1ABGTZ9tNQPooNdd1CXJzGQKAhsxugcdXYLhbtM5zcWNuoG2SK77TUAf5Nil
 sNWwgR2nu7L0aE1KyHZapfjQHQ/kaPcBjf/WP2MakvFrPOk5aGwvjBqMbirhJUn29CTw iQ== 
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Date: Thu, 18 Apr 2024 18:30:10 +0000
Message-ID: <81c35d2e7d280d5e6069a1651611834d754286d1.camel@ibm.com>
References: <1cef0323-1881-408b-8883-db3f3445c29e@suse.de>
In-Reply-To: <1cef0323-1881-408b-8883-db3f3445c29e@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E908AA31B59391409E46CC8E0E0DF02E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [svsm-devel] [RFC] moving libstpm bindings and safe
 abstractions into a separate repository
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "clopez@suse.de" <clopez@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

T24gV2VkLCAyMDI0LTA0LTE3IGF0IDEyOjA1ICswMjAwLCBDYXJsb3MgTMOzcGV6IHdyb3RlOg0K
PiBIaSBldmVyeW9uZSwNCg0KSGkgQ2FybG9zLA0KDQo+IA0KPiBJJ2QgbGlrZSB0byBzdWdnZXN0
IHRoYXQgd2UgbW92ZSBib3RoIHRoZSBgbGlic3RwbWAgYmluZGluZ3MgKGN1cnJlbnRseQ0KPiBp
biBgbGlic3RwbS9gKSBhbmQgc2FmZSBhYnN0cmFjdGlvbnMgKGN1cnJlbnRseSBpbg0KPiBga2Vy
bmVsL3NyYy92dHBtL21zdHBtL2ApIHRvIGEgc2VwYXJhdGUgcmVwb3NpdG9yeS4NCj4gDQo+IFRo
aXMgbmV3IHJlcG9zaXRvcnkgd291bGQgY29udGFpbiB0d28gY3JhdGVzIGBsaWJzdHBtLXN5c2Ag
KHJhdw0KPiBiaW5kaW5ncykgYW5kIGBsaWJzdHBtYCAoc2FmZSBhYnN0cmFjdGlvbnMpLiBUaGlz
IGZvbGxvd3MgdGhlIG9mZmljaWFsDQo+IHRoZSByZWNvbW1lbmRhdGlvbiBpbiB0aGUgQ2FyZ28g
Qm9vayBbMF0sIGFuZCBtaXJyb3JzIHRoZSBkZXZlbG9wbWVudCBvZg0KPiBvdGhlciBDLWJhc2Vk
IGNyYXRlcy4gQSBmZXcgZXhhbXBsZXMsIGFtb25nIG1hbnk6DQo+IA0KPiAqIGxpYmdpdDItc3lz
IGFuZCBnaXQyIFsxXQ0KPiAqIGN1cmwtc3lzIGFuZCBjdXJsIFsyXQ0KPiAqIG9wZW5zc2wtc3lz
IGFuZCBvcGVuc3NsIFszXQ0KPiAqIGxpYnNzaDItc3lzIGFuZCBzc2gyIFs0XQ0KDQpUaGUgKi1z
eXMgcmVjb21tZW5kYXRpb25zIHNlZW1zIHRvIGJlIGFwcGxpY2FibGUgZm9yIHBhY2thZ2VzIHRo
YXQgbGluayB0bw0Kc3lzdGVtIGxpYnJhcmllcywgd2hpY2ggaXMgbm90IHRoZSBjYXNlIG9mIHRo
ZSBsaWJtc3RwbS4NCg0KPiANCj4gQ3VycmVudGx5IHdlIGRvIGhhdmUgYSBzZXBhcmF0ZSBjcmF0
ZSBmb3IgdGhlIHJhdyBiaW5kaW5ncyBpbiBvdXINCj4gZXZlci1ncm93aW5nIG1vbm9yZXBvLCBi
dXQgdGhlIHNhZmUgYWJzdHJhY3Rpb25zIGFyZSBpbiB0aGUgU1ZTTSBrZXJuZWwNCj4gY3JhdGUu
DQo+IA0KPiBUaGlzIGNoYW5nZSB3b3VsZCBpbXByb3ZlIHRoZSByZXVzYWJpbGl0eSBvZiB0aGUg
c2FmZSBhYnN0cmFjdGlvbnMgZm9yDQo+IG90aGVyIHByb2plY3RzLCBhbmQgYWxzbyBtYWtlIGl0
IGVhc2llciBmb3IgdGhpcmQgcGFydGllcyB0byBmaW5kIG91cg0KPiBpbXBsZW1lbnRhdGlvbi4N
Cg0KWW91IG1heSB3YW50IHRvIGhhdmUgYSBsb29rIGF0IHRoZSBrZXJuZWwvc3JjL3Z0cG0vbXN0
cG0vd3JhcHBlci5ycyBhcyBpdCB3b3VsZA0KcmVxdWlyZSBzb21lIHN2c20va2VybmVsIGZ1bmN0
aW9ucyB0byBiZSB2aXNpYmxlIHRvIHRoZSBsaWJtc3RwbS1zeXMuDQoNCkFyZSB0aGVyZSB0aGly
ZCBwYXJ0aWVzIGludGVyZXN0ZWQgb24gcmV1c2luZyBvdXIgbGlibXN0cG0/DQoNClRoYW5rcywN
CkNsYXVkaW8NCg0KPiANCj4gSSdkIGxpa2UgdG8gdGFrZSBvcGluaW9ucyBmcm9tIHRoZSBTVlNN
IGNvbW11bml0eSB0byBzZWUgaWYgb3RoZXJzIHRoaW5rDQo+IGl0J3MgYSBwb3NpdGl2ZSBjaGFu
Z2Ugb3Igbm90IGJlZm9yZSBzdGFydGluZyBhbnkgd29yay4gSXQncyBwZXJoYXBzDQo+IHNvbWV0
aGluZyB0aGF0IGNvdWxkIGJlIGRpc2N1c3NlZCBpbiB0aGUgbmV4dCBTVlNNIGNhbGwgYXMgd2Vs
bC4NCj4gDQo+IFswXSANCj4gaHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9jYXJnby9yZWZlcmVu
Y2UvYnVpbGQtc2NyaXB0cy5odG1sIy1zeXMtcGFja2FnZXMNCj4gWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9ydXN0LWxhbmcvZ2l0Mi1ycw0KPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2FsZXhjcmlj
aHRvbi9jdXJsLXJ1c3QNCj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9zZmFja2xlci9ydXN0LW9w
ZW5zc2wNCj4gWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS9hbGV4Y3JpY2h0b24vc3NoMi1ycw0KPiAN
Cj4gLS0gDQo+IENhcmxvcyBMw7NwZXoNCj4gU2VjdXJpdHkgRW5naW5lZXINCj4gU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMNCg0K
