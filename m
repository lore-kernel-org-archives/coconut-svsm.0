Return-Path: <Dhaval.Giani@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3FDF3269B19
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 18:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Btr+n4lH6ogLAFQKvPyTSXEuxjbtwkgK8AfRkZ2wI0w=;
 b=4SZXXw7Y6hQi2SRZ8aVajipN7Jto/TnlypurhlGpkvL4S0BcZHKFlvl8DDR1TjScDrYDpog5nf3hneceCel53ozLaKt2bf+TMBB9ScdhFMQBc8BUIgloigywXZQPS8rYQQ7XTLNhvmRxLV3bimzyqdvAwSsgs2mU5EVnrZmSvLw=
From: "Giani, Dhaval" <Dhaval.Giani@amd.com>
Date: Thu, 31 Aug 2023 16:02:16 +0000
Message-ID: <8a5a1ecd-7470-1b5a-a6d9-7750ab978d10@amd.com>
References: <ZPBqvbMM28sdqewQ@suse.de>
In-Reply-To: <ZPBqvbMM28sdqewQ@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5070EE76A68EA44ABE6FB9F5C43D77B2@namprd12.prod.outlook.com>
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
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, "Bilbao, Carlos" <Carlos.Bilbao@amd.com>, "Kalra, Ashish" <Ashish.Kalra@amd.com>

DQpIaSBKb2VyZywNCg0KT24gOC8zMS8yMyAwMzoyNiwgSsO2cmcgUsO2ZGVsIHdyb3RlOg0KPiBI
aSwNCj4NCj4gSSB0YWxrZWQgdG8gYSBjb3VwbGUgb2YgcGVvcGxlIHJlY2VudGx5IGFib3V0IG91
ciBTVlNNIHByb2plY3QgYW5kIHRoZQ0KPiBpZGVhIGNhbWUgdXAgdG8gc2NoZWR1bGUgYSBzZW1p
LXJlZ3VsYXIgY2FsbCB3aGVyZSB0aGUgY29tbXVuaXR5IGNhbg0KPiBzeW5jIG9uIGRldmVsb3Bt
ZW50IGFuZCBkaXJlY3Rpb24gb2YgdGhlIHByb2plY3QuDQo+DQo+IEl0IGFsc28gZml0cyBteSB3
aXNoIHRvIGJlIG1vcmUgdHJhbnNwYXJlbnQgYWJvdXQgb3VyIGRpcmVjdGlvbiBhbmQgd29yaw0K
PiBhbmQgaGVscHMgbW92ZSBkaXNjdXNzaW9ucyBvdXQgb2YgcHJpdmF0ZSBmb3JtYXRzIHRvIGEg
bW9yZSBwdWJsaWMNCj4gY29tbXVuaXR5IGZvcnVtLg0KPg0KPiBTbyBJIHdhbnRlZCB0byBwcm9w
b3NlIGEgY291cGxlIG9mIHRpbWUgc2xvdHMgYW5kIHNlZSB3aGF0IHBlb3BsZSB0aGluay4NCj4g
VGhlIGlkZWEgaXMgdG8gaGF2ZSBhIG1lZXRpbmcgZXZlcnkgMiB3ZWVrcywgSSB3aWxsIGNvbGxl
Y3QgYW5kIHBvc3QgYW4NCj4gYWdlbmRhIGJlZm9yZWhhbmQgYW5kIHdlIGNhbiBhbHdheXMgY2Fu
Y2VsIGlmIHRoZXJlIGlzIG5vdGhpbmcgdG8gdGFsaw0KPiBhYm91dC4NCj4NCj4gU29tZSB0aW1l
IHNsb3RzIHRoYXQgd291bGQgd29yayBmb3IgbWU6DQo+DQo+ICAgICAgICAgICAgICAgICAgICBD
RVNUICAgRVQgICAgIENUICAgICBQU1QNCj4NCj4gCVR1ZXNkYXkJICA1cG0gICAgMTFhbSAgIDEw
YW0gICA4YW0NCj4gCSAgICAgICAgICA2cG0gICAgMTJwbSAgIDExYW0gICA5YW0NCj4NCj4gCVdl
ZG5lc2RheSA1cG0gICAgMTFhbSAgIDEwYW0gICA4YW0NCj4gCSAgICAgICAgICA2cG0gICAgMTJw
bSAgIDExYW0gICA5YW0NCj4NCj4gCVRodXJzZGF5ICA2cG0gICAgMTJwbSAgIDExYW0gICA5YW0N
Cj4NCj4gCUZyaWRheSAgICA0cG0gICAgMTBhbSAgICA5YW0gICA3YW0NCj4NCj4gSSBoYXZlIG9u
bHkgY29uc2lkZXJlZCBzbG90cyB0aGF0IHdvcmsgd2VsbCBmb3IgcGFydGljaXBhbnRzIGpvaW5p
bmcNCj4gZnJvbSBBbWVyaWNhIG9yIEV1cm9wZS9BZnJpY2EgYmVjYXVzZSBtb3N0IHBlb3BsZSBJ
IHRhbGtlZCB0byBsaXZlIGluDQo+IHRoZXNlIGFyZWFzLiBJZiBwZW9wbGUgbGl2aW5nIGluIEFz
aWEvQXVzdHJhbGlhIHRpbWUgem9uZXMgd2FudCB0byBqb2luDQo+IGFzIHdlbGwgcGxlYXNlIGxl
dCBtZSBrbm93LiBXZSBjYW4gdXNlIGFsdGVybmF0aW5nIHRpbWUgc2xvdHMgdG8gbWFrZQ0KPiB0
aGlzIHBvc3NpYmxlLg0KPg0KPiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuDQoN
Cg0KSSBsaWtlIHRoZSBUdWVzZGF5L1dlZG5lc2RheSA5YW0gc2xvdHMuIERvIHlvdSBtaW5kIHNl
dHRpbmcgdXAgYSBkb29kbGUgDQpwb2xsPw0KDQoNClRoYW5rcyENCg0KRGhhdmFsDQoNCg0KPg0K
PiBUaGFua3MsDQo+DQoNCg==
