Return-Path: <cclaudio@ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9AD341A1F2C
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 16:06:53 +0200 (CEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RDtfqh027054
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 14:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=l5/bEKvuytFfy4KpQf3gQQcqn92s6VDMAXNYb3oEhuA=;
 b=Y0b6VfrWm5U8dbAccMi/ULkAlCq0NF+W2Nyk3nsNA4ppO4Nb4roRPvHcFlR0B5wksPch
 k7+rz4rDJwvx2O+3C1KtmImC5qCEXrI+ATcMctJOHgHBqiDbxxEPohpG6IByQYCnkrTk
 VdE8qQauXc+GedEQ4udDLPl9J2zH9m8i+9g+As6QM9+1bpFwM6Dgi+AhxfdzJ+651mtH
 bgLQt8noebITq8uLzWj4DnoTfQvM8bgDO88bx+6uOqRJw2CPRO4OZs7xrx+TT0C52eWO
 XbrBfxIZA8EiEYRFRVMQaU8KbQWA/xQ+p/Dqtk6kl2zKEotF8dsGzi6nZpTeS1cgNy1X FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnpyrj5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 14:06:50 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38RDuWdm031090
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 14:06:49 GMT
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Date: Wed, 27 Sep 2023 14:06:42 +0000
Message-ID: <aec0cb68c9d7e8ef4f87e1fd46d0c1e8db369cd7.camel@ibm.com>
References: <5d1197e055790683c7653272d5f1ef7e5f9e576e.camel@ibm.com>
 <4ed6003f-c49e-3e02-b807-32939fa62b4c@redhat.com>
In-Reply-To: <4ed6003f-c49e-3e02-b807-32939fa62b4c@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <127685334AF82948B0FF8E19A27F1AA8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [svsm-devel] SVSM guest setup
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, Cole Robinson <crobinso@redhat.com>

T24gVHVlLCAyMDIzLTA5LTI2IGF0IDExOjM0IC0wNDAwLCBDb2xlIFJvYmluc29uIHdyb3RlOg0K
PiBPbiA5LzI2LzIzIDEyOjA4IEFNLCBDbGF1ZGlvIFNpcXVlaXJhIGRlIENhcnZhbGhvIHdyb3Rl
Og0KPiA+IEhpIGV2ZXJ5b25lLCANCj4gPiANCj4gPiBJIGhhdmUgdHJpZWQgdG8gcmV1c2UgdGhl
IEFNRCBsaW51eC1zdnNtIHNjcmlwdHMgdG8gY3JlYXRlIGFuZCBydW4gYSBDb2NvbnV0DQo+ID4g
U1ZTTSBndWVzdCAodWJ1bnR1IG9yIE9wZW5TVVNFKSwgYnV0IEkgaGF2ZW4ndCBoYWQgc3VjY2Vz
cyB3aXRoIHRoYXQuDQo+ID4gDQo+ID4gSSB1cGRhdGVkIHRoZSBsaW51eC1zdnNtL3NjcmlwdHMv
c3RhYmxlLWNvbW1pdHMgZmlsZSB0byBwb2ludCB0byB0aGUgQ29jb251dA0KPiA+IHFlbXUsIGxp
bnV4LWd1ZXN0LCBsaW51eC1ob3N0IGFuZCBvdm1mOyBob3dldmVyLCBJIGdldCBhIHNlZ2ZhdWx0
IHdoZW4gSSB1c2UNCj4gPiB0aGUNCj4gPiBsYXVuY2gtcWVtdS5zaCBzY3JpcHQgdG8gcnVuIHRo
ZSBndWVzdC4NCj4gPiANCj4gPiBDb3VsZCB5b3Ugc2hhcmUgaG93IHlvdSBoYXZlIHNldHVwIGFu
ZCBydW4gdGhlIENvY29udXQgU1ZTTSBndWVzdD8NCj4gPiAoaW5jbHVkaW5nDQo+ID4gd2hhdCBk
aXN0cm8geW91IGhhdmUgdXNlZCBpbiB0aGUgZ3Vlc3QpDQo+ID4gDQo+IA0KPiBJZiB5b3UncmUg
b24gRmVkb3JhIGhvc3QsIHdlIGhhdmUgcGFja2FnZXMgeW91IGNhbiB1c2UgaW4gYSBjb3ByIHJl
cG86DQo+IGh0dHBzOi8vY29wci5mZWRvcmFpbmZyYWNsb3VkLm9yZy9jb3Bycy9nL3ZpcnRtYWlu
dC1zaWcvc2V2LXNucC1jb2NvbnV0Lw0KPiANCj4gVXNhZ2UgZG9jcyBhcmUgaW4gdGhlIHdlYiBs
YW5kaW5nIHBhZ2UuIFZNIGNyZWF0aW9uIGlzbid0IGNvdmVyZWQgYnV0IGl0DQo+IHdhcyBzb21l
dGhpbmcgbGlrZToNCj4gDQo+IHdnZXQNCj4gaHR0cHM6Ly9kb3dubG9hZC5mZWRvcmFwcm9qZWN0
Lm9yZy9wdWIvZmVkb3JhL2xpbnV4L3JlbGVhc2VzLzM4L0Nsb3VkL3g4Nl82NC9pbWFnZXMvRmVk
b3JhLUNsb3VkLUJhc2UtMzgtMS42Lng4Nl82NC5xY293Mg0KPiBzdWRvIHZpcnQtaW5zdGFsbCAt
LWJvb3QgdWVmaSAtLW9zLXZhcmlhbnQgZmVkb3JhLTM4IC0tY2xvdWQtaW5pdCAtLWRpc2sNCj4g
RmVkb3JhLUNsb3VkLUJhc2UtMzgtMS42Lng4Nl82NC5xY293Mg0KPiAoaW5zaWRlIFZNOiBsb2dp
biwgZG5mIHVwZGF0ZSwgZW5hYmxlIHRoZSBjb3ByLCBpbnN0YWxsIGtlcm5lbC1zbnAtdXBtKQ0K
PiANCj4gQW5kIHRoZW4gZm9sbG93IGNvcHIgaW5zdHJ1Y3Rpb25zLiBPbmNlIHlvdSd2ZSBnb3Qg
YSBndWVzdCBib290aW5nLA0KPiBzdGFydCBzd2FwcGluZyBvdXQgcGFja2FnZWQgY29tcG9uZW50
cyBmb3IgbG9jYWxseSBidWlsdCB2ZXJzaW9ucyBhcw0KPiBuZWVkZWQsIGxpa2UgcGFzc2luZyBg
Y29jb251dC5zaCAtc3ZzbSAvcGF0aC90by95b3VyL2NvY29udXQuYmluYA0KPiANCj4gLSBDb2xl
DQo+IA0KDQpIaSBDb2xlLA0KDQpUaGFua3MgZm9yIHRoZSBjb3ByIGxpbmtzLsKgV2l0aCB0aGF0
IEkgdGhpbmsgSSBzaG91bGQgYmUgYWJsZSB0byBydW4gc29tZQ0KY292ZXJhZ2UgdGVzdHMuDQoN
CkZvciBkZXZlbG9wbWVudCwgSSB3aWxsIGNvbnRpbnVlIHRvIHBhc3MgdGhlIGtlcm5lbCBhbmQg
aW5pdHJkIHRvIHFlbXUuDQoNClRoYW5rcywNCkNsYXVkaW8NCg==
