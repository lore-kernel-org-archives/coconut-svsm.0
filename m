Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE443F1659
	for <coconut-svsm@lists.linux.dev>; Thu, 11 Jun 2026 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182556; cv=none; b=g4+VzdoN6+7XIBevuuBJo9ua3xKSfX6Jr4ob96ujpZY9oQwWrwtwIsFRH3WzUlylKtSXApluc+Fh+SJbQFYkYqaORSkDJald38PW0qFctarwMj38estDEnqboTKXVVztyx2ENh1JQ468PsPiY99qDs1oLsv1t3tMJ3NZmjVPQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182556; c=relaxed/simple;
	bh=ByuFBIExti8ecvM/s7TWz1wApNpf4LbNpzyI46l0cHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejZ9CcEJAIbGqQBuVduwB3gCJuWVs/JlVtM//RINknwVwWL6V8wRo4SOD9TaNbMfXd+B7e5vz6pqUbCLC0Y1yXRPOV5XBe8phvXGmwJln4QaFmSnp4TKv/JbK0cv8TpjH8Eh5iNT4c92YdwC224830m0U5bFC842QEBRE/N//DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A1C921C0F1F;
	Thu, 11 Jun 2026 14:55:52 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Ani Sinha <anisinha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	coconut-svsm@lists.linux.dev,
	Roy Hopkins <roy.hopkins@suse.com>,
	Vaishali Thakkar <vaishali.thakkar@suse.com>,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 1/1] sev: Provide VMSA to kvm via KVM_SEV_SNP_LAUNCH_UPDATE
Date: Thu, 11 Jun 2026 14:55:43 +0200
Message-ID: <20260611125543.573835-2-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611125543.573835-1-joro@8bytes.org>
References: <20260611125543.573835-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roy Hopkins <roy.hopkins@suse.com>

Previously the VMSA could not be set directly. Instead the current CPU state
was automatically populated into a VMSA within kvm as part of
KVM_SEV_SNP_LAUNCH_FINISH. This meant that it was hard to ensure the VMSA
provided by IGVM matched the resulting one in kvm.

KVM has been updated to allow the VMSA to be provided via
KVM_SEV_SNP_LAUNCH_UPDATE. In this case, kvm does not perform any specific
synchronisation during FINISH and the VMSA is guaranteed to match that provided
by QEMU.

Signed-off-by: Roy Hopkins <roy.hopkins@suse.com>
Co-developed-by: Vaishali Thakkar <vaishali.thakkar@suse.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 backends/igvm.c                | 44 ++++++++++++++++++++++++++++++++--
 include/system/igvm-internal.h |  1 +
 target/i386/sev.c              | 10 +++++++-
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/backends/igvm.c b/backends/igvm.c
index c347d0c17e..07e6db69e2 100644
--- a/backends/igvm.c
+++ b/backends/igvm.c
@@ -425,6 +425,8 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
     const IGVM_VHS_VP_CONTEXT *vp_context =
         (const IGVM_VHS_VP_CONTEXT *)header_data;
     IgvmHandle data_handle;
+    uint32_t data_size;
+    uint8_t *region;
     uint8_t *data;
     int result;
 
@@ -432,6 +434,16 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
         return 0;
     }
 
+    /*
+     * Complete any other page processing first to ensure measurements
+     * are correct.
+     */
+    if (ctx->machine_state->cgs) {
+        if (qigvm_process_mem_page(ctx, NULL, errp)) {
+            return -1;
+        }
+    }
+
     data_handle = igvm_get_header_data(ctx->file, IGVM_HEADER_SECTION_DIRECTIVE,
                                        ctx->current_header_index);
     if (data_handle < 0) {
@@ -440,6 +452,21 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
         return -1;
     }
 
