Return-Path: <cclaudio@ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CADE71A5D66
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 Nov 2023 03:58:18 +0100 (CET)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A22j5jQ017327
 for <svsm-devel@coconut-svsm.dev>; Thu, 2 Nov 2023 02:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=pp1; bh=j2tfcrFHGQSTS4Ya1assYB6CNbhQcz5yyJPb/+PCCkw=;
 b=KKkw2egyjtAoHm6/6iu2e59GJQaq1Alr5tZ5lnlTRhBOA66oMqerHlOGOJRtjHXgewR0
 +TMjG0Crm2OKiNkNXREiR0Ih0sOiKXafeBXYU+9aDkeEzpn3wJpWOEvN53tkBq69zEuf
 G3wguphXV1m/A4xNd00bepGFpiUvD3pBFwYP2AWebAA5+cslflywfveG+qwSpIatkXiu
 mwTvyDdbQgTd2b4XXy7Zz5VdWjkT9I2VTp9Z79pr71aRPlgvK8ooE6zKWF6CdHqMJK6M
 H4sDalq6WyiogE75fiMJhb2Vj14SbxDU51zv4mSi/c/AN4a7zPRv0x9LwW9tihf1hybX Uw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u438mg98e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <svsm-devel@coconut-svsm.dev>; Thu, 02 Nov 2023 02:58:17 +0000
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Date: Thu, 2 Nov 2023 02:57:03 +0000
Message-ID: <1279ce20004b4c9023b8746f5833fe0da96b13f9.camel@ibm.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7018C4C48E6D9F47B9074771CCD56D79@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: [svsm-devel] Allocating 4 contiguous pages and set them shared
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

SGVsbG8sDQoNCkkgY291bGQgdXNlIHRoZSBsaW5lcyBiZWxvdyB0byBhbGxvY2F0ZSBhbmQgZnJl
ZSA0IGNvbnRpZ3VvdXMgZ3Vlc3QgdmlydHVhbA0KcGFnZXMsIGJ1dCBpdCB3aWxsIGFsbG9jYXRl
IGEgcGFnZSBvZiBvcmRlciAyLCB3aGljaCBJSVVDIGlzIGJpZ2dlciB0aGFuIHRoZQ0Kc2l6ZSBy
ZXF1ZXN0ZWQuDQoNCmxldCBwID0gYWxsb2NhdGVfcGFnZXMoZ2V0X29yZGVyKDQqUEFHRV9TSVpF
KSk/Ow0KZnJlZV9wYWdlKHApOw0KDQpNeSBxdWVzdGlvbiBpcyBob3cgc2hvdWxkIEkgc2hhcmUg
NCBwYWdlcyB3aXRoIHRoZSBoeXBlcnZpc29yIGluIHRoaXMgY2FzZT8gSQ0KY291bGQgY2FsbCAi
dGhpc19jcHVfbXV0KCkuZ2V0X3BndGFibGUoKS5zZXRfc2hhcmVkXzRrKCkiIGZvciB0aGUgZmly
c3QgNA0KY29udGlndW91cyBwYWdlcyBvZiBwLCBidXQgaXQgc2VlbXMgdGhhdCBzZXRfc2hhcmVk
XzRrKCkgd2FzIG1lYW50IGZvciBwYWdlcyBvZg0Kb3JkZXIgemVyby4gQW0gSSBtaXNzaW5nIHNv
bWV0aGluZz8gQW55IHRob3VnaHRzPw0KDQpUaGFuayB5b3UuDQoNCkNsYXVkaW8NCg0KDQo=
