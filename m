Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D06EF1C0BD3
 for <svsm-devel@coconut-svsm.dev>; Fri, 14 Jun 2024 22:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718398074; x=1749934074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3FNJvr2/BDImACIcGDRWKatxyQqfTIjPdhEiJ/hII60=;
 b=ZdQ1IfV8Qqeogzuadh/Zf21cIaOBGZUXMWWy+3Vc5vZ+wx/kkTUCH/Ta
 gf7J+qkmOwEE1U2PNnZOcCb6wUxZtNE0IDihzDJPSt+UwZS7vers1AEYb
 eJWzxf520B6HWY1aRGSehZUEpsvppwoUjIlOdH5XaEyimSUzmUKDsRyov
 f1GnplDmetw5kOrEYLusswZ7QkPwxKqQiGNtZAxijoYvOpxtJrjOTq7sE
 8e/XukiHJxEurMDGrpRqPexEAmGA7O0mdAUqXh9g5PdxoJ8NQ58YM6KMu
 kTqtPjnXnmlkc4aFotZZLo3lLgIorS3/g6CSeUGDTJbRN+Wgy9QUeEQX3 A==;
Date: Fri, 14 Jun 2024 13:47:45 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <666cac711f1e1_c79a32949c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
 <5a736be9384aebd98a0b7c929660f8a97cbdc366.1717600736.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5a736be9384aebd98a0b7c929660f8a97cbdc366.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v5 09/13] configfs-tsm: Allow the
 privlevel_floor attribute to be updated
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

Tom Lendacky wrote:
> With the introduction of an SVSM, Linux will be running at a non-zero
> VMPL. Any request for an attestation report at a higher privilege VMPL
> than what Linux is currently running will result in an error. Allow for
> the privlevel_floor attribute to be updated dynamically so that the
> attribute may be set dynamically. Set the privlevel_floor attribute to
> be the value of the vmpck_id being used.

Makes sense,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
