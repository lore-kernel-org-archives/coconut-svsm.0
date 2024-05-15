Return-Path: <elena.reshetova@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 70B071C2BD0
 for <svsm-devel@coconut-svsm.dev>; Wed, 15 May 2024 14:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715774695; x=1747310695;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WftkYAOxIjzUD6VRfTXI/wJzBd26B0sDK7LTGJZ7crg=;
 b=IqgN9FKQepYmNAqsyACDlrsezdeKP0bXviAS36INOwMscS+337YpYh+h
 j68xztCSxjF00tJWv5e8JvEI1mwPFeUIZP8GEvQZbNQl3pP8wTpeMMEDW
 CxvylJZ+KVuBRVGjPWdfhmsGmMNOkY/NZ0fZqEAGtYEv5hHNcgU9VMVQO
 QwHyPoA30R3rqeZr5jfFLmTmGouLbkHHQVUoKNON5oZQpqMPOXdqzdYy/
 X89QHVchy/qG80uI+RdVZ+gmcaTdEAmClsiJWBrobKObLBaovQUPleikI
 ZA62KAl0maGXK1MFOq3PT5YDTJON7SUbwnUgpJ0gi5H4CNgsqelrcxWf3 w==;
From: "Reshetova, Elena" <elena.reshetova@intel.com>
Date: Wed, 15 May 2024 12:04:47 +0000
Message-ID: <DM8PR11MB5750AC439A7666358636DBC0E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <Zj30Nqq3OS58DwpP@8bytes.org> <ZkMpkfepqUWfq1RY@8bytes.org>
 <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <d62c34bd-62c0-4f09-8612-0c20dc62ea44@suse.de>
In-Reply-To: <d62c34bd-62c0-4f09-8612-0c20dc62ea44@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [svsm-devel] Development Plan Document
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?utf-8?B?Q2FybG9zIEzDs3Bleg==?= <clopez@suse.de>, =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

IA0KPiBIaSwNCj4gDQo+IE9uIDE1LzUvMjQgMTI6MjAsIFJlc2hldG92YSwgRWxlbmEgd3JvdGU6
DQo+ID4gNS4gU2VjdGlvbiAxMi4yOiBieSBkb3VibGUtdmFsaWRhdGlvbiB5b3UgbWVhbiB0aGUg
Y2FzZSB3aGVuIGEgcHJpdmF0ZSBwYWdlDQo+ID4gaXMgYWRkZWQgdHdpY2UgdG8gdGhlIENWTSAo
cmVhY2NlcHQgaW4gVERYIHRlcm1zKT8NCj4gDQo+IEkgYW0gbm90IGZhbWlsaWFyIHdpdGggVERY
LCBidXQgSSB0aGluayBzbywgeWVzLiBJdCBtZWFucyB0aGF0IHRoZSBzYW1lDQo+IEdQQSBpcyBh
Y2NlcHRlZCB0d2ljZSBieSB0aGUgZ3Vlc3QuIFRoaXMgb3BlbnMgYSB3aW5kb3cgZm9yIHRoZQ0K
PiBoeXBlcnZpc29yIHRvIHJlbWFwIHRoZSBHUEEgdG8gYSBkaWZmZXJlbnQgSFBBLCBhdCBsZWFz
dCBvbiBTRVYtU05QLg0KDQpTdXJlLCBqdXN0IHdhbnRlZCB0byBkb3VibGUgY2hlY2suIERvdWJs
ZSBhY2NlcHRhbmNlIG9mIHRoZSBtZW1vcnkNCmlzIGFsc28gYSBwcm9ibGVtIG9uIFREWCwgYmVj
YXVzZSBpdCBjYW4gcmVzdWx0IGluIHRoZSBwcml2YXRlIHBhZ2UgDQpzdWRkZW5seSBjb250YWlu
aW5nIHplcm9zIGluc3RlYWQgb2YgdGhlIGFjdHVhbCBkYXRhLiANCg0KQmVzdCBSZWdhcmRzLA0K
RWxlbmEuDQo=
