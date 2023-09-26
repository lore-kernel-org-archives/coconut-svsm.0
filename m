Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1695753383;
 bh=7H+Ni8a4WWVPU0lLYwyuEz0qpspuN1DO4bhwy2TepxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v8MeJmMvVoUIOHUw7T1rxhqWKNY4I7UwaH1V/Hxwg8PChPXCK6jNI71JTaGrwx1Qt
 WpTXYG29KRKt3hhHJbIrvcyrflVuzLx0F2GtXNV+3/0UmpSrBVkE74Um2QUShUJlqy
 +lx14R6jeMhwPrW7lN57K8xc2V3kH4NHBL+iLO1waWCm454DJRCKsvVAIiNRjacj+F
 4+8qECML6e4LsFkiqwyPo+gzsDl2rWmJZcz5djrXsFDct2hkSMXlZUsuja2+vDq3wj
 6l40inwrkllbn1x+SsitW8zNzFDHCT5zsdXU0zkhnbmczObnr3J2lqXSAMLiQrP/XA
 msngLliy4PJ3A==
Date: Tue, 26 Sep 2023 20:36:22 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZRMkpiiFuBHaF2pP@8bytes.org>
References: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
Subject: Re: [svsm-devel] Questions about crypto support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Cc: svsm-devel@coconut-svsm.dev

Hi Claudio,

On Fri, Sep 22, 2023 at 05:04:45PM -0400, Claudio Carvalho wrote:
> Q1) FIPS 140 certification. Should we consider OpenSSL as a static or shared
> library?

We are flexible on that, we can start with statically linking OpenSSL
and then move on and support it as a shared lib. This does not touch the
SVSM core much beyond the fact that it needs support for shared
mappings. For shared we can also use a simplified approach like James
suggested in the last meeting.

> Q2) How should we handle build dependencies between CPL3 modules? E.g. the vTPM
> (Microsoft TPM impl.) build depends on the OpenSSL library.

That makes me think again about the requirements for our build system.

> Q3) What libc implementation should we use to build OpenSSL and other CPL3
> modules?

What amount of libc does openssl need? Or how much is it beyond
malloc/free? Whatever libc we chose, some porting efforts to the SVSM
syscall interface will be needed.

> Q4) Interface 1. How CPL0 code should communicate with CPL3 code?

The answer here is via a TBD IPC mechanism.

> Q5) Interface 2. CPL0 to CPL3 communication may need to carry secrets (e.g.
> VMPCK0 key), how should we do that securely?

There are various ways to do this, one is via IPC with a kernel service
and a capabilities system that restricts access to the secrets.

Another idea that was discussed is doing it via files. The filesystem
implementation in the SVSM does not have a concept of a CWD, so there
are no . and .. directories.

We can give every module a separate root directory and link the secrets
it needs to access into that directory.

But none of this is decided yet.

> Q6) Interface 3. How a CPL3 module should communicate with other CPL3 modules?
> It may also need to carry secrets such as keys.

For secrets like the VMPCK keys there should be a single owner, or do
you see a need to pass those around? Besides secrets, communication will
be done via the TBD IPC mechanism.

As it is still TBD, I am open for design ideas.

Regards,

	Joerg
