Return-Path: <Dhaval.Giani@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 85D06265D5E
 for <svsm-devel@coconut-svsm.dev>; Thu,  7 Sep 2023 18:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXUAedjSfHF40QA4Pj6tLbiPmO9xZHV/2x5iBmUyslY=;
 b=m+1pB74D0q+17wmV1s9GS1qjR3uEnfZHv8LZ1pNCS2pXFBDvL85vA4pxVe7j7U8qfjJkGMRewnKqH7z9B8QRZAwBbMnDpNbPaRbt6aIw8y5czKTID0ODzkTTvCFbvyBhqbb1hUMV2ELEfin0RTQEz2eMv3i659MaZd0sJmv5dgA=
From: "Giani, Dhaval" <Dhaval.Giani@amd.com>
Date: Thu, 7 Sep 2023 16:57:32 +0000
Message-ID: <14c73cc1-7a0c-521a-11d8-dcf22e618672@amd.com>
References: <ZPBqvbMM28sdqewQ@suse.de>
 <54F5774C-F26A-449E-83FE-6BAA6EF9CD53@suse.de>
In-Reply-To: <54F5774C-F26A-449E-83FE-6BAA6EF9CD53@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0119FB12BFC7440BD1C22B1634BAF6E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

T24gOS83LzIzIDA5OjQxLCBKw7ZyZyBSw7ZkZWwgd3JvdGU6DQo+IEhpLA0KPg0KPj4gQW0gMzEu
MDguMjAyMyB1bSAxMjoyNiBzY2hyaWViIErDtnJnIFLDtmRlbCA8anJvZWRlbEBzdXNlLmRlPjoN
Cj4+DQo+PiAgICAgICAgICAgICAgICAgICBDRVNUICAgRVQgICAgIENUICAgICBQU1QNCj4+IFdl
ZG5lc2RheSAgICAgICAgIDZwbSAgICAxMnBtICAgMTFhbSAgIDlhbQ0KPiBCYXNlZCBvbiB0aGUg
ZmVlZGJhY2sgdG8gdGhpcyB0aHJlYWQgSSBjaG9zZSB0aGUgYWJvdmUgc2xvdCBmb3IgdGhlIG1l
ZXRpbmcuIFRoZSBmaXJzdCBvbmUgaXMgc2NoZWR1bGVkIGZvciBTZXB0ZW1iZXIgMTMgYXQgNnBt
IENFU1QvOWFtIFBTVCBhbmQgcmVwZWF0cyBldmVyeSB0d28gd2Vla3MuDQo+DQo+IFRoZXJlIGlz
IGEgcHVibGljIEdvb2dsZSBjYWxlbmRhciB3aGljaCB5b3UgY2FuIGFkZCB0byBhIGNhbGVuZGFy
IGFwcCBvZiB5b3VyIGNob2ljZToNCj4NCj4gaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2Nh
bGVuZGFyL2VtYmVkP3NyYz1kNzUwMTM4YWM5MTI3Mzc1MmIzMmU1ZTlkN2IyYTk2YzgyNmI4MDBk
YTZhM2FmZDY5MGQ5ZmYxMjk4ZTA1MTgxJTQwZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbSZjdHo9
RXVyb3BlJTJGQmVybGluDQo+DQo+IFRoZSBtZWV0aW5nIHdpbGwgaGFwcGVuIHZpYSBHb29nbGUg
bWVldCBoZXJlOg0KPg0KPiBodHRwczovL21lZXQuZ29vZ2xlLmNvbS9qcXoteW9uaC1uZ2INCj4N
Cj4gSGF2ZSBhIG5pY2Ugd2VlayBhbmQgaG9wZSB0byBzZWUgeW91IGFsbCB0aGVyZSA6LSkNCg0K
SGkgSm9lcmcsDQoNCkRvIHlvdSBoYXZlIGFuIGFnZW5kYSBpcyBwbGFjZSBhbHJlYWR5IHNvbWV3
aGVyZT8gQW5kIGlmIHdlIHdhbnQgdG8gYWRkIA0KaXRlbXMsIGRvIHdlIGp1c3QgZW1haWwgaGVy
ZT8NCg0KVGhhbmtzIQ0KDQpEaGF2YWwNCg0K
