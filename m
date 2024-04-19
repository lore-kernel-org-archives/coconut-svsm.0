Return-Path: <cclaudio@ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C2A561C7C41
 for <svsm-devel@coconut-svsm.dev>; Fri, 19 Apr 2024 15:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FNqPBbbFPXZJWqhY/0G0WCr41vywZB5szCqXTwmvqN0=;
 b=ZK+pV5wmxup6eJTrjaK+g8w3x/K5g7uBvC9xsqg65v06iiGdi0lDaa8MEnP2W+F1w98t
 deLNWHcvwkQcdwio/5h+vttglneYDpvFNxODbWmN11YSEwpVkro+guXPXZJsH6Txp1Mf
 Z7KP3eLIscJZAlNq+dLSpzhdcJs5y37VFYMrXSzdl5kvxIqVsPxn1wtrWdrlonM2j3VD
 QgZH8PnwThbYQNrvWtAZv5sWw/Qn3rGhEKbqKGn8097YsqeteELKoWE4i3Tdq60vHeDx
 voH+KlIQyBCUeRztqGuVHzSJGepcFvYTX0Ys+PekUMwXnjnJeccwjOOnaC4VPDQ4u7lE jA== 
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Date: Fri, 19 Apr 2024 13:51:25 +0000
Message-ID: <aa89a700469f6acc4d4a5a0de05dc8a0828778e1.camel@ibm.com>
References: <1cef0323-1881-408b-8883-db3f3445c29e@suse.de>
 <81c35d2e7d280d5e6069a1651611834d754286d1.camel@ibm.com>
 <59a4efd5-b3ae-4b75-b634-d788f613dc12@suse.de>
 <efaff480-7221-463f-b67f-d9e721f7632a@suse.de>
In-Reply-To: <efaff480-7221-463f-b67f-d9e721f7632a@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5C7629E101BBD4181B6797CEAA17D3B@namprd15.prod.outlook.com>
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

T24gRnJpLCAyMDI0LTA0LTE5IGF0IDA5OjUwICswMjAwLCBDYXJsb3MgTMOzcGV6IHdyb3RlOg0K
PiANCj4gT24gMTkvNC8yNCA5OjM4LCBDYXJsb3MgTMOzcGV6IHdyb3RlOg0KPiA+ID4gPiBDdXJy
ZW50bHkgd2UgZG8gaGF2ZSBhIHNlcGFyYXRlIGNyYXRlIGZvciB0aGUgcmF3IGJpbmRpbmdzIGlu
IG91cg0KPiA+ID4gPiBldmVyLWdyb3dpbmcgbW9ub3JlcG8sIGJ1dCB0aGUgc2FmZSBhYnN0cmFj
dGlvbnMgYXJlIGluIHRoZSBTVlNNIGtlcm5lbA0KPiA+ID4gPiBjcmF0ZS4NCj4gPiA+ID4gDQo+
ID4gPiA+IFRoaXMgY2hhbmdlIHdvdWxkIGltcHJvdmUgdGhlIHJldXNhYmlsaXR5IG9mIHRoZSBz
YWZlIGFic3RyYWN0aW9ucyBmb3INCj4gPiA+ID4gb3RoZXIgcHJvamVjdHMsIGFuZCBhbHNvIG1h
a2UgaXQgZWFzaWVyIGZvciB0aGlyZCBwYXJ0aWVzIHRvIGZpbmQgb3VyDQo+ID4gPiA+IGltcGxl
bWVudGF0aW9uLg0KPiA+ID4gDQo+ID4gPiBZb3UgbWF5IHdhbnQgdG8gaGF2ZSBhIGxvb2sgYXQg
dGhlIGtlcm5lbC9zcmMvdnRwbS9tc3RwbS93cmFwcGVyLnJzIGFzIA0KPiA+ID4gaXQgd291bGQN
Cj4gPiA+IHJlcXVpcmUgc29tZSBzdnNtL2tlcm5lbCBmdW5jdGlvbnMgdG8gYmUgdmlzaWJsZSB0
byB0aGUgbGlibXN0cG0tc3lzLg0KPiA+IA0KPiA+IFRvIGJlIGhvbmVzdCBJJ20gbm90IHN1cmUg
d2h5IHRob3NlIHdyYXBwZXJzIGFyZSBpbXBsZW1lbnRlZCBpbiB0ZXJtcyBvZg0KPiA+IG9mIHRo
ZXNlIG1lbV9hbGxvY2F0ZSgpLCBtZW1fcmVhbGxvY2F0ZSgpLCBldGMuIGZ1bmN0aW9ucy4gQXMg
ZmFyIGFzIEkNCj4gPiBjYW4gdGVsbCB3ZSBjYW4gc2ltcGx5IHVzZSB0aGUgZnVuY3Rpb25zIGlu
IHRoZSBhbGxvYyBjcmF0ZSB0aGF0IGNhbGwNCj4gPiBpbnRvIHRoZSBnbG9iYWwgYWxsb2NhdG9y
IChhbGxvYzo6YWxsb2M6OmFsbG9jKCksIHJlYWxsb2MoKSwgZXRjLikuIFRoZQ0KPiA+IGRvd25z
dHJlYW0gdXNlciB3b3VsZCBqdXN0IG5lZWQgdG8gaGF2ZSBhIGdsb2JhbCBhbGxvY2F0b3IuDQo+
IEp1c3QgcmVhbGl6ZWQgdGhlIHVzZSBvZiB0aGUgbGF5b3V0IGZ1bmN0aW9ucy4NCg0KDQo+ICBJ
IGd1ZXNzIHdlIGNvdWxkIGRlY2xhcmUNCj4gdGhlIG5lZWRlZCBmdW5jdGlvbnMgKG1hbGxvYywg
ZnJlZSwgZXRjLikgYXMgZXh0ZXJuIGFuZCBoYXZlIGRvd25zdHJlYW0NCj4gdXNlcnMgaW1wbGVt
ZW50IHRoZW0/IE5vdCBzdXJlIGlmIHRoYXQgd291bGQgd29yay4NCj4gDQoNCkkgdGhpbmsgdGhh
dCBzaG91bGQgd29yay4gV2UgY291bGQga2VlcCB0aGUgd3JhcHBlci5ycyBpbiB0aGUgU1ZTTSBr
ZXJuZWwgb3INCmNyZWF0ZSBhIG5ldyB3b3Jrc3BhY2UgbWVtYmVyL3JlcG9zaXRvcnkgZm9yIGl0
LiBNYXliZSB0aGUgbGF0dGVyIGlzIGJldHRlciwgSQ0KcmVtZW1iZXIgdGhhdCB0aGUgc29sdXRp
b24gSSBmb3VuZCB0byBwcmV2ZW50IGl0IGZyb20gYmVpbmcgY29tcGlsZWQgaW4gZm9yIHRlc3QN
CmFuZCBkb2MtdGVzdCBtYXkgbm90IGJlIGlkZWFsLg0KDQpCZXN0LA0KQ2xhdWRpbw0KDQo+IC0t
IA0KPiBDYXJsb3MgTMOzcGV6DQo+IFNlY3VyaXR5IEVuZ2luZWVyDQo+IFNVU0UgU29mdHdhcmUg
U29sdXRpb25zDQoNCg==
