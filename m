Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89FD3914E9
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155135; cv=none; b=O7j3sYWdod1jH1JHn7+F5h9uEWT2WIcqJz780pqm/4abjU1LSY7oHmN8iCPiKSxKfRkrX+1wIiwgfnt/PKB4/+dF3BZ1cXMJ66ue9I/uXRZgdhcG+bkIfVfqxFxfavNcYigTpHo4Wnexr1i9GjnAblklJLcY4RLZ4fvjWb0kIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155135; c=relaxed/simple;
	bh=WUZIE2ec+szUqR/8G9DNOzErheWcmo9V4I91LI5L9G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jf+ZF1VsDgOrmp9x5jY9r632lJ6jHtsGmPToqutTdT4s0jZcv1yEki7UcPvo21OLqbWd+MLcwfLnbC8PoAgf8uhWcTjl/HY4LHu6w8Qon3VR7VDZnO9XVWNgoICdoNlPrailiHO993xlkVYjNyOv7obYR3LN63FOPkvNld9lr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=mtdD7MDE; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mtdD7MDE"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5095D1C2722;
	Tue, 14 Apr 2026 10:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776155132;
	bh=WUZIE2ec+szUqR/8G9DNOzErheWcmo9V4I91LI5L9G8=;
	h=Date:From:To:Cc:Subject:From;
	b=mtdD7MDElab/1PTusg+eOHV+Ufj0G2UBLjA4kB8iQ78mUEWICEmWTUCQ/ifnPIM61
	 6SzG6XwyMD7UJCzx+FgTZAyCobvutgQGExDv3oHst1Kv9crnIHAn4B5EuucBtLOKyE
	 9oNwUJCUGhbwB8bF+SrC5PvsBtdSzYmwGNLWshcLfMlTlN5eme5Kf8xRXZsrrbS89U
	 3MwvJ3m3+p4eR7ztrMwCvNpW0UJKzJ6ulnOGw3OrZEflzplcHPMKbuDSBaLphsbztF
	 SrPQDyyEM7IRjuGHZoppXos3uXEdi9kPgyXFDRboK5Z3Mabli1BA5u2wkwqROGGiEa
	 X1Q8AASE0z8Rg==
Date: Tue, 14 Apr 2026 10:25:31 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: SVSM Observability and Configuration Protocol draft
Message-ID: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi all,

This is long overdue, but I finally put out a draft of the proposed SVSM
protocol for observability and configuration for review and discussion here:

	https://github.com/joergroedel/svsm-specs/blob/main/SVSM_Observability_and_Configuration_Protocol.md

Please reply with your feedback to this email or post PRs against the
repository on GitHub, so we can have the discussion on the PR. The document is
also included inline below.

I will eventually move the repo to the COCONUT-SVSM org, but for now it is
experimental enough to better stay in my personal area.

Thanks,

	Joerg

----

# **[DRAFT]** SVSM Observability and Configuration Protocol

The SVSM Observability and Configuration Protocol (OCP) is a new sub-protocol
of the SVSM specification and uses protocol ID value 5. The initial version of
the OCP is 1. Versioning is strictly additive, i.e., all calls present in a
protocol version must also be present in any later version.

The following enumerates the set of calls supported by version 1 of the OCP:

| Call ID | First version supported | Name | Function |
|--------:|------------------------:|------|----------|
| 0 | 1 | `SVSM_OCP_LIST` | Query a list of supported observability and configuration sources. |
| 1 | 1 | `SVSM_OCP_READ` | Read data from an observability source. |
| 2 | 1 | `SVSM_OCP_WRITE` | Write data to a configuration source. |

## SVSM_OCP_LIST Call

The call is used to query a list or sub-list of observability and configuration
sources of the SVSM. The SVSM maintains a list of these sources in an array and
specific sources are addressed via their index into that array. Any array index
is stable during the runtime of the SVSM, only new sources can be added, but no
sources can be removed.

### Registers

