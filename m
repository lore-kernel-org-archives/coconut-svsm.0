Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D53241670
	for <coconut-svsm@lists.linux.dev>; Tue, 27 May 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356560; cv=none; b=CKjFt8bdR6QOQZo34Xlbz5ySy76A9sK+sTnecr4OkVjAzBz1pQGfBQo4lDjoOuRnUu6RO8/8eQpZX4xShqviCb+8la5+sBfrFT/RsEex/ER4yAzi598DupJAuwZhx1P2hPuIz8kIjZ9os1gn2wn4wiHluBSNC748DUPbzcgCsGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356560; c=relaxed/simple;
	bh=i7qGULmVcX3ErU2slnsBd+xiTRCRyd1S8najDtWRyho=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZZWEo5OfOMfMDu0NDcIUopgNibqSWJfDdhNzypoUzKBFf/ms6jkFZPglEENceItkVVkDhSBR4GApnsglcqK4hybTFQbDQmy4nBo0eDVTkct+bKGBBVUukqSOYtInfVaCw+LWVrp8Vma7e3NCJ8bGxgTrAPyKH8e/H8P4dy1sx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KioEiPqG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KioEiPqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748356556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=BLcn068ghTSUGpYTCtJbNdOw0C2E0jiNYrNYtTLlS00=;
	b=KioEiPqG6wlmtcLO+02AfW3JNaS2nRPXursHu2DRptL9p9PeJKy46dUM/8hWTVgYX7/cVy
	jymI9QMTwxCOrKqV8EcA7cOq4j96akvG15qnw62JCV9jAQztC8ochjbNI+UZajmrId+ST0
	hq0psGu11cHuWdIWXnPkWCb8+DIw16I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-vUuvCHL-NAielU76kqjtDA-1; Tue,
 27 May 2025 10:35:54 -0400
X-MC-Unique: vUuvCHL-NAielU76kqjtDA-1
X-Mimecast-MFC-AGG-ID: vUuvCHL-NAielU76kqjtDA_1748356553
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3611419560B5
	for <coconut-svsm@lists.linux.dev>; Tue, 27 May 2025 14:35:53 +0000 (UTC)
Received: from dobby.home.kraxel.org (unknown [10.45.226.108])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D6F7819560AB
	for <coconut-svsm@lists.linux.dev>; Tue, 27 May 2025 14:35:52 +0000 (UTC)
Received: by dobby.home.kraxel.org (Postfix, from userid 1000)
	id 2383844FBA2; Tue, 27 May 2025 16:35:50 +0200 (CEST)
Date: Tue, 27 May 2025 16:35:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: coconut-svsm@lists.linux.dev
Subject: uefi mm protocol draft
Message-ID: <36kigg632bsfruhx2cuxca3wzhygxc5x6wenzkxy4xe3txgsyi@lb7lb4xvikgs>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cuXEhdaDbG8RKPh_mk-UR_jH-S19T6SUEcTlM8ZRdV8_1748356553
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi folks,

Here is a spec draft for the uefi mm protocol.
See also https://github.com/coconut-svsm/svsm/pull/694

take care,
  Gerd

------------------------------- cut here --------------------------

## SVSM UEFI MM PROTOCOL

Process MM communication requests from edk2 firmware.

Usually this request serialization format is used by edk2 for
communication between normal mode and management mode (MM for short).

This SVSM protocol is a thin wrapper to allow edk2 firmware send those
requests to the SVSM instead.  This allows the SVSM provide services
which are usually running in SMM mode on bare metal or
non-confidential VMs, specifically an UEFI variable store.

### protocol number

```
pub const SVSM_UEFI_MM_PROTOCOL: u32 = 4;
```
preliminary, not yet officially assigned

### query command

```
const SVSM_UEFI_MM_QUERY: u32 = 1;
```

Returns success in case the protocol is supported by the svsm.

Return parameters:

 * RCX: protocol feature flags.  There are no features defined yet.
   All bits are reserved and must be zero.

### setup command

```
const SVSM_UEFI_MM_SETUP: u32 = 2;
```

Setup buffer for messages.

Parameters:
 * RCX: buffer address (guest physical).
 * RDX: buffer size

### reset command

```
const SVSM_UEFI_MM_RESET: u32 = 3;
```

Reset protocol (communication buffer).

### request command

```
const SVSM_UEFI_MM_REQUEST: u32 = 4;
```

Process request in the communication buffer, store response message in
the buffer.

### request format

The request serialization format is specified by edk2, the short
overview below is purely informational.

The buffer starts with this header:

```
// EFI_MM_COMMUNICATE_HEADER
#[repr(C, packed)]
pub struct MmCoreHeader {
    pub guid: [u8; 16],
    pub size: u64,
}
```

The `guid` specifies the receiver of the message (typically an efi
protocol guid or an efi event guid), and therefore also the format of
the request data following this header.  The `size` field specified
the size of the request data (excluding the header).

### edk2 references

 * MdePkg/Include/Protocol/MmCommunication.h
 * MdeModulePkg/Include/Guid/SmmVariableCommon.h
 * MdeModulePkg/Include/Guid/VarCheckPolicyMmi.h

### linux refernces

The linux kernel has an efi variable driver implementation using this
request format in `drivers/firmware/efi/stmm`.  It sends those
requests to the edk2 MM code running in arm secure partition.

