Received: from mxs.seznam.cz (mxs.seznam.cz [77.75.76.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB42DEA92
	for <coconut-svsm@lists.linux.dev>; Tue,  8 Jul 2025 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982939; cv=none; b=Z8zxgEcRJz70U5fOvzGN8jQQpNS6Ro9eszcVEkhFkXVKxIlitDmJxxVP8txCd9/obVPmOAWSJEruT5cK1wFcwVx3gkVQ+cRpnV4RHqEoBmm84QuEpWUgjNuihDnhFZChEuH0G6ZQEVgdf76jcu41eicOKWIWAKKI8DwkhKmxXfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982939; c=relaxed/simple;
	bh=3HLS0KckJ8g37ZhCVU1HHIBJ9z3IeeC5K8V9yrW7G2M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=PsN0naUxforuvXfQAqTNKyz5nz3ATDVIpccOTt4pkztufkb+c0knyLyy4rgI2r8HJU3tLsdewKZRXPG8wAJijXhJIEL8h6INnh/JjI0/ogv0oQ5MbWK0h7jEWw6mRBHykk6HKLjIQIp8hEzQsv7JzpcOaH44WDXms5qGhInLmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=nNSsrWwI; arc=none smtp.client-ip=77.75.76.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="nNSsrWwI"
Received: from email.seznam.cz
	by smtpc-mxs-d9c5f9c8b-scfkr
	(smtpc-mxs-d9c5f9c8b-scfkr [2a02:598:128:8a00::1000:85a])
	id 6667ad35f81b505967afba8d;
	Tue, 08 Jul 2025 15:55:32 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn20221014; t=1751982932;
	bh=6a3BGh6ZpnkGHybme98BSUuKsG48G7nBWWbIiX2o8qQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc;
	b=nNSsrWwIwcwtOHZ8W9imMtF7mJmufCRn0UCgP6Fdi3X3wXCJnkLQyXVEhX1F8AKCn
	 OXUhmtvx8Z5m1/Ewuw7+cD58JOYlBUm/zOW8CQiVBozMo6u0IcRxRlamJbQ9JThW10
	 6KBHy3HRpbrVrJ62Ol9d6DGBRnDzZY2eTpVyp88Lh/Z6j2L0/03+0nWjagj0e//mV2
	 yam+Jeb98UOyBC563aSpwbFt4RdNBpQFHeXXPgEW8vVqG4wIgjapz19L5esMUhjEKn
	 YrSSmDeY/YGC21RKetKghABcBOK/QGNcbB18k8aDdoy0kysTYrXAFwpro5KxD+BYig
	 9n87CRtZrc5Zg==
Received: from localhost (c-85-230-59-141.bbcust.telenor.se [85.230.59.141])
	by smtpd-relay-b844fd7d4-kd86z (szn-email-smtpd/2.0.57~lubosawslc-1)
	with ESMTPA id 2e5470e6-6507-47ab-9ba4-6c681636cb89;
	Tue, 08 Jul 2025 15:49:50 +0200
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=297c6857cdfa6cdfd1075799097aaee2830b456d71badee86cf22f254a0a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 08 Jul 2025 15:49:48 +0200
Message-Id: <DB6PZTUMQLGW.2H9XI9IDV2UV4@matfyz.cz>
Subject: Re: Steps towards live migration
From: =?utf-8?q?Jakub_R=C5=AF=C5=BEi=C4=8Dka?= <jakub.ruzicka@matfyz.cz>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>, <coconut-svsm@lists.linux.dev>
Cc: <thomas.lendacky@amd.com>, <sgarzare@redhat.com>, "John Allen"
 <john.allen@amd.com>, "Joerg Roedel" <joro@8bytes.org>
X-Mailer: aerc 0.20.1
References: <DAXD0VKXZ7KH.2WNLX124KC7HZ@matfyz.cz>
 <232c21fc-33d9-49cc-ba82-fa02e5a699d7@amd.com>
In-Reply-To: <232c21fc-33d9-49cc-ba82-fa02e5a699d7@amd.com>

--297c6857cdfa6cdfd1075799097aaee2830b456d71badee86cf22f254a0a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 30, 2025 at 2:09 PM CEST, Pankaj Gupta wrote:
> +CC [John & Joerg]
>
> Hi Jacob,
>
> I briefly looked at your code. I have some questions below to understand=
=20
> your design more. Do you have a comprehensive design document somewhere?
>

There is no comprehensive design document at the moment.

>> Hi,
>>=20
>> as mentioned during the last SVSM development talk, I am currently writi=
ng my
>> thesis on live migration of confidential guests. With this email I would=
 like to
>> start a discussion so that the same problem is not addressed multiple ti=
mes
>
> Ofcourse. That's the reason we shared our design in the kvm forum talk=20
> and asked for collaboration on common components (open vendor agnostic=20
> problems):
>
> https://kvm-forum.qemu.org/2024/SNP_Live_Migration_KVM_forum_2024_svDwxa3=
.pdf
>
>
>> independently. I also welcome any feedback to make the code written usef=
ul for
>> SVSM Coconut (not only for the thesis). Development is done on machine w=
ith
>> SEV-SNP support. I made a pull request with the SVSM patches[1] to ease =
the
>> discussion.
>>=20
>> Here is a summary of progress to date:
>>=20
>> All validated guest pages can be transferred from the source SVSM to the=
 target
>> SVSM. Currently, no packaging (no confidentiality) is performed, but a h=
ash of
>> all transferred/received blocks is computed that can be compared to veri=
fy that
>> the channel is working correctly. Also, the main migration function of t=
he
>
> Any analysis on algorithm you plan to use for this? IIUC you are=20
> currently sharing the hash from source to destination? Wouldn't the=20
> 'aes-gcm' in [4] will do that in addition to encryption?

Yes, it would, but it was not used when I sent the email.

>> source and destination SVSM is busy waiting for a signal from QEMU to st=
art
>> outbound or incoming migration.
>
>  > > A single shared page called MigrationPage is used for data transfer =
and
>> communication with QEMU. The migration page contains two registers and a=
 buffer:
>> a status register, a data register, and a data buffer. The status regist=
er is
>> used to signal a change in status (e.g., migration starts, migration is
>> complete). The data register is used to signal that a new page has been =
prepared
>> in the data buffer by the provider or processed by the consumer. The rol=
es of
>> provider and consumer are switched between SVSM and QEMU on the source a=
nd
>> destination machines.
>
> This looks like a communication channel between Qemu and SVSM. We are=20
> re-using few bits in per CPU ghcb page for SVSM <-> host commands=20
> communication.

The communication protocol description is not yet available for reading, or=
?

>
> I can understand you are not using additional vCPUs. All this can be too=
=20
> much work for guest general purpose vCPUs.
>
>>=20
>> The QEMU patch[2] implements communication with the SVSM migration handl=
er and
>> block transfer from source to destination. The idea is that creating the
>> communication channel is all the hypervisor should do, the rest should b=
e done
>> in SVSM.
>>=20
>> Current plan for the future in order of realisation:
>>=20
>> (1) A function that puts all hosted vCPUs (except the migration handler)=
 into a
>
> [...]
>
>>      spinning state. The hypervisor is not trusted, so the SVSM must be =
able to
>>      ensure that it is not running any vCPUs. For this task, I consider =
two-phase
>>      checkpointing[3].
>
> Can you please elaborate more this.

At the beginning of the back-out phase, all guest vCPUs except the migratio=
n
handler should be stopped. To ensure that the hypervisor does not let any o=
f the
vCPUs start, I want all vCPUs to enter a wait loop so that even if the
hypervisor allowed the vCPUs to start, no guest code would be run.

>> (2) Migrate the machine from the source to the destination with all vCPU=
s
>>      stopped by the function from (1).
>
> You mean black-out phase?

Yes.

>> (3) Secret key establishment - though about using [5].
>
> We need to tackle this problem. A probable collaboration point, maybe=20
> coupled with attestation and migration key sharing.
>
>> (4) Package the pages - authenticated encryption using [4].
>> (5) Dirty page tracking.
>> (6) Move the SVSM migration handler on an extra vCPU.
>> (7) Start migration handler on signal instead of busy-waiting loop.
>
> There still are other open questions at more granular level. Can discuss=
=20
> those as well, once I go through your complete design.
>
> But at higher level, I would like to reuse more of the existing=20
> functionality in Qemu for live migration and use SVSM for memory=20
> packaging, guests memory permission setting at VMPL0, and live migration=
=20
> sanity related tasks.

By reuse more of the existing functionality. Do you mean using the current
migration in QEMU and registering different SaveVMHandlers?

What's the plan for tracking dirty sites? I understood from the slides of t=
he
last kvm forum that this task should be done in SVSM. Have you already
implemented this? If so, are you using dirty page tracking in KVM or is it
implemented in SVSM.

Regards,
Jakub

> Best regards,
> Pankaj
>
>>=20
>> Best regards,
>> Jakub
>>=20
>> [1] https://github.com/coconut-svsm/svsm/pull/745
>> [2] https://github.com/coconut-svsm/qemu/pull/23
>> [3] https://ipads.se.sjtu.edu.cn/_media/publications/sgxmigration-dsn17.=
pdf
>> [4] https://github.com/RustCrypto/AEADs/blob/master/aes-gcm/src/lib.rs
>> [5] https://github.com/nihalpasham/static-dh-ecdh


--297c6857cdfa6cdfd1075799097aaee2830b456d71badee86cf22f254a0a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTttfbGRG1oLZIHv/k0m7mftWU3lAUCaG0h/gAKCRA0m7mftWU3
lBk4AQCsedwLXcPuC2izAcZ8orhRC6hlnyO0JuPZoz1cgnNjbAD/X78DKVF6/TNi
zHrQQKqrEq+/qsv7xIquDBybyf3B4Qo=
=3dd4
-----END PGP SIGNATURE-----

--297c6857cdfa6cdfd1075799097aaee2830b456d71badee86cf22f254a0a--
