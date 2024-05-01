Return-Path: <jacobhxu@google.com>
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 965C61CA29D
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 May 2024 01:57:44 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ec76185c0fso40255ad.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 01 May 2024 16:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1714607863; x=1715212663; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3N9K9XYaKMGZdcDbk8zOnlfG31gz7F53PkNSPj7AWg=;
 b=qjRb5zQDTP56ubb6GACLWzb0llJckPZ1vQDbnrNHX/ibmVZptE7NhrV60I2BzLp5Py
 1uvJrMuTKUIaBxui4sHS4g4mN0U647lBbI2x0VC1klRmeFdYSihfflCPPa0cnrD2ZdXK
 63OREwwbkzUQyr/T0nvnO+utGjURj691LOtij436AKB7IqZuaZSWNr0ExHZoKgXu4gXx
 rorELcsBmGVsWgjKENFTtl3Bcp4eaoxD0oopNwBbozOKh7dVzqlJKeqecP9fVdj9mJOB
 2IDkkiT2hmFKbT36Mmo9W5Uyygtkv7h1hTZPSfT+5UXj2RQeJAaXhu15mr1j76Y5CGql
 2nMQ==
MIME-Version: 1.0
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
From: Jacob Xu <jacobhxu@google.com>
Date: Wed, 1 May 2024 16:57:31 -0700
Message-ID: <CAJ5mJ6gEd4SXtbhRhBowqVNgqqDspvtSC-NLPzNcoE=xHkZ6YQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] [PATCH v4 10/15] virt: sev-guest: Choose the VMPCK
 key based on executing VMPL
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Dan Williams <dan.j.williams@intel.com>

General question on VMPCKs: the secrets page defines them listed all
together one at a time, does that mean any guest at any VMPL can
observe all the VMPCKs? Or is SVSM running at VMPL0 supposed to clear
VMPCK0 before it hands off control to edk2?


On Wed, Apr 24, 2024 at 8:59=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> Currently, the sev-guest driver uses the vmpck-0 key by default. When an
> SVSM is present the kernel is running at a VMPL other than 0 and the
> vmpck-0 key is no longer available. If a specific vmpck key has not be
> requested by the user via the vmpck_id module parameter, choose the vmpck
> key based on the active VMPL level.
>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/include/asm/sev.h              |  2 ++
>  arch/x86/kernel/sev.c                   |  6 ++++++
>  drivers/virt/coco/sev-guest/sev-guest.c | 10 +++++++---
>  3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index a7312b936d16..64fcadd6d602 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -307,6 +307,7 @@ u64 snp_get_unsupported_features(u64 status);
>  u64 sev_get_status(void);
>  void sev_show_status(void);
>  void snp_remap_svsm_ca(void);
> +int snp_get_vmpl(void);
>  #else
>  static inline void sev_es_ist_enter(struct pt_regs *regs) { }
>  static inline void sev_es_ist_exit(void) { }
> @@ -337,6 +338,7 @@ static inline u64 snp_get_unsupported_features(u64 st=
atus) { return 0; }
>  static inline u64 sev_get_status(void) { return 0; }
>  static inline void sev_show_status(void) { }
>  static inline void snp_remap_svsm_ca(void) { }
> +static inline int snp_get_vmpl(void) { return 0; }
>  #endif
>
>  #ifdef CONFIG_KVM_AMD_SEV
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 8edf7362136b..75f11da867a3 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -2454,6 +2454,12 @@ int snp_issue_guest_request(u64 exit_code, struct =
snp_req_data *input, struct sn
>  }
>  EXPORT_SYMBOL_GPL(snp_issue_guest_request);
>
> +int snp_get_vmpl(void)
> +{
> +       return vmpl;
> +}
> +EXPORT_SYMBOL_GPL(snp_get_vmpl);
> +
>  static struct platform_device sev_guest_device =3D {
>         .name           =3D "sev-guest",
>         .id             =3D -1,
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/=
sev-guest/sev-guest.c
> index 04a7bd1e4314..e7dd7df86427 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -2,7 +2,7 @@
>  /*
>   * AMD Secure Encrypted Virtualization (SEV) guest driver interface
>   *
> - * Copyright (C) 2021 Advanced Micro Devices, Inc.
> + * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
>   *
>   * Author: Brijesh Singh <brijesh.singh@amd.com>
>   */
> @@ -70,8 +70,8 @@ struct snp_guest_dev {
>         u8 *vmpck;
>  };
>
> -static u32 vmpck_id;
> -module_param(vmpck_id, uint, 0444);
> +static int vmpck_id =3D -1;
> +module_param(vmpck_id, int, 0444);
>  MODULE_PARM_DESC(vmpck_id, "The VMPCK ID to use when communicating with =
the PSP.");
>
>  /* Mutex to serialize the shared buffer access and command handling. */
> @@ -923,6 +923,10 @@ static int __init sev_guest_probe(struct platform_de=
vice *pdev)
>         if (!snp_dev)
>                 goto e_unmap;
>
> +       /* Adjust the default VMPCK key based on the executing VMPL level=
 */
> +       if (vmpck_id =3D=3D -1)
> +               vmpck_id =3D snp_get_vmpl();
> +
>         ret =3D -EINVAL;
>         snp_dev->vmpck =3D get_vmpck(vmpck_id, layout, &snp_dev->os_area_=
msg_seqno);
>         if (!snp_dev->vmpck) {
> --
> 2.43.2
>
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
