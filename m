Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.189.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722472;
	b=vWL7cXEyM9HYmhOY9ybw3F1a19JIrriZS5f4n6Lne2YGuPmviTvKbCq98g8dUlFqJpqe
	 ZZTNpPfIeEiqPh6HihNNpPl9RlZonIIVrVtszuFF/wDf0JE93I8fYlWC9L58CSsYgDz9c
	 CB8aP64hWW8Rr8H1XjshJ+HzZBxHEwY/Wo8IXaCueMeMlov0d0mx73WeqcfucECvszVls
	 F1OQxacKiXcZR7RmoLGHJhi1tqFDQoE+9YRWAdNKe3Qq4WYz3NrXnAqCC/5C5NC2NA/Vi
	 ZzUFGBnv5fktmQJ54Hw2QGFzv487cqLtWCK0KEwtpq7dT7Beho/3sjMLcsTtZO8F8bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722472;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Date:From:To:Message-ID:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:References:
	 X-Mailer;
	bh=7ySMdfCdSNcAtS5lwI0qhP+VQ59K8FkK5UlOyORK/sY=;
	b=oYfKhSHE/bxp6q9KhLi+t3Pd20Ohf1OgzAaVCqwl+3h3m5bkIU6hvaoYOFeoTsY/d1ee
	 VkhBPa2AxMy0ClOAUxR9xMryzfTp45oQOzdje/canfR685S/hP/F9jl63G4s9Lc6XtBk0
	 OhMm2tB6Cy+1CQaBzkWmA4piJvi2ViYR9NQg53qHqhJ3ka2v2q49xRlWt8X4uciHXgqa3
	 El7Xc1cq2TzkEy9DKAYrC/ZSRRAVWtlCP+2wDsYXColEsJgzHwM27StSyl6Xye+08cd5P
	 XbJvVaF6ffv1NToaCW3ZsDKhu4Y4zMtlGdnBtzwZEpgbGAR4Jp6zqNc7NHKf6O1TfPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aol.com;
	spf=pass smtp.mailfrom=aol.com;
	dkim=pass header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=nFYzshM2;
	arc=none smtp.remote-ip=66.163.189.146
