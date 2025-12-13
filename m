Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A417FB67E;
	Sat, 13 Dec 2025 01:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765588286; cv=none; b=c6/qjggvBAgl/0pyUuTGJ35Juai5DphIA/C1JRDjfDgSvvoiQcDHq6iWR9Wj7LClKH1Xeja7VUH4RAFGDBmkC2TNG4haAXt0c04oSWiG+BGbkdDOwR0I4jcDPMaaO1dsjbYdfktD58wP+PXgjTSaIpCtkSerFfP2fAQtVKvjhMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765588286; c=relaxed/simple;
	bh=jQokn8SgidgQiUCFKEZCAAulRrVWtZ4oPYIOhoXfS50=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJFqQoc9qYJ09tMt0Ah/i0NfUNv5C7rJItMNPQ8n3fsULi7/5Tk8l8l9uSpyKbHMbgWjKFvj6ioq2+/ivP/ry1Ayr66A0Z6kszYEwbbtyabdBeK5B0AGHNKUX7Z9Cgbu2z+eOvA3MG850eP+9VQGWqXgITuw4pL9+duqSzTkzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Qt9sSyc+; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Qt9sSyc+"
Received: from 8bytes.org (fs98a57d9d.tkyc007.ap.nuro.jp [152.165.125.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A09F05D0F2;
	Sat, 13 Dec 2025 02:02:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1765587774;
	bh=jQokn8SgidgQiUCFKEZCAAulRrVWtZ4oPYIOhoXfS50=;
	h=Date:From:To:Subject:From;
	b=Qt9sSyc+NdHHEt8HcTolIU3Zg4myKsR22Xy3Vy9xpYfW6eVs02jSTxFA4HaYDHJ+4
	 ii5GRP/mjL4Jb8hCYp87LP4M71FSgsjaMR73HowNBG0PgfBV7E5lBpU+RyzqD1laJ8
	 2menaKZUhuZ1+yqICF4XiH08LhiCAyV0HSVtclyY/DWkdrf6zE2eU/TVW1WwV9LFa/
	 mgu0/TWkXNnZG8RNFaSZBfHHm5iyFZfpIzMFh4/zl/0cNQ/TvJq8ayU82ZIB1Z5dSb
	 sguoHzMT8beUOsPcgYCACQnCnoTiiPz8Q1D9QcmIEOeK1rFqOL98mc6srLjGd+UAch
	 wdroeTQaHNrHg==
Date: Sat, 13 Dec 2025 10:02:48 +0900
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Reminder: COCONUT-SVSM BoF at LPC on Sat, 3pm
Message-ID: <re35ychgmsqqtbrthnnfxrgve6xknqw5e6knw4hnjucwt2jvrn@2w6eawtzhafn>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

Here is a quick reminder that we will have a BoF session for COCONUT-SVSM today
at the Linux Plumbers Conference in Tokyo. The BoF is scheduled on Main Hall B
at 3pm Japan timezone. This is Friday, 10pm PST (US west coast), Saturday 1am
ET (US East Coast), and Saturday 7am MET (Europe).

Thanks to the fantastic organizers the session is in an AV-capable room, so you
can join it via BBB. At the given time, go to

	https://meet.lpc.events/

and click the 'Join Session' button on the COCONUT-SVSM BoF session. Right now
there is no Live stream of the room, but that might change. So if you are not
registered for LPC virtual attendance it is worth checking out

	https://www.youtube.com/@LinuxPlumbersConference

for a live stream of Main Hall B. I will also check on our COCONUT Matrix chat
room for remote feedback and questions on the session.

Hope to see you all there.

Regards,

	Joerg
