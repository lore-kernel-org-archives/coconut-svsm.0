Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C82271C3858
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 21:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717184304; bh=UZsf1AeqASq5kfd99ju57zEsraxqq6Eox6I8tYWLI0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CjBUiVTttPkhSXSUCCo9BH0hXdSBM5uXLDXKujd/GSOD4eNZlp2nuSNpDHU/GHEhx
 +o+XqewFdWVp9bZ5I8yAWN2W0/+dqjLoSP1RUO4n2gsTmjS2fGQHFzuyK/wDhTi8yr
 moNc1NgXX99u9yvYVACL+I6rRVjmFIYT2zYF7B3cy+j2XEfgmb1Rmao6jBbRMJVy0/
 IvUd18adY7FFSGyRoCuOpmlNNnpOQdcwpfqaPtLrIM0kvyne5r3/0iWRgYd2Jc3f/A
 MqTkAnku8ubwAU9G9FOh1ua9hOhfddyf4zaO0GozyUr3LKP35FkwGxrzyssiDMTVmY
 yaTvNhfdU1I8ulvcb75/7oYy8hxYHykvrLRYgHGdtslPwr2Jqc0LgUZntiunqTKWQc
 /wwI4a61lmUHLssJXU1jKvW4Q3L19M5t4osch2f48ECbO52/Yx1ERPMIG0s6AAUy9m
 D6qQFaThiAB8CYURvhqyw2HcnC0YUagz9FCBUC/f44GBIT/uaCJ8AnybchNQOxrgqT
 GPOz3OlzAsf9hlR4AVX0LB2DDKBaeTmI9smpAy57twaNssCGtnhb0g0GuwooTPpZqI
 FSRlpNdI2a/1IzDDo8XdTzyLldzoBwngxrmiKj0jMdPVcNDTN6+7OX6F3dv0FiQ8Zx
 WTJfgM6VNCgQ5KHgDgY7XzJU=
Date: Fri, 31 May 2024 21:38:04 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240531193804.GMZlonHNj42yE1XBTe@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
 <20240531125503.GEZlnIp7YobFu7g9iS@fat_crate.local>
 <ad55da28-e5e0-a348-3cbc-d1a80d0ab2bb@amd.com>
 <20240531190348.GKZlofFDL4ESfpOQ6O@fat_crate.local>
 <d97f837e-fe7c-64ed-78ec-2581607150c6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d97f837e-fe7c-64ed-78ec-2581607150c6@amd.com>
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
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On Fri, May 31, 2024 at 02:34:37PM -0500, Tom Lendacky wrote:
> It probably should have been documented above the module parameter itself
> and/or in the sev-guest documentation. Those can be done as part of this
> patch or separate, whichever is preferred.

Yeah, pls do it while you're touching that area.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
