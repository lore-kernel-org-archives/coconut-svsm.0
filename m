Received: from mxs.seznam.cz (mxs.seznam.cz [77.75.78.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA52DD5E7
	for <coconut-svsm@lists.linux.dev>; Fri, 27 Jun 2025 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033163; cv=none; b=KIQurdoxSeqMfboaGA7MmlWckaV+immtTmnSgGvxZvVqXW+LclQylKWWMp2uzygrrPpMjQrQZLrPUOcqdk0Zw2Md+PtJEEOMHRB6XgqC45sXkb14R4vfuYwwA0JYE2T5CdKxZWkoZgP47spda8RsGpxZPzqA0u7QLRqIGpsjj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033163; c=relaxed/simple;
	bh=roEZsSFi7C/roAKUXmQI+3YmNyB158U33sqqjA2kzCI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=GzGvd0Adr1iDxdFrzOWny4u2dRqZp5uPfHSU5UEGfU3SWQ5AhFt3gipDPDVz2ujvXJrBIyaFOLx4qBzZBJm2tfU4p/IvWFfor8/4cfJTikuJJGnI5nuPMM+78pcv4MDyldI/D25VsRHkA4G3KNsEXOA7x6RpsZtRWGgjndChBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=aAdr/n6K; arc=none smtp.client-ip=77.75.78.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="aAdr/n6K"
Received: from email.seznam.cz
	by smtpc-mxs-577df68b8b-4cpcx
	(smtpc-mxs-577df68b8b-4cpcx [2a02:598:128:8a00::1000:854])
	id 0d6b07b79317fadb0ca3100f;
	Fri, 27 Jun 2025 16:05:57 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn20221014; t=1751033157;
	bh=XNsBY3J4zK7Ur+s4cj/P/f3nS9RpGjWAXyAJnOmIULc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To;
	b=aAdr/n6Kb2v7LcXDrl/voiIUSweLwlZXRR0TNRvOj8QJZ51PRWM8CL4GYTclIqGxn
	 L9ZhDJd7bIFiSx1uZkCub6U1M5bTlyFawT1G7lUZ1eAld+nCkHl2cFq2E+2/Pgg5UI
	 DRMrJJ1Iqx/g63sLfalKO/StExToDTLy9dZVhagCBcxLpKSPARubjaYiPgVU375Sak
	 EfE0bxHpyx1ufWEc4lVxWg5tf9vWsaI3l+5lxBVT3OkOVByoPSIRWS6FDerit0UYxt
	 0u7Nza4K/xsAkZvTWFd5K68guAqcPAD71uX9OEWHHzyExHEQi+n1rt3NRUmn+mqgvs
	 DGcluL5pQKOLw==
Received: from localhost (c-85-230-59-141.bbcust.telenor.se [85.230.59.141])
	by smtpd-relay-84c6f88d6f-dfrm5 (szn-email-smtpd/2.0.57~lubosawslc-1)
	with ESMTPA id e8795bf1-bd90-4cb3-9a1c-5cd66c321aae;
	Fri, 27 Jun 2025 15:45:58 +0200
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b4d7d530ebf5e3ffa990659db23bd1d2a4e4778702868d277e4c8d0cd292;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Jun 2025 15:45:56 +0200
Message-Id: <DAXD0VKXZ7KH.2WNLX124KC7HZ@matfyz.cz>
Cc: <pankaj.gupta@amd.com>, <thomas.lendacky@amd.com>, <sgarzare@redhat.com>
Subject: Steps towards live migration
From: =?utf-8?q?Jakub_R=C5=AF=C5=BEi=C4=8Dka?= <jakub.ruzicka@matfyz.cz>
To: <coconut-svsm@lists.linux.dev>
X-Mailer: aerc 0.20.1

--b4d7d530ebf5e3ffa990659db23bd1d2a4e4778702868d277e4c8d0cd292
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

as mentioned during the last SVSM development talk, I am currently writing =
my
thesis on live migration of confidential guests. With this email I would li=
ke to
start a discussion so that the same problem is not addressed multiple times
independently. I also welcome any feedback to make the code written useful =
for
SVSM Coconut (not only for the thesis). Development is done on machine with
SEV-SNP support. I made a pull request with the SVSM patches[1] to ease the
discussion.

Here is a summary of progress to date:

All validated guest pages can be transferred from the source SVSM to the ta=
rget
SVSM. Currently, no packaging (no confidentiality) is performed, but a hash=
 of
all transferred/received blocks is computed that can be compared to verify =
that
the channel is working correctly. Also, the main migration function of the
source and destination SVSM is busy waiting for a signal from QEMU to start
outbound or incoming migration.

A single shared page called MigrationPage is used for data transfer and
communication with QEMU. The migration page contains two registers and a bu=
ffer:
a status register, a data register, and a data buffer. The status register =
is
used to signal a change in status (e.g., migration starts, migration is
complete). The data register is used to signal that a new page has been pre=
pared
in the data buffer by the provider or processed by the consumer. The roles =
of
provider and consumer are switched between SVSM and QEMU on the source and
destination machines.

The QEMU patch[2] implements communication with the SVSM migration handler =
and
block transfer from source to destination. The idea is that creating the
communication channel is all the hypervisor should do, the rest should be d=
one
in SVSM.

Current plan for the future in order of realisation:

(1) A function that puts all hosted vCPUs (except the migration handler) in=
to a
    spinning state. The hypervisor is not trusted, so the SVSM must be able=
 to
    ensure that it is not running any vCPUs. For this task, I consider two-=
phase
    checkpointing[3].
(2) Migrate the machine from the source to the destination with all vCPUs=
=20
    stopped by the function from (1).
(3) Secret key establishment - though about using [5].
(4) Package the pages - authenticated encryption using [4].
(5) Dirty page tracking.
(6) Move the SVSM migration handler on an extra vCPU.
(7) Start migration handler on signal instead of busy-waiting loop.

Best regards,
Jakub

[1] https://github.com/coconut-svsm/svsm/pull/745
[2] https://github.com/coconut-svsm/qemu/pull/23
[3] https://ipads.se.sjtu.edu.cn/_media/publications/sgxmigration-dsn17.pdf
[4] https://github.com/RustCrypto/AEADs/blob/master/aes-gcm/src/lib.rs
[5] https://github.com/nihalpasham/static-dh-ecdh

--b4d7d530ebf5e3ffa990659db23bd1d2a4e4778702868d277e4c8d0cd292
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTttfbGRG1oLZIHv/k0m7mftWU3lAUCaF6glQAKCRA0m7mftWU3
lOtjAP9qBnH/NUc4k8QOY+hseNdB6cDVU/oAqnCB7Gjy9CF3fgEAk4DlVNwSvNgB
iwoH4ByMD/RbDy4PHn9x/6n9vGKs5AU=
=qoBw
-----END PGP SIGNATURE-----

--b4d7d530ebf5e3ffa990659db23bd1d2a4e4778702868d277e4c8d0cd292--
