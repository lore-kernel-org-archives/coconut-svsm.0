Return-Path: <joro@8bytes.org>
Received: from smtpclient.apple (p4ffe1e67.dip0.t-ipconnect.de [79.254.30.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 3931D1A90B8
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Dec 2023 14:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1701783981;
 bh=vgmOxwSkl4UK+z9hxmpw+8kwTKPnnD0lED8FHNu9fmo=;
 h=From:Subject:Date:To:From;
 b=ODUe4uyKg24MxnANUMLJHzeWL0OfdxhvOgzCxlGotGUzHMo7PabavHn7SrO2ObBJs
 AQbF6VbnYE1bU+xxZg+H/FeTc0jXsIxxNOBDLW7BvHSJht9LsQv3EuE9NEzklsJIRR
 SCi+bg3etAT4xQUOul3u4+wbnWdllqgrYaGB5ARkIXJRL+kdI38RZ49jsuJIoDK7lq
 WdZeCYhnwsuYU3qOargS6qA9t0wXZyK1i/MYEl/c5kptPMpiYgaEr25jrJWWBKEun4
 +FUEJHN/bmn1HhK1O1t/aOiLxzJyzm3TR3dWKu3duddCFinWjqEs7f3Qyro4u8Dx1J
 bhG8uBOWWgZaQ==
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Message-Id: <C00775B3-350A-4ECC-B8BB-7A733F6EA385@8bytes.org>
Date: Tue, 5 Dec 2023 14:46:10 +0100
Subject: [svsm-devel] COCONUT-SVSM submission to the CCC
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi,

Submitting the COCONUT-SVSM to the CCC requires some paperwork, namely =
filling out a project submission template and adopting a technical =
charter.

I have prepared both documents and want to share them here with all of =
you:

	https://github.com/coconut-svsm/svsm/discussions/174

Please carefully review them and let me know your feedback. You can send =
feedback as a reply to this email (private or public), via commenting in =
the Github discussion, or by attending the SVSM development call =
tomorrow, where I will put this on the agenda.

The technical charter is particularly interesting, as it describes the =
governance process of the project. I read through it and found nothing =
particularly problematic, it follows the defaults set by the Linux =
Foundation and we are free to overwrite some rules in our CONTRIBUTING =
file. Nevertheless, for those of you not familiar with the standard LF =
technical charter template I suggest to read through it.

Regards,

J=C3=B6rg=
