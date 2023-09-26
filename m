Return-Path: <cclaudio@ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 599C31A1F27
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 06:08:29 +0200 (CEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38Q3FRx7001462
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 04:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=pp1; bh=x878TGYGKmwT58ufk9dB58AuvMDVLpKQKi3rDlHGIx4=;
 b=Y2bNCe8KtzTLcl28jyRJpCFYin5X+7FoiL4skNZb/e/qez0sYblegrgL+D0CmSN/WcCW
 r7cd5aSYXSbgyhM4VGQsMXek9999RqxLjI/maUO4FVIEOb/rJdDE8zGQiowf7M/NAz91
 pAwgXzsNyRGXKZ0HebHkF3fWvEMYVJKPrVNa+1fCReHDV7ju3qeTP/YCyw/wdc4ZExGu
 ksiUXduWwv6rgZNbCvXh8b/h7nKTcAQClDdp3yJYY0LZUwO+uGBLrJDp9Yeqa8Vr9UIK
 so+wpkOioBrRbcQ2I2T2pAtAS7EWB/2qy5epVWwz329w2Y0fWAyLK/9D5DbVEUfhJXMi eg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tbm8649cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 04:08:27 +0000
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Date: Tue, 26 Sep 2023 04:08:25 +0000
Message-ID: <5d1197e055790683c7653272d5f1ef7e5f9e576e.camel@ibm.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <447AFE137719CE4B8F3C979088D3D7FF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: [svsm-devel] SVSM guest setup
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

SGkgZXZlcnlvbmUsIA0KDQpJIGhhdmUgdHJpZWQgdG8gcmV1c2UgdGhlIEFNRCBsaW51eC1zdnNt
IHNjcmlwdHMgdG8gY3JlYXRlIGFuZCBydW4gYSBDb2NvbnV0DQpTVlNNIGd1ZXN0ICh1YnVudHUg
b3IgT3BlblNVU0UpLCBidXQgSSBoYXZlbid0IGhhZCBzdWNjZXNzIHdpdGggdGhhdC4NCg0KSSB1
cGRhdGVkIHRoZSBsaW51eC1zdnNtL3NjcmlwdHMvc3RhYmxlLWNvbW1pdHMgZmlsZSB0byBwb2lu
dCB0byB0aGUgQ29jb251dA0KcWVtdSwgbGludXgtZ3Vlc3QsIGxpbnV4LWhvc3QgYW5kIG92bWY7
IGhvd2V2ZXIsIEkgZ2V0IGEgc2VnZmF1bHQgd2hlbiBJIHVzZSB0aGUNCmxhdW5jaC1xZW11LnNo
IHNjcmlwdCB0byBydW4gdGhlIGd1ZXN0Lg0KDQpDb3VsZCB5b3Ugc2hhcmUgaG93IHlvdSBoYXZl
IHNldHVwIGFuZCBydW4gdGhlIENvY29udXQgU1ZTTSBndWVzdD8gKGluY2x1ZGluZw0Kd2hhdCBk
aXN0cm8geW91IGhhdmUgdXNlZCBpbiB0aGUgZ3Vlc3QpDQoNClRoYW5rIHlvdSwNCkNsYXVkaW8N
Cg0K
