Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1731407508;
 bh=m5bfh4+pY3Pyhv5aZ9asF8FicDsC+vKuiWkDBHv1AiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J+B26PL3l6nLiyJx0Bn9MYxTHSQVytQ4m76iz/Og7CS7/BsgIRE4DW2wgiPE2zOHW
 MnTyAZVO9N5YwFMC9RBJLa01EOW6d+BCrXc0/eErzYcjyYXobJL16vaioS8NkTO+Wr
 KuD7XhiruXG+PT26E/CpUF4jFNxlwmUL8r/L2nakEKhtneSsDssRQbIxmWZgJU8cvV
 8Qhu8CwI65iEUBJ4KwxLIHPuSAgOJkujzJW51v8GzbwK0Y0ah22Y1R97KqnyQ0A/s6
 eFNJ5EtIo6PAH8H3O+ax+mWb67fbckRJLLfUVqTQwq3g6kYmPZTHA+nfA0WjxWPTiu
 WOqhDRBOEsJ8g==
Date: Tue, 12 Nov 2024 11:31:47 +0100
From: Joerg Roedel <joro@8bytes.org>
Message-ID: <ZzMuk05R2Ie95foi@8bytes.org>
References: <CAGxU2F4AN+3cNcDKAciLkYAMkxKe5CA5VM7YjZfzb8S4H5HboA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F4AN+3cNcDKAciLkYAMkxKe5CA5VM7YjZfzb8S4H5HboA@mail.gmail.com>
Subject: Re: [svsm-devel] Coconut EDK2 fork issue with subhook module
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: svsm-devel@coconut-svsm.dev

On Tue, Nov 12, 2024 at 09:44:27AM +0100, Stefano Garzarella wrote:
> Hi Joerg,
> there is an issue in our fork about initializing an EDK2 submodule.
> 
> So currently, our fork has problems when we initialize submodules.
> Upstream have already fixed it and I backported the fix here:
> https://github.com/coconut-svsm/edk2/pull/4
> 
> Can you merge it?

Merged, thanks for the heads-up.

Regards,

	Joerg