+    data_size = igvm_get_buffer_size(ctx->file, data_handle);
+    if (data_size != IGVM_PAGE_SIZE_4K) {
+        error_setg(errp, "IGVM: VP context data size %u not equal to page size",
+                   data_size);
+        result = -1;
+        goto exit;
+    }
+
+    if (vp_context->vp_index != 0) {
+        error_setg(errp, "IGVM: VP context vp_index set to %u - must be zero",
+                   vp_context->vp_index);
+        result = -1;
+        goto exit;
+    }
+
     data = (uint8_t *)igvm_get_buffer(ctx->file, data_handle);
     if (data == NULL) {
         error_setg(errp, "IGVM: No buffer for handle %d", data_handle);
@@ -448,9 +475,21 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
     }
 
     if (ctx->machine_state->cgs) {
+        if (!ctx->only_vp_context) {
+            region = qigvm_prepare_memory(ctx, vp_context->gpa, IGVM_PAGE_SIZE_4K,
+                    ctx->current_header_index, errp);
+            if (!region) {
+                result = -1;
+                goto exit;
+            }
+            memset(region, 0, IGVM_PAGE_SIZE_4K);
+            memcpy(region, data, data_size);
+        } else {
+            region = data;
+        }
         result = ctx->cgsc->set_guest_state(
-            vp_context->gpa, data, igvm_get_buffer_size(ctx->file, data_handle),
-            CGS_PAGE_TYPE_VMSA, vp_context->vp_index, errp);
+            vp_context->gpa, region, IGVM_PAGE_SIZE_4K,
+            CGS_PAGE_TYPE_VMSA, 0, errp);
     } else if (target_arch() == SYS_EMU_TARGET_X86_64) {
         result = qigvm_x86_set_vp_context(data, vp_context->vp_index, errp);
     } else {
@@ -911,6 +950,7 @@ int qigvm_process_file(IgvmCfg *cfg, MachineState *machine_state,
         return -1;
     }
     ctx.file = cfg->file;
+    ctx.only_vp_context = onlyVpContext;
     trace_igvm_process_file(cfg->file, onlyVpContext);
 
     ctx.machine_state = machine_state;
diff --git a/include/system/igvm-internal.h b/include/system/igvm-internal.h
index 7f131c4d03..3ac0447e4d 100644
--- a/include/system/igvm-internal.h
+++ b/include/system/igvm-internal.h
@@ -67,6 +67,7 @@ struct QIgvm {
     unsigned region_start_index;
     unsigned region_last_index;
     unsigned region_page_count;
+    bool only_vp_context;
 };
 
 IgvmHandle qigvm_file_init(char *filename, Error **errp);
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 9dde972c11..af4c0156f6 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1171,6 +1171,7 @@ snp_page_type_to_str(int type)
 {
     switch (type) {
     case KVM_SEV_SNP_PAGE_TYPE_NORMAL: return "Normal";
+    case KVM_SEV_SNP_PAGE_TYPE_VMSA: return "VMSA";
     case KVM_SEV_SNP_PAGE_TYPE_ZERO: return "Zero";
     case KVM_SEV_SNP_PAGE_TYPE_UNMEASURED: return "Unmeasured";
     case KVM_SEV_SNP_PAGE_TYPE_SECRETS: return "Secrets";
@@ -2597,8 +2598,15 @@ static int cgs_set_guest_state(hwaddr gpa, uint8_t *ptr, uint64_t len,
                                  errp) < 0) {
             return -1;
         }
-        return sev_set_cpu_context(cpu_index, ptr, len, gpa, errp);
 
+        if (sev_snp_enabled() &&
+            kvm_vm_check_extension(kvm_state, KVM_CAP_SNP_DIRECT_VMSA)) {
+            return snp_launch_update_data(
+                    gpa, ptr, len, KVM_SEV_SNP_PAGE_TYPE_VMSA, errp);
+        } else {
+            return sev_set_cpu_context(cpu_index, ptr, len, gpa, errp);
+        }
+	break;
     case CGS_PAGE_TYPE_UNMEASURED:
         if (sev_snp_enabled()) {
             return snp_launch_update_data(
-- 
2.53.0

