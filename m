Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 764131C0B68
 for <svsm-devel@coconut-svsm.dev>; Mon,  6 May 2024 16:14:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1715004886; bh=fL0jWz0y0MdKTiR0U8jxUn73zBq9bUhbVTopKlDLfd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G0tlY3Vz5Xk6BIUXL6VJT6blz9r12hsvfG4elX4H4AzRdPrFwRYyZUlDg1rbozuhZ
 4UWPvtgiZY7Yu6tDYoLgrh0QYcwCFXtRN6qYq5FgrJ2/uWCN5dmYQP2QR9lKlOyaDI
 xvncVN/sbMcKtIScUkCOkJrbE1Xhgn4tufWkkfviqJNQan2qijp90xTkaEFih55Sci
 it8etOB4NTMeWG24XemazBZb024RkQAEFK+0nvhLucPqxCte55SHlURN0eMGttLsFn
 F5XWDudwGUdPNvkrbAZpWyqDKEuSeknRGIV4/Uc9UE7APc+wZHyTSxC/HiNNjIfhES
 xwnE4Z2w9TKlXNbvUVAOqTbuNLdwaxZVaQF2Unr7nGExI+kmAv9aA65MmS8xlTGa0K
 9kHd0936W2XxOwnBjP2EebQyQaGniA1xBBpd6oI7zxoefmBOcbRUDfb/vu4TdXkCmy
 bupelxG5AOqatUKS8+x5jeCGXNg8EMZ/iQ4XUtfqU2BawEFZ0VRQbtApYU9dkATkUW
 mNO0kwRrEyRaB+alkZSCtQGD5DFsaSUm3RSKwSWHGVSt77BYOBMPn0cJ2YvgLfG6tw
 bE0USZunZvpA9d1YD9RQM6HRaafFiSHJlj8crUDXBke48o5XAeDp8SItWd83sv3+Kf
 UKJ7ZgRm/pts2Rd6t6N+Sb6E=
Date: Mon, 6 May 2024 16:14:26 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240506141426.GJZjjlwuQryahOmSJS@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
 <20240503103407.GSZjS9n-XMMKi5ZOek@fat_crate.local>
 <20240506100905.GFZjisQTQwbkv2eKsh@fat_crate.local>
 <c4640af2-a791-848a-bacb-071f0bc8f9b1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4640af2-a791-848a-bacb-071f0bc8f9b1@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 05/15] x86/sev: Use kernel provided SVSM
 Calling Areas
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

On Mon, May 06, 2024 at 08:14:34AM -0500, Tom Lendacky wrote:
> This isn't quite right. The xchg has to occur between pending and
> call->caa->call_pending.

Right, you can fix that up in your next revision. :-)

I only wanted to show the idea of how to make this a lot more
readable.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