Received: from sonic314-20.consmr.mail.ne1.yahoo.com (sonic314-20.consmr.mail.ne1.yahoo.com [66.163.189.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97321606A326
	for <coconut-svsm@lists.linux.dev>; Tue,  3 Nov 2026 16:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97321606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=nFYzshM2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1793722470; bh=7ySMdfCdSNcAtS5lwI0qhP+VQ59K8FkK5UlOyORK/sY=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=nFYzshM2H4nIerTDat9oC0+/StSqJrqOidhCtWE/AbHX7OAsjZY3BY588iwVD5AvjgkWsttEr3FdYyWKy99Bc80JO5gMrhrH53oH/XyVurOObyf5sjYiBM8JaQaIcSjXDfr4C3CkxKXRngyBSstQq1fk1Pn2HSReZJXmoRvjA3+gBuoQjbn5wwQ/8QStXk2V5E7W+rJ7bH+fmFuEQTzZ6KoigrHKD8vKiSlpBQnxIqQhpAKu6QXo/OQvh9vIMwGO02Wq+wjADYOk7tMRwvlnCgtX18a0RSKKqSV5HxGMF+FkRVL7UjTdTah98Q5QSiGYaym0h5qEDbGLdO31mKFKPw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793722470; bh=e7BXLcJEGbatP9Bwe52Qn0YPTEbn4o/fWs8EL1tHJ0M=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=UZ4VRcxdmCKKp0rQmUUK6Jr7cOinQYUESiNwh7IpQK7uwI8tBfQhGL/e4JFlCmmj1J+QEnrJiAhAr/iQXT9jH3FpANp3X1LCDUINc1NacRrl37XgBUTeLe/w5fEp4yCH8XkxFJfogWR2cvjYFrWfKIFJ02cVxRfAG+hVs5n/MhtncYWelai54R67BWHaS8Jb+JPvBPsk1gVVkFlR4hmTERR7W6UbqpeDJWAxG+QlGzMctu/F/50CFbzbRnBZrrOW45IS81NWyMe8MJzet0BDeVbZyvvCmL1mzW8I9T/dqOV7cw5liJgHpA7ycFovkeodvL5fOfvU5ekjBTsOZmwujw==
X-YMail-OSG: 4fOgCH8VM1lE.mf3hInh_qTaS8jW.jAN9_nPpoKDZzXIJx2kde3HLVAax7amGn_
 .AAnJDUUErX2.LptNoWEPx5MQa0ZsMRDkSW0Av7axx4C1AaTyekT07Hnl75nkY_GDgtZET9dV4F9
 AQMK4Jm.CqdzYQKLrgJ8.G2sFSmQonWVLm8FSBZudaa.KWeeqceACt.GNIMWh8mXzPFwx2NljV_i
 .4btbVq4OvjagOTm.nzVghQBskb2cWnIrwsf7Ph9_tpH016jwub5JAg.3gv0vta3Jw8Zs9rVbshn
 WT.tAUlRSkrGURZOByKIcUIX5gD2dFzvdLMDa41QajZja4c0fDZx2Yk5_8iB7UZpNeACWqjDKZiL
 .2h_PrSXT8gJYOtPEhLzWkcAWfxS3cGEPZ0JQ3w6NX3ShQAheS0Q2wy1oxUYDke0conW6c0_l4x2
 WOnOlIr2ulc75Q79rPIfTg2EHn3PSX.n.NCV3Sy7856R0rHDArb4NjccKz4nD5AXoPYYNtDSyRPi
 HVDm_B4KAqthBL3Fm4UN14wPxVZjO1rmbbcuKANrPZb3Gn.jpg8h_W3mDUmXZbrWIYW0Zr8.tOIT
 LRK6hY15ziLy.Yg_p3fNxMVonHiW.wlLtvDt1Pc.dUMAQeYqOW7zgrndh8P4G_f3wG8s2KMxmW6b
 kvCxHcboPzgsac2hYYrUSmBoUZUNQ4ZfGlECtR_R.fPy3M0w2KTbw24x.CXnPPTBdvkl6qrhR4SV
 kb0iFAtPumBX.Tnvrz_aW_PHQkokxC.4IP9LitLiE0M6bXzOt3fUITe8eXur9xqzyck1Gc3ydLQm
 ZoRpOisFBlorxG8tU_T9yy34u3U05blKkjM3BfZnSPZJa1__G.r9H3oELi.AjPyMvamihNGQAyaX
 .vV9Gj6vwMuMbVlYAYkVvOTNcx5qu6s82j_mYNCBGNO6X56d8QSn7y79przietTr.zpEQQ4XiaKB
 d7YHU4WRL8udEF4kl0SCXqj5XGJ_D1b5ssKZBEVregu6wKFObhiMkL121S7Mp6GAZQHvMXwmn62M
 Wj.yVl2y9_n1hqCzhw65d.aH7Qfje4l5UaX7NlPqJdVuyhKp97IIEBT4Tof8hYn_dR.8cqpnpoPg
 N0YopiXC_7kpZy586WGxc.smaPxFxRv6yjpxeE3JA_2W8zUephssNdeCvzC0eyhvVEqiQsk3Z5QS
 akCUHNORfkfct93XRKqkwRx9MTJxlGikVjuep34hwUjN7rEyje40B1ZI72AG5j.yvyZocI1Z_jjr
 dO4PocFMTpDh5ILQ9754RGc31d7siX3qaG5n8C8gc7u2qauHkMKl25JGKTcZ5VuBNPnX7Aa5n1_k
 c7IuGcYz2hmxK22UKyciyvxaDBjZ0.R7bQZNxQe4Tl7rF3GsOKsg0fy2hYHbquWi3xyvPd3B7tM8
 xqwSHvKZpkiGPbpXNl6ixEbPs7wjlE0I_H3Kuvl6inybpyU.8ZVCOD2yrtgIG1T6My8XMf4O1t25
 THn.EQQisFvLhRv4xhzEpaY9SwZuoYecxZuxQLygepCbjH6LTWUAb3wDEn3X8FNHV5HdIAMzy0Hc
 uOdr6VwjG6LvHgx6ALrWze23ml.jor8i8URfVt86myHN9trC__iVpkHjRNm4sMxVvvPXoU4N0cx6
 .PrULcL6WO5u892PiJ03AHPIhIiWqMcChO8biWlESpZW0YwGMrGwf7Nsjr_1xcU0NrjJBCM85uiX
 PpXKUow0kT58YWk4ZSDwIvABmJmIqyKgTnsmmplzi_wJp2wRRh3Hq34TDifbFjHoEPBt1YAF06ky
 1V3LMWBbs2YaL.NF7y.qbu2QC5FmdqMdEq1u5yw8l_e54bf3zeBCs3z9d0Xm6fsHOdrBW8eYjAGq
 bMEK2drCNdtFHb_NUQRVgl7bAVGkW_yJEzwqfXCWGjY65cfCPo3WO2jlZhDv2ckVefYY_EnaENQu
 7M4VLZhU1Vl7MeeNqQb4_PekXR6YpjfuKclzJ9SCauovycm._oLCLEPuZVk3rKgmSbv.xC0Vg24y
 0qxKsi3PRx.5Bu1S32Hk8hl.wxuIGBgGFsBDA8KyVahnKyjPbVe.KBGO699o1ZQ25vHI2VyZKM1H
 fYNe6QMAwVsg68Q.r1oZQTjHhsk3ymtAlS1uxjnR2HQAwdaNJ1I3HPJL_FIZja3xv_LxwCve48rH
 XjdOo26YctpwlZnTUaYwjM3wfIasQ1xLf
X-Sonic-MF: <camachonick456799@aol.com>
X-Sonic-ID: cab3ad7f-3032-434d-a7a1-2982c9666050
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 3 Nov 2026 16:14:30 +0000
Received: by hermes--production-gq1-fd7994565-ntx8j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 73a0d8730a0ea89d2328976b78cb5086;
          Tue, 03 Nov 2026 16:14:25 +0000 (UTC)
Date: Wed, 4 Nov 2026 00:14:19 +0800 (CST)
From: camachonick456799@aol.com
To: coconut-svsm@lists.linux.dev
Message-ID: <449404911.3886.1793722459272@c57535676d5b>
Subject: coconut-svsm.0: Is it appropriate to add multilingual support to
 the Coconut-SVSM archive page?
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <449404911.3886.1793722459272.ref@c57535676d5b>
X-Mailer: WebService/1.1.26871 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

Hello, coconut-svsm.0. I am Guan Leiming, the founder of Weifang Leimingyun=
 Network Technology Co., Ltd., and also=E2=80=A6 translate.js  The author o=
f this open-source translation plugin. I=E2=80=99ve noticed recently that y=
ou are working on maintaining the archive mirror project for the Coconut-SV=
SM mailing list =E2=80=93 a platform that provides technical content for de=
velopers around the world, and which is well-suited for enabling multilingu=
al support through lightweight integration.

 I have a ready-made solution here: With just two lines of JavaScript code,=
 the archive page can automatically support switching between hundreds of l=
anguages, without any changes to the existing structure, and it remains sea=
rch engine-friendly. If you think this direction is feasible, I can send yo=
u the demo link http://translate.zvo.cn  For reference.

 I=E2=80=99d like to confirm whether integrating this feature is suitable f=
or you Or is it convenient to refer them to the person actually in charge o=
f internationalization?
