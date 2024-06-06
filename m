Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6FA591C0BB6
 for <svsm-devel@coconut-svsm.dev>; Thu,  6 Jun 2024 21:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fe/diOsHVk/oqeir70SPxgQ8k44Q0PFye9GSeDY6D7E=;
 b=VyIyNWw+EWXXTC2V0KBwOgvz0kAkmsQ/2bNHHEUFrIIznfz8mxZrEJKZzPnmGLxehcpri//HPvxBgKnA7s1E7fr6I0KBZfd6gIveG9p67UQhT9/H5v/zUb2BdOTxUD3t8BCyXPSPIVQkLDh4xSgsdSfA1KmNNPVFRpaDjy8gj4U=
Message-ID: <f00f2767-c113-0953-9869-c9696da677f0@amd.com>
Date: Thu, 6 Jun 2024 14:15:38 -0500
From: Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
 <965015dce3c76bb8724839d50c5dea4e4b5d598f.1717600736.git.thomas.lendacky@amd.com>
Content-Language: en-US
In-Reply-To: <965015dce3c76bb8724839d50c5dea4e4b5d598f.1717600736.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v5 12/13] x86/sev: Extend the config-fs
 attestation support for an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 6/5/24 10:18, Tom Lendacky wrote:
> When an SVSM is present, the guest can also request attestation reports
> from the SVSM. These SVSM attestation reports can be used to attest the
> SVSM and any services running within the SVSM.
> 
> Extend the config-fs attestation support to allow for an SVSM attestation
> report. This involves creating four (4) new config-fs attributes:
> 
>    - 'service-provider' (input)
>      This attribute is used to determine whether the attestation request
>      should be sent to the specified service provider or to the SEV
>      firmware. The SVSM service provider is represented by the value
>      'svsm'.
> 
>    - 'service_guid' (input)
>      Used for requesting the attestation of a single service within the
>      service provider. A null GUID implies that the SVSM_ATTEST_SERVICES
>      call should be used to request the attestation report. A non-null
>      GUID implies that the SVSM_ATTEST_SINGLE_SERVICE call should be used.
> 
>    - 'service_manifest_version' (input)
>      Used with the SVSM_ATTEST_SINGLE_SERVICE call, the service version
>      represents a specific service manifest version be used for the
>      attestation report.
> 
>    - 'manifestblob' (output)
>      Used to return the service manifest associated with the attestation
>      report.
> 
> Only display these new attributes when running under an SVSM.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>   Documentation/ABI/testing/configfs-tsm  |  63 +++++++++
>   arch/x86/include/asm/sev.h              |  31 ++++-
>   arch/x86/kernel/sev.c                   |  50 +++++++
>   drivers/virt/coco/sev-guest/sev-guest.c | 178 ++++++++++++++++++++++++
>   drivers/virt/coco/tsm.c                 |  93 ++++++++++++-
>   include/linux/tsm.h                     |  19 +++
>   6 files changed, 431 insertions(+), 3 deletions(-)
> 

Here's a small change to provide better error detail that you can squash
into this patch if that's ok.

Thanks,
Tom

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 655865164705..e32ac31e0630 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -886,7 +886,8 @@ static int sev_svsm_report_new(struct tsm_report *report, void *data)
  
  			return -EINVAL;
  		default:
-			pr_err_ratelimited("SVSM attestation request failed (%#x)\n", ret);
+			pr_err_ratelimited("SVSM attestation request failed (%d / 0x%llx)\n",
+					   ret, call.rax_out);
  			return -EINVAL;
  		}
  	}
