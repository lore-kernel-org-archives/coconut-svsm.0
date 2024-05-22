Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A59C61C0B84
 for <svsm-devel@coconut-svsm.dev>; Wed, 22 May 2024 19:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1716398658; bh=OkmktzNc00ntQw2BsQ19qpyYFz/AoKH6dxQyfRiptFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cMHO8hH4ssfSqsU1OAbbgBrd4Ma8Tpbb9JDVoOyTM1oYRCpfhcM0FNJxYV+uSuKTw
 zXOft5R97zUjo7bChKgNqIJMeSFxpqsZpX12ehTE09SXjuA466qY+NeTraP8redG1O
 XvAwqJc1CqdSNakpIeQx26CNAjyA8MjFZpZCHLGcIU+iJoqtMgiqZxoYultTyW3qZa
 91L630VPsx00LRE/TRMIfkMRV/NSG64wIG9xgosCT1XVY1Zg1WFYBZ0wR4YzA6oVYJ
 9rBpq0l0M65R8yDqYdTUHJEvKhXHBJHqdnXRt8X5AO5BoUll/FuIl8/WskxSULg207
 IeVdNqM+hcIe5/RZlYwbTjQdEN6oyQE6HXI4jc45VwFD7+zasQ18s9PXp07iSCT+dd
 gt14eXb6YNIs16pcFm8Kql+dlLVJ0htx3Mh1+AyWtGuWvl8MvJdoZTazWXmPxHgTVw
 xH1AHivx9+9UEsjhmZRDpu0erAD6EQd4yutl8BH4I8PraJb5J2KzUFPMnC2T0dCt5D
 l41mhg9OqN2CUoeK025VRDHP1uZKNJB3qhn4+bVuelvWAcEgWFiLQPw7whbrRJi8R7
 G4w9kvLMawU0fDIw+tfo8EGAC1sBV2UuGK84h6K92yst+4JGEJZf0Mw4Gttrz50/KH
 C1vbb/Dzx6F8lI7dznbIdieE=
Date: Wed, 22 May 2024 19:23:58 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240522172358.GEZk4qLmzc0HklUsaL@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <6cf54cac47f212f4c2b59b123855d8c183989022.1713974291.git.thomas.lendacky@amd.com>
 <20240502093520.GRZjNeWLXU5j2UMOAM@fat_crate.local>
 <66928741-aa5c-4bbb-9155-dc3a0609c50a@amd.com>
 <20240517155858.GDZkd-wkWmYegos-eT@fat_crate.local>
 <f8a92b19-9090-40ea-c2cf-707005f583a5@amd.com>
 <20240522152712.GBZk4O0LIl2r0dH--H@fat_crate.local>
 <db4d1dee-b25e-f28e-e8dc-9c9bcce68dd4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db4d1dee-b25e-f28e-e8dc-9c9bcce68dd4@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 04/15] x86/sev: Check for the presence
 of an SVSM in the SNP Secrets page
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

On Wed, May 22, 2024 at 11:15:28AM -0500, Tom Lendacky wrote:
> Or what I originally proposed:
> 
> 	if (!IS_ALIGNED(caa, PAGE_SIZE))
> 
> Which also works without including mm.h.

It works because of the same nasty reason:

$ make arch/x86/boot/compressed/sev.i
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CPP     arch/x86/boot/compressed/sev.i
$ grep align.h arch/x86/boot/compressed/sev.i
# 1 "./include/linux/align.h" 1

The include hell pulls in that linux/ namespace header into the
decompressor. Which it should not to.

So no, please use the open-coded thing. I probably should start
untangling the decompressor slowly and do small sets because otherwise
this'll never get split properly.

;-\

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
