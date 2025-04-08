Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1744104043;
 bh=LdLPXuxivmL/nK60k5NdMRNoS7RKMBFvish8ouN0Vbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=chT4J2oCUQUxpvR5MHC8oG36rMQQi8tybWig3BGJdp9z5l/gSTL4gvXRlP46O9Deu
 how8o99tlKjC6obXH8q9PcqsNqZ7EsDcMe0bpPxYk7hxQTkOJxmjIs+OIX0Aa3/8h/
 kFyPixOUa+cPYHga2T0r4iLQSl8Ht2vgSjD05PZ7s8iHQ/Ehj7hpzVbBYgmbFldkde
 PMmapd/Nk4X6+aDh1cU9351/JhPDp6eXp8hwn1/1Ut2l5yXbIDFhRe1aMfRu/4PlTJ
 em1z3LRdauM4LnZM2tneJwqznqW8Dzno+LIllRGs4/xMsWMIL5inJmzlK2SKrdSAXJ
 ClRpEf2hXx5IA==
Date: Tue, 8 Apr 2025 11:20:42 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z_TqaiYE-eQbrzAn@8bytes.org>
References: <Z/Qrq8iBBt4Dgz6J@AUSJOHALLEN.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/Qrq8iBBt4Dgz6J@AUSJOHALLEN.amd.com>
Subject: Re: [svsm-devel] Using crates in SVSM kernel
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: John Allen <john.allen@amd.com>
Cc: svsm-devel@coconut-svsm.dev

Hey John,

On Mon, Apr 07, 2025 at 02:46:51PM -0500, John Allen wrote:
> I am new to the project and embedded rust in general. I'm working with
> Pankaj G. on SVSM support for SNP live migration and I'm starting to
> sketch out some code for key exchange, but I'm learning that many crates
> available in non-embedded rust depend on std or on OS abstractions. For
> example, I want to generate a ecdsa p384 key using the p384 crate, but
> this depends on "get_random" which relies on a whitelist of supported
> targets to determine the rng method. This is just one of several crates
> that I would have liked to use, but depend on std or are incompatible
> with the "x86_64-unknown-none" target.
> 
> What is best practice when it comes to including libraries like this?
> What options do we have here other than reimplementing functionality
> from these crates or is reimplementation the expected course of action
> in this environment?

You are right that currently there is not support for the Rust standard
library in the COCONUT environment. This comes from the nature of the
project which is more on an OS kernel level than a binary for an
ordinary target.

There is currently work underway to enable support for the Rust standard
library for user-mode binaries running on the COCONUT platform, but that
is not ready for use yet.

So the options are to either wait for this support to materialize or (as
Stefano pointed out) use Rust libraries which support a no_std
environment.

Regards,

	Joerg
