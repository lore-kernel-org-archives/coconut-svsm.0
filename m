Return-Path: <cclaudio@ibm.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pp1;
 bh=gB88A2fnmnheZGOnELSCEux2drmMb8Q9d8ecXp2HhFw=;
 b=QU0g9CyOOb/eTOi6Q0Iky7mSBxvwKfrusnPzKp2cuoKHx4yhLqk+R4KfIC5BIxS0yvbK
 epslTLCT7m1bfKJDTs/RWWmz0wWH/prfv9GHGZe12rx9YK4MghdietuRC0gXgZRmUW2u
 GFi/g54gszIHJJT9hFYx3dD1WNvKyRR3lnyUFlcG+W/zuRb4VltnN6UWioQLQoNAxoiu
 LXl3E9HrQ1elDH/s2agMdlCdrC3goRLy3ADwjGJHM18R1NuQEf8uPte4NvO1fgNO6cAv
 HnO4Uz1IgmugFS2s2OtayEXF8CAVoYQlSlkuwxWV9E23Yw7iphX53dKLBH5VjHAesPZl lQ== 
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Date: Fri, 9 Feb 2024 16:03:02 +0000
Message-ID: <69240cfb33514a2374531aa12ab9ad94c9b5b4ed.camel@ibm.com>
References: <9a2a2fec29450701145a97b52ce70844eaac793d.camel@ibm.com>
 <ZcZKBdaSWI4cNDBP@8bytes.org>
In-Reply-To: <ZcZKBdaSWI4cNDBP@8bytes.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C3DB23F39338948AD8B2195F9085CE7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [svsm-devel] Launch coconut-svsm using IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "joro@8bytes.org" <joro@8bytes.org>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

T2gsIEkgdGhpbmsgSSBtaXNzZWQgdGhhdCBQUiwgYnV0IGdyZWF0IEkgd2lsbCBwcm92aWRlIGZl
ZWRiYWNrIGluIHRoZSBQUiBhZnRlcg0KdGVzdGluZyBpdC4NCg0KVGhhbmtzIEpvcmcsIHRoYXQg
aGVscHMgYSBsb3QuDQoNCkNsYXVkaW8NCg0KT24gRnJpLCAyMDI0LTAyLTA5IGF0IDE2OjUxICsw
MTAwLCBKw7ZyZyBSw7ZkZWwgd3JvdGU6DQo+IEhpIENsYXVkaW8sDQo+IA0KPiBPbiBGcmksIEZl
YiAwOSwgMjAyNCBhdCAwMjo0NjowM1BNICswMDAwLCBDbGF1ZGlvIFNpcXVlaXJhIGRlIENhcnZh
bGhvIHdyb3RlOg0KPiA+IEkgd2FzIGRvaW5nIHNvbWUgcmVzZWFyY2ggb24gSUdWTSwgYnV0IEkg
ZGlkIG5vdCBmaW5kIGFueSBleGFtcGxlLiBEb2VzDQo+ID4gYW55Ym9keQ0KPiA+IGhhdmUgYW4g
ZXhhbXBsZSBvZiBhbiBJR1ZNIGZpbGUgYW5kIGEgUUVNVSBjb21tYW5kIGxpbmUgdGhhdCBJIGNv
dWxkIHVzZSB0bw0KPiA+IGxhdW5jaCB0aGUgY29jb251dC1zdnNtPw0KPiA+IA0KPiA+IFRoaXMg
bWlnaHQgYmUgaGVscGZ1bCBmb3Igb3RoZXIgcGVvcGxlIHRvby4NCj4gDQo+IFRoZSBDT0NPTlVU
IGJ1aWxkIHByb2Nlc3Mgd2lsbCBnZW5lcmF0ZSB0d28gSUdWTSBmaWxlcywgb25lIGZvciB1c2Ug
d2l0aA0KPiBRRU1VIGFuZCBvbmUgZm9yIHVzZSB3aXRoIEh5cGVyLVYuDQo+IA0KPiBUbyB1c2Ug
aXQgd2l0aCBRRU1VLCB5b3UgbmVlZCBhbiBJR1ZNLWVuYWJsZWQgUUVNVSwgaW5zdHJ1Y3Rpb25z
IG9uIGhvdw0KPiB0byBnZXQgb25lIGNhbiBiZSBmb3VuZCBpbiBoZXJlOg0KPiANCj4gwqDCoMKg
wqDCoMKgwqDCoA0KPiBodHRwczovL2dpdGh1Yi5jb20vcm95LWhvcGtpbnMvc3ZzbS9ibG9iL2ln
dm1faW5zdGFsbF9kb2MvRG9jdW1lbnRhdGlvbi9JTlNUQUwNCj4gTC5tZA0KPiANCj4gVGhpcyBp
cyBhIGZpbGUgZnJvbSBSb3kncyBwZW5kaW5nIFBSIG9uIHVwZGF0aW5nIHRoZSBkb2N1bWVudGF0
aW9uIGZvcg0KPiB0aGUgSUdWTSBzd2l0Y2guDQo+IA0KPiBIb3BlIHRoYXQgaGVscHMuDQo+IA0K
PiBSZWdhcmRzLA0KPiANCj4gwqDCoMKgwqDCoMKgwqDCoEpvZXJnDQoNCg==