| Register | Size (Bytes) | Alignment | In/Out | Description                            |
|----------|-------------:|----------:|:------:|----------------------------------------|
| `RAX`    | 4            |           | OUT    | Result value                           |
| `RCX`    | 4            |           | IN     | First index to return from the array   |
| `RCX`    | 4            |           | OUT    | Number of array entries returned       |
| `RDX`    | 8            |         8 | IN     | GPA of a buffer to store array entries |
| `R8`     | 4            |           | IN     | Number of array entries to return      |

The `SVSM_OCP_LIST` queries a subset of the sources array. The first index to
be returned is passed via the `RCX` register. The `RDX` register points to a
GPA where the SVSM will store the array of entries. The `R8` register
specifies a maximum number of array entries to return.

The number of entries returned by this call is stored in the `RCX` register. If
the returned value is less than the value of `RCX` passed in, then the end of
the array has been reached.

### Source entry layout

One entry in the array is 128 bytes in size and uses the following layout:

| Offset | Size (Bytes) | Description                         |
|-------:|-------------:|-------------------------------------|
| `0x00` | 4            | Flags                               |
| `0x04` | 124          | Name of the source encoded as UTF-8 |

The Flags stored in each entry are a bit field stored in little-endian byte
order. The defined flags are:

| Bit(s) | Name           | Description                                    |
|-------:|----------------|------------------------------------------------|
| 0      | `WRITEABLE`    | The source supports the `SVSM_OCP_WRITE` call. |
| 31:1   | Reserved – MBZ | All other bits are reserved and must be zero.  |

## SVSM_OCP_READ Call

This call reads data from a single observability or configuration source.

### Registers

| Register | Size (Bytes) | Alignment | In/Out | Description                                                                       |
|----------|-------------:|----------:|:------:|-----------------------------------------------------------------------------------|
| `RAX`    | 4            |           | OUT    | Result value                                                                      | 
| `RCX`    | 4            |           | IN     | Array index of the source to read from                                            |
| `RDX`    | 8            | 8         | IN     | GPA of buffer to copy data into                                                   |
| `R8`     | 4            |           | IN     | Number of bytes to read                                                           |
| `R8`     | 4            |           | OUT    | Number of bytes copied. If less than requested then end of data has been reached. |
| `R9`     | 4            |           | IN     | Byte offset into data to start read from                                          |

The `SVSM_OCP_READ` call will copy the requested amount of bytes specified in
`R8` from a source into a GPA provided by the caller in `RDX`. Reading starts
at the offset specified in `R9`.

If the specified source index in `RCX` does not exist, the call will return
`SVSM_ERR_INVALID_PARAMETER`.

## SVSM_OCP_WRITE Call

This call will attempt to write data into a specified observability or
configuration source.

### Registers

| Register | Size (Bytes) | Alignment | In/Out | Description                                        |
|----------|-------------:|----------:|:------:|----------------------------------------------------|
| `RAX`    | 4            |           | OUT    | Result value                                       |
| `RCX`    | 4            |           | IN     | Array index of the source to write to              |
| `RDX`    | 8            | 8         | IN     | GPA of buffer with data to write                   |
| `R8 `    | 4            |           | IN     | Number of bytes to write                           |
| `R8`     | 4            |           | OUT    | Number of bytes written                            |
| `R9`     | 4            |           | IN     | Byte offset into data to start the write operation |

The `SVSM_OCP_WRITE` call attempts to write data from the GPA specified in
`RDX` to the observability or configuration source specified in `RCX`. The size
of the data to write is specified in `R8` and the offset to write the data to
in `R9`.

Sources can only be written to if the Flags field in the `SVSM_OCP_LIST` call
has the `WRITEABLE` bit set. If the source is not writable the call will return
`SVSM_ERR_INVALID_PARAMETER`.

The format of the data allowed to write is source dependent. If a given data
format is not understood by the source the call will also return
`SVSM_ERR_INVALID_PARAMETER`.

