Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 68F421A7FCF
 for <svsm-devel@coconut-svsm.dev>; Mon,  4 Dec 2023 12:35:07 +0100 (CET)
Message-ID: <f601fc0b-c68d-482d-8022-fddbccdf45b9@suse.de>
Date: Mon, 4 Dec 2023 12:35:05 +0100
MIME-Version: 1.0
Content-Language: en-US
References: <f83d8e11-41fa-4377-a646-cb11ba51404f@suse.de>
 <ZWoKdnX8XtXHe_mV@8bytes.org>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <ZWoKdnX8XtXHe_mV@8bytes.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] Fallible allocations and smart pointers
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"


Hi,

On 1/12/23 17:31, Jörg Rödel wrote:
> On Thu, Nov 30, 2023 at 01:20:42PM +0100, Carlos López wrote:
>> 1. Bring our own implementation from scratch: costly and error-prone.
>> 2. fallible-alloc crate [2]: only provides `Box` and `Vec`, so we
>>     would need to build the remaining types (for example the upstream
>>     alloc crate builds `Arc` and `Rc` out of `Box`, and so on). Costly,
>>     but less so than a completely from-scratch implementation.
>> 3. fallible-collections crate [3]: supports `Box`, `Vec`, `Rc` and
>>     `HashMap`, but not `Arc` (it is listed as deprecated [4], and I
>>     suspect the root issue might also affect `Rc`). Same issues as
>>     point #2.
>> 4. Linux kernel model (copy a subset of the upstream alloc files):
>>     requires maintenance to keep up with upstream, and likely means
>>     only supporting a specific version of the toolchain (see [5]).
> 
> Which of these options would give us the API most similar to the
> unstable allocator API? At some point, when the unstable allocator API
> becomes stable, we want to switch over with minimal impact.

It's hard to say. If we develop our own API we can make it as similar
to upstream as we want, modulo some work.

> As another option besides the one you listed, can we import a copy
> of the unstable Rust API into the SVSM code-base until it becomes
> stable?

That was my suggestion number 4 really, which essentially means
forking upstream alloc.

The problem is that upstream code is constantly evolving, so we would
need to play catch-up every so often, at the very least for bugfixes,
and ideally to keep everything close to upstream by the time these
are stabilized. The way the Linux kernel does it involves keeping
track of the upstream crate and manually inspecting changes between
it and the downstream fork. The process is explained in Miguel
Ojeda's commit I linked in my first email.

Moreover, these APIs are not backwards compatible, which seems to
imply that we can only promise to support one specific version of the
Rust toolchain (also explained in Miguel Ojeda's commit).

I will try to come up with an initial prototype of this model and see
how much work it takes. I have some upcoming time off, so I can't
promise to have anything ready soon.

-- 
Carlos López
Security Engineer
SUSE Software Solutions
