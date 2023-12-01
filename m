Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1701448312;
 bh=lbDlSswzZfLkNh2dewy1+SNCNY4IiGXNOGG47W3uwJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t44i0q5oMI7XVKmmALxk2XSu+ug2szX3VW804g7dU+x0BsY/XRgHH2KFQXYpNv3VL
 JhQHcYKQ8kWMqpPwS7p3bbCL7snADSf4EhXc34s4eZvVuwdw9p3bucuLgGtgxi2aPc
 QjCYJX7iqBKJ63+Ips/WryzaB8BzAYwOaVocVPkC3gIzd+9324YmJJbRou6v5mSG1J
 M/d74xFcuxXL8wXTGnKzeSd+q4v1spJP4zSTVe2qtAG/0o1rhedeJB4//qTG88li0p
 kHtJjoU/5GGcNNG63Sn78Aqi1NCU+TTDZvuPIlc8ChSm6KZVsGcT0nHlXWByqhnq8r
 tyA0jGTfTiHtw==
Date: Fri, 1 Dec 2023 17:31:50 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZWoKdnX8XtXHe_mV@8bytes.org>
References: <f83d8e11-41fa-4377-a646-cb11ba51404f@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f83d8e11-41fa-4377-a646-cb11ba51404f@suse.de>
Subject: Re: [svsm-devel] Fallible allocations and smart pointers
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"

Hi Carlos,

On Thu, Nov 30, 2023 at 01:20:42PM +0100, Carlos López wrote:
> 1. Bring our own implementation from scratch: costly and error-prone.
> 2. fallible-alloc crate [2]: only provides `Box` and `Vec`, so we
>    would need to build the remaining types (for example the upstream
>    alloc crate builds `Arc` and `Rc` out of `Box`, and so on). Costly,
>    but less so than a completely from-scratch implementation.
> 3. fallible-collections crate [3]: supports `Box`, `Vec`, `Rc` and
>    `HashMap`, but not `Arc` (it is listed as deprecated [4], and I
>    suspect the root issue might also affect `Rc`). Same issues as
>    point #2.
> 4. Linux kernel model (copy a subset of the upstream alloc files):
>    requires maintenance to keep up with upstream, and likely means
>    only supporting a specific version of the toolchain (see [5]).

Which of these options would give us the API most similar to the
unstable allocator API? At some point, when the unstable allocator API
becomes stable, we want to switch over with minimal impact.

As another option besides the one you listed, can we import a copy
of the unstable Rust API into the SVSM code-base until it becomes
stable?

Regards,

	Joerg
