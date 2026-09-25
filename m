Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984222D8385
	for <coconut-svsm@lists.linux.dev>; Fri, 25 Sep 2026 01:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790300338; cv=pass; b=lEhv0T5eXuEXB34qvwYm/NhZ4n1hzDXB0zvOMgDx5TqC2xh97zalbUfblDEOgb9RbFT2OrVseCakgS/Lcuc5Ozq2dRSuoWS0hMjAY+bKLPD7HkbtOr/PZj5i/fhJLzLw6nHgEn8/+U8k6SMrvfbmeupoOuNtdCKLQ/G4p95d+zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790300338; c=relaxed/simple;
	bh=/ZrmoWequiGK82Wb8t7nR0yvOs84eLbzNyfP4DTlzVc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FEbsvbDsckohQgABx3j1PWF7eDLQP4FkLpsDgSH6bc5Hh1PtZbIF7xebhUU4aQBG0ouKLfoQBPLCvs4m3P5LBOXHoczQWfxVLfuyp1aYGUKVE83Yjn8uHyMiQBkaApfaZyp84llWFO151Tw3aTzAODNjEZ3YQa8jLBVy3Fj64eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EAG4B2yt; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EAG4B2yt"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so3570a12.1
        for <coconut-svsm@lists.linux.dev>; Thu, 24 Sep 2026 18:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790300335; cv=none;
        d=google.com; s=arc-20260327;
        b=AL2XIznPIVLs+yvhTSOj4ugZSlHQSifCQZ7tsTpfLjLOKuYyfPogu/8+RmPiS0Rjbe
         WNtw9+1pOo2oQfgk807/XUpkX3FpAzJuZ0oX2iUcFyn7MXdhOAWEwaRN4ZOYEoPjkl9i
         ZCecOSIYMhyRfWWCJF+Ev9Q+oVAEqagnn4FFSJe4OlBI0Oea317Hl6kqvNS+JmlQ6Hui
         U/c7Nd2Rejjh89gCKUuQdoX2kH7Z3Je93nFIUEg5sz0wFk4tx/VFgnZbtuETcwTyBkpS
         Ui+t3nGRbg6egz8X47BEaXDbVnNoimwn2PJS4nxahi234tRs02C5YdYgHWfafLME1QnO
         vXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XefgVIKb8auowEUktRLBt23esUfdHgzHeehxIsAPR4g=;
        fh=+fC3vhhzGlOtos9P46wVmBGs1abwrwBw38RYpiGu5iA=;
        b=Os7ncVu7+jsQGWxvz1RVnlH3jT6EWRuPNq+NusfSyPeOtj582IWUmwN5Xv+C4MExfL
         gYbF9OBZdGpdSSKbYbl9c3NCYxjEUh5MtW761s/wU8bc0cwg0oTnhYlK11R2Jl5DqRO6
         VhD9pPM0K4jlsfjc/0QLpnE2Xof6h6L0RJ1GlS3Wm3nRoSqBJwXdpVZjjXuM0Cux4mPt
         NoU7EKr3sYJszmuX2sC4oBZe/y11FBTHaO4O6XA5VDiv8oWuSUxnmL1Q6xmt/g23Ac4M
         iLpb7fPNQssmW23cZduIGP7ITNnINyAWSpdiRtLzgnNn9p2oM2fep1t8r2RyGC3ETnIs
         5R6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790300335; x=1790905135; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XefgVIKb8auowEUktRLBt23esUfdHgzHeehxIsAPR4g=;
        b=EAG4B2ytpekavkXIcsqBlk7rB682hicDVi5mRTt8/jeBFZX37z9dI+bz8LJiH6MeWs
         C4vaDI2N8aK629mi5xpCM1M32mTQkClNEH7vBsD2H46KdzQYVHOCnrThgNljxyE8BGlq
         a56eQagTlhoyIQY6Kva+KN+2aeVKGLlK1n+JlG0j6gSHBZOcp97u+/xHWqlM/c2HHERV
         7J5dxal+VmAwu82U7pdHopdetZv14f8qGxYRzfqZhqZM981KY6B5Tjs1llAVu+y6D2fM
         sXxgBriyjRfAPnUxLAyFwtQrQfaHlLLP9mmEcyVVPriUqRbCAzIWi/2c+VHU7J2Uegak
         j6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790300335; x=1790905135;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XefgVIKb8auowEUktRLBt23esUfdHgzHeehxIsAPR4g=;
        b=Ttkk9JUjnWJ8GtA2KmJdca35MvlH+ySAilR2jNsM+EPzBmGWyMEj7Ycoc1NdK1akzI
         cSOZPdLebkdQsSqeskkh/R+AJ8bhb8OUF0I6rajE7qyweqLLgubhKQ24suG5PH/DYB0r
         T0RW0baClhxrTW36+UTX6pCE5lJkuz6Jpn67Qazyle+02Epk/hb5MqQslT04SMNkbLk9
         mHzUc0QvF6CMbTAgtKYfzQI02qBEhELQYfdH3jlQq4b9ROrHQiLyRa+11f0//zUfo6aw
         esWiuQGFcP4Hub5peEKePx1CuHV8q6jkAv+5Ljb0r+6jH8iBpRZemErc43ou54Aq0w/v
         3yNg==
