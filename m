Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::609])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id ECD0D44615
 for <svsm-devel@coconut-svsm.dev>; Tue,  4 Mar 2025 19:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PLA7jwpotmNIp2iMnwAMtvFuWHaV0h9+lE2VySpDWM=;
 b=WeQcLDgTvmUqkNO97iZyNv9YzMAA6HZvcZi2Q206vnR7vTQVIJ8V4UHCkasqgHipen1uZVQT3TQGoI5ehTGJD+PmQyciBjmCFZGH+rrPLUd1fRgJxY5EofikcdL7lIPcWS59gzHv2LOmLTDQWdpBqHD82H5Kvl2udbeSOEnXEG0=
Message-ID: <72aa1388-4bd4-5444-8b5c-59c063a17cb5@amd.com>
Date: Tue, 4 Mar 2025 12:25:42 -0600
Content-Language: en-US
References: <CAGxU2F55-JDYqt62rg6HUVEZo4voHrsuPizYxv7mWO+PE0fM-w@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAGxU2F55-JDYqt62rg6HUVEZo4voHrsuPizYxv7mWO+PE0fM-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] SVSM_VTPM_CMD Call question
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>, James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>, svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

On 3/4/25 10:16, Stefano Garzarella wrote:
> Hi Tom, James,
> working on the SVSM side of the vTPM emulation, I'm a bit lost on `8.2 
> SVSM_VTPM_CMD Call` section.
> 
> In the SVSM code [1] we are assuming that the driver is always using a 
> PAGE_SIZE buffer for TPM_SEND_COMMAND request/response, but I can't find 
> anything in the spec apart from this:
> 
>    It is expected that the request/response structure is large
>    enough to hold the expected output of the vTPM request. The vTPM
>    request/response buffer will be treated as physically contiguous in
>    the guest address space.
> 
> IIUC from `Table 16: TPM_SEND_COMMAND Request Structure` the 3rd field 
> `TPM Command size (in bytes)` is just the amount of bytes filled with 
> the request.
> 
> How does SVSM know the total buffer size it can use for response?

It doesn't. It knows the GPA of where the response is supposed to go and
will write to that location. It was a while ago and I don't recall the
reasoning as to why it was decided to not include the response buffer
size on the request. It may have been related to the TPM code not using
an output length? Which may have been the reason for wording (above) in
the spec.

If it turns out to be a requirement for providing the output buffer
length, we can add a new vTPM protocol call, SVSM_VTPM_CMD_EX or such,
where RDX can hold the length of the request/response buffer.

Thanks,
Tom

> 
> Claudio mentioned that in an old discussion, we were thinking of adding 
> in the specification that the buffer should always be PAGE_SIZE. This 
> would explain the assumption we make in SVSM and also the driver that 
> always allocates a page.


> 
> If there are any changes already planned for the specification, 
> apologies in advance for my confusion.
> 
> Thanks,
> Stefano
> 
> [1] https://github.com/coconut-svsm/svsm/blob/376e4571099ee5e9aab8343c137600e97ebe1b4b/kernel/src/protocols/vtpm.rs#L67
> 
