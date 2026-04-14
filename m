Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B42C11DF
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156397; cv=none; b=rQcG5CpthTpKO9Q29bMSOw5hCU3fVfW49nRhKFDRdyaW5tet5wjUQOJ1OQC5+3HSodi8VTa74BTmA3Yr1UhNQWsg7YOSBtw3o8lfG1xbe2n7qR5Fk080GetN7hIvV5SSUEKB3uDBAE4efnmJhLB2C6FlaI+Q/Dcbi3ISl8lrbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156397; c=relaxed/simple;
	bh=c5xZuADxpVPYqfREJkqatLrKBEN1K3AgjZ9V/aXb6MU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i+4bsS3O0ucsaAfr4nwUH0RAutU3qEldjuypJOaGT95wZWI+nziZoChjO0UvhLT0m4PCVxmDkp8IY547pIzB3/KSZK3KSk12PqrUolc0206BcekY3m6K1S0k6++NfVi0rB5jflJoyx9u9LRIgfuyJ5RSTdXLMwKIZZBjHiWfmHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dc3u4bcy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k4W2BMzm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VF9RfJRF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5NZAWewM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dc3u4bcy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k4W2BMzm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VF9RfJRF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NZAWewM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1D5F6A807;
	Tue, 14 Apr 2026 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776156394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9l0jZz9ZkwJdOXozN495S72Kq1hmwYKiIL2XZ62OpzM=;
	b=dc3u4bcysX6Imxz3QfmKFMsYYJEuFIQRcim+CVL5SCdnqG7PldblcYU+S1vsqiPegRQBSL
	dl4lX8bTijgA4aIl2GuXdL9+Tu+X1SlGjIcODEtAk0J5d/XvLOcjPMYctKylXkjAXAUgzx
	37wgGPoem+rz+xe8fylafRFR8+FrFQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776156394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9l0jZz9ZkwJdOXozN495S72Kq1hmwYKiIL2XZ62OpzM=;
	b=k4W2BMzm3vh6DNwr4ZQr/xGzalSebkIjYcK42j3Udv2ygHC7ynwA+i3jEGdPkgDHARPimW
	xiFbUjtYkVLKjeAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VF9RfJRF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5NZAWewM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776156393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9l0jZz9ZkwJdOXozN495S72Kq1hmwYKiIL2XZ62OpzM=;
	b=VF9RfJRFdBZBcNU8lz/sldqQIZgch8dimmKzNPdJgpff3FOtlpq6lWjBzTlonGnZP02UBY
	suIk5Xkgk/SBgA79rzsXcuc7uPWKCPANBjcXQIEyZ7vGQ9AjQXDq6IufhmmthsqMyZDX/D
	9el9l2uc/GbUX1f3lxsLOXgyXj+VfD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776156393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9l0jZz9ZkwJdOXozN495S72Kq1hmwYKiIL2XZ62OpzM=;
	b=5NZAWewMTb1PHtx/cmY24Um397u5j9HiwvnYJyjXVBhrBCb/gGBFHoACB0dZPcYUikPJDx
	OtD5dtbpbbRpTcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A102D4B364;
	Tue, 14 Apr 2026 08:46:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6q8KJun+3WmfJAAAD6G6ig
	(envelope-from <nstange@suse.de>); Tue, 14 Apr 2026 08:46:33 +0000
From: Nicolai Stange <nstange@suse.de>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: SVSM Observability and Configuration Protocol draft
In-Reply-To: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
	(=?utf-8?Q?=22J=C3=B6rg_R=C3=B6del=22's?= message of "Tue, 14 Apr 2026
 10:25:31 +0200")
References: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
Date: Tue, 14 Apr 2026 10:46:33 +0200
Message-ID: <87mrz6lyja.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,8bytes.org:email,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: C1D5F6A807
X-Spam-Flag: NO
X-Spam-Score: -2.31
X-Spam-Level: 

Hi,

J=C3=B6rg R=C3=B6del <joro@8bytes.org> writes:

> ### Source entry layout
>
> One entry in the array is 128 bytes in size and uses the following layout:
>
> | Offset | Size (Bytes) | Description                         |
> |-------:|-------------:|-------------------------------------|
> | `0x00` | 4            | Flags                               |
> | `0x04` | 124          | Name of the source encoded as UTF-8 |

Just a generic comment: as in my understanding there's no central
authority managing the names, would it perhaps make sense to split the
Name from above into something like a 16 byte UUID + a human readable
name, the latter being only informative (or, alternatively, whose
semantics are defined only within the scope of the UUID)?


> The Flags stored in each entry are a bit field stored in little-endian by=
te
> order. The defined flags are:
>
> | Bit(s) | Name           | Description                                  =
  |
> |-------:|----------------|----------------------------------------------=
--|
> | 0      | `WRITEABLE`    | The source supports the `SVSM_OCP_WRITE` call=
. |
> | 31:1   | Reserved =E2=80=93 MBZ | All other bits are reserved and must =
be zero.  |
>

<snip>

>
> ## SVSM_OCP_WRITE Call
>
> This call will attempt to write data into a specified observability or
> configuration source.
>
> ### Registers
>
> | Register | Size (Bytes) | Alignment | In/Out | Description             =
                           |
> |----------|-------------:|----------:|:------:|-------------------------=
---------------------------|
> | `RAX`    | 4            |           | OUT    | Result value            =
                           |
> | `RCX`    | 4            |           | IN     | Array index of the sourc=
e to write to              |
> | `RDX`    | 8            | 8         | IN     | GPA of buffer with data =
to write                   |
> | `R8 `    | 4            |           | IN     | Number of bytes to write=
                           |
> | `R8`     | 4            |           | OUT    | Number of bytes written =
                           |
> | `R9`     | 4            |           | IN     | Byte offset into data to=
 start the write operation |
>
> The `SVSM_OCP_WRITE` call attempts to write data from the GPA specified in
> `RDX` to the observability or configuration source specified in `RCX`. Th=
e size
> of the data to write is specified in `R8` and the offset to write the dat=
a to
> in `R9`.
>
> Sources can only be written to if the Flags field in the `SVSM_OCP_LIST` =
call
> has the `WRITEABLE` bit set. If the source is not writable the call will =
return
> `SVSM_ERR_INVALID_PARAMETER`.
>
> The format of the data allowed to write is source dependent. If a given d=
ata
> format is not understood by the source the call will also return
> `SVSM_ERR_INVALID_PARAMETER`.

I assume other errors would be allowed as well? I'm thinking of a
situation where a "source/configuration" is backed by storage, and
writes to that could fail.

Thanks,

Nicolai

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
