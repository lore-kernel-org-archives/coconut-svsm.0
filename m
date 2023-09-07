Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1694076438;
 bh=CREQ9JvSCqQ/oiKHtN5ihBf9yCAQzFtKPA0sZW2W9Hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rV6GM673OFmTAcg06B18ER4qvhcsEAKenGnNH4i9lucpi12yUhlDLavv0tX39BX++
 W6gXoIHWgkvzZvJerocDTMStfAMjA00wfmrkS7jvmk+2j4mj3+x9UoR5GyObzFRv6q
 jr5qP2e9ezmwSbD2OQPjJAtunL/VayC+ZxBTzq1QNdd8NkSAumh4EmJyL1Xct4bOYB
 hEulNfCJnSf7RjQtXghBHyHNAA+gtL11eeI2n4X/Y4RF7mm22UaueJAPmntXZvIqqb
 pZKNl9fPdFfZiBIH6vxqykXeHDnogAzh4G1HHlpKLEUfGerNZMrUgSEQEcludi4xeq
 jn+tPxVU70HqQ==
Date: Thu, 7 Sep 2023 10:47:16 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZPmGEFGYVQtQF9uT@8bytes.org>
References: <9ff1416f-5436-9148-73e1-fdd72ceb6285@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ff1416f-5436-9148-73e1-fdd72ceb6285@amd.com>
Subject: Re: [svsm-devel] [RFC] task/schedule: Idle process?
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: svsm-devel@coconut-svsm.dev, Roy Hopkins <roy.hopkins@suse.com>

Hi Carlos,

On Wed, Sep 06, 2023 at 09:29:00AM -0500, Carlos Bilbao wrote:
> The PR for the scheduler (#64) is still under review. In traditional OSs,
> it makes sense to include an idle userspace process that does nothing and
> is always there to be scheduled. So I was wondering if we should do the
> same for the SVSM.
> 
> Currently, SVSM schedules the "root" task responsible for running the
> request loop. However, in the event of a SvsmReqError:FatalError, this
> process may terminate prematurely. This raises the question: should we
> introduce an idle process in SVSM, or is it irrelevant in that context?
> 
> My first intuition is that if we don't have an idle process, then the SVSM
> itself would terminate, and perhaps that would difficult further debugging
> of potential errors. Or maybe it would not?

Yes, we plan with an idle process. It will be the (kernel-only) process
that gives control back to the guest OS by switching the VMPL.

The idea is that we have a runqueue and execute tasks from that as
long as any of them is runable. Once no process is runable anymore the
idle task is selected by the scheduler and switches back to the guest
VMPL.

Regards,

	Joerg
