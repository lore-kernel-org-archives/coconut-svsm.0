Return-Path: <cclaudio@ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BF6FD1C3064
 for <svsm-devel@coconut-svsm.dev>; Fri,  9 Feb 2024 15:46:06 +0100 (CET)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 419EPuUC013430
 for <svsm-devel@coconut-svsm.dev>; Fri, 9 Feb 2024 14:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=pp1; bh=L4bN04pzP9gEVeiUG23cN7DUQA0XJ6U3djGlnt2b9xM=;
 b=Ofx29gdZ4yrYG+jK5fGWrJUNjRO3sr9V853mTC3pJl2IEmOCobyCZypIfCd+73XLNgDk
 nAjSMCzxRNcquRNhP+BUNMyg7bmz+EMwhZ/0YK9oRUEPNJw4UmV/lZfNAjOqGY+xGhgj
 v4HTMkxvGPYpa3ufjQFTFhRsGd8SEA+HbP+qi6v7p88TlrCpiBXwWwsmHkmP/0yisPxC
 lHSHtNTEhjc9UJ5A+jorGEWB9Vf72dmLAw8z7Bm5O7rskk35bRWnfFbCdEHqe9A8F72H
 nD9fscJRAsZx7V9+ZXHJGgl5sAkfdwm98jaP0xN0Cmq8CQFc6VTf0YAOkIxTnVSZFnz7 Wg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w5nt4gn4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <svsm-devel@coconut-svsm.dev>; Fri, 09 Feb 2024 14:46:04 +0000
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Date: Fri, 9 Feb 2024 14:46:03 +0000
Message-ID: <9a2a2fec29450701145a97b52ce70844eaac793d.camel@ibm.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6CB1565D02D6946B36447F5C1673EC9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: [svsm-devel] Launch coconut-svsm using IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

SGksDQoNCkkgd2FzIGRvaW5nIHNvbWUgcmVzZWFyY2ggb24gSUdWTSwgYnV0IEkgZGlkIG5vdCBm
aW5kIGFueSBleGFtcGxlLiBEb2VzIGFueWJvZHkNCmhhdmUgYW4gZXhhbXBsZSBvZiBhbiBJR1ZN
IGZpbGUgYW5kIGEgUUVNVSBjb21tYW5kIGxpbmUgdGhhdCBJIGNvdWxkIHVzZSB0bw0KbGF1bmNo
IHRoZSBjb2NvbnV0LXN2c20/DQoNClRoaXMgbWlnaHQgYmUgaGVscGZ1bCBmb3Igb3RoZXIgcGVv
cGxlIHRvby4NCg0KVGhhbmtzLA0KQ2xhdWRpbw0K