X-Gm-Message-State: AFuF++kY3yDVQV2f0E1oHB9MfWCCbB3Ru8Co3zSraCZLDxa1lJcZ8LZ3
	eSUKHRvg2YNAm8hUfc3ot3isW7/t8AggR04Dh3V56wyOAZELqBgBRLzOOvbjXZbJn0ty2JTtebF
	bZHNeGSli68cAxt6ITrZjqDphulqA9QMaxRmeqya6Qu/3PuCw71Pbbsfbbg4=
X-Gm-Gg: AYBFou2t5xyUO7OEjuHofO4ePyT2POR3QT5K08U4P+ww0p/ViQnOiPfJdA++9ASb5cY
	NbQFJXX0FI3TK7MbmkCXOH5DWXO8rGs1XU1SqEEhAH7u4dq59V33b9Rp24vhzjZxGSP4Wgzf5gD
	3KOEDa69igfJlGwADDWvXYLnqTsxB4U7TAkxCHtyhMr6QzvtrZZ/I+z5kWVlo3Iq4oJNeqwTpEv
	JYQlAvXooN9TCi9Jl13voPIaqyDuTR729RZ86MFUPqd8iR9TGqTiAzrRmDqBjua0sx8tPeJ6I0I
	WFvZKGfG4OmRTdtWLmgoa7rXsmfFoMawqLHyYq3+azEoG+JBoV2LGe/IFI3d6rN2AcsfofUV2C6
	txB1oTGTIdjhQKwd+FD1FHA==
X-Received: by 2002:aa7:d0da:0:b0:6a6:9d10:f52b with SMTP id
 4fb4d7f45d1cf-6aae49dc0b8mr22055a12.12.1790300333944; Thu, 24 Sep 2026
 18:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jeff Andersen <jeffandersen@google.com>
Date: Thu, 24 Sep 2026 18:38:40 -0700
X-Gm-Features: AclHuK97t9v00dnOYeSvC_xGz5RFycgIxzG9GOaIuLovz35SCQnRDzyOuVtems0
Message-ID: <CADRsRuW1zJxk2+WxM2oQX1T_nq9O5SOoswhMQH+OsNvz9hUiHg@mail.gmail.com>
Subject: Inline attestation of vTPM-bound keys
To: coconut-svsm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a proposal for a TPM library command that would enable a vTPM
to directly attest
to keys it holds using an underlying iRoT. I think it could be useful in several
environments, including the SVSM vTPM. Would be interested in feedback
on the proposal.

The proposed command, tentatively called TPM2_AttestCreation, would be
identical to
TPM2_CertifyCreation except that instead of taking a key handle and returning a
TPMT_SIGNATURE, it would take in a vendor-defined buffer (for signer
parameters) and
return a vendor-defined buffer (holding the signed attestation).

Specific details as it relates to an SVSM vTPM:

- The request buffer could include a boolean flag indicating whether
certificate data
  should be returned. This provides parity with the existing
SVSM_ATTEST_SERVICES command,
  which allows the caller to optionally pass a buffer for returning
certificate data.

- The return buffer would include the following pieces of data:
  - The Services Manifest.
  - The GUID of the vTPM service.
  - A platform-specific attestation tying the above two pieces of data
to a TPMS_ATTEST
    structure (which is returned by the vTPM in a separate parameter).
    - On AMD, this would be a SEV-SNP report whose REPORT_DATA would
be a SHA-512 digest
      of (Services Manifest || Service GUID || TPMS_ATTEST)
  - The certificate data, if requested.

Freshness would be supplied by TPM-native mechanisms:

- outsideInfo, proving that the key was not created before the value
was generated
- qualifyingData, proving that the attestation itself was not created
before the value
  was generated.

This mechanism would allow callers to attest to any TPM key, not just
a pre-determined
EK. Callers that are interested in a PQC key can get the TPM to make
one, without the
SVSM project having to pre-determine which TPM keys may be attested via SEV-SNP.

Including the Services Manifest in the attestation is motivated by the
following:

- If there are pieces of data that other services expose via the
manifest that a user is
  interested in attesting, they can do this in one shot via
TPM2_AttestCreation, instead
  of having to issue a separate SVSM_ATTEST_SERVICES call.
- In a hypothetical future where some SVSM services are loaded externally, whose
  measurements are not captured in LAUNCH_MEASUREMENT, the Services
Manifest may be a
  useful mechanism for conveying those measurements.

Including the vTPM's service GUID in the attestation is motivated by
the following:

This work is essentially introducing a new flavor of attestation to
SVSM. Instead of an
externally-triggered attestation that covers one or more service
manifests, here we would
have services internally requesting their own attestations over
service-supplied data.

SVSM services may not all be equally trustworthy. Perhaps some
services are closed-source,
or potentially encrypted, or run at different privilege levels. Remote
verifiers would
want evidence that a given TPM2_AttestCreation response was emitted
from the vTPM service,
and not some other less-trusted SVSM service that can produce SEV-SNP reports.

So to support TPM2_AttestCreation in a generic fashion, the SVSM
kernel could expose an
interface to SVSM services which accepts service-provided data for
inclusion in an
attestation. To enforce privilege separation, the SVSM kernel could prefix the
service-provided data with the service's GUID (and potentially the
Services Manifest as
discussed above) before generating the attestation via the underlying platform.

Interested in the group's thoughts.

Thanks,

--Jeff Andersen
