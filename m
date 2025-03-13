Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1741845245;
 bh=z04ZxmmmgYOH5/sUQKQvAbbSieXln+6wc30//YDQqCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=6HHvwMJ3R5VGkN/Z/fZ3lx21sMEW2YtTGz/B5VXWtpYGwP06SevNuSraiaiNVupH7
 CgP7mh0Kf75OHQeNp6qeyaT/D3RIkrENfLX3Qo8OKVzNBrCniZJF/PfnyTz7KN5AX/
 QPsCJbt6b6W/jYNhKiwkLdbEjf2iG32VHhqOTfUWQ4E6AILhFkrargIJNxA4plYmr7
 Lru2YZXiAwHGSqpa6hU+zsNolRnIG4ogzdaPqGcZjebaz3zcWAybaK4C7CvgXTjc6+
 Nh8oabVZ06Q01oEjYsZ2oGotfo+UlNCLX5I+bjTTcbHRPVZUuPiIPI/W4BgtpT8A9x
 c5stTaAV7QKYA==
Date: Thu, 13 Mar 2025 06:54:03 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z9Jy-7RhGpqSCxRO@8bytes.org>
References: <Z9FSCnYWkV0g12R0@8bytes.org>
 <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com>
 <Z9FbpnCBjpYgOYI3@8bytes.org>
 <c289de63-1723-4c00-9c3d-69628b80bec8@amd.com>
 <Z9GgKF7w6Qa-HpIM@8bytes.org>
 <46ddc943-8501-4af3-b676-2cdd7e87b378@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46ddc943-8501-4af3-b676-2cdd7e87b378@amd.com>
Subject: Re: [svsm-devel] SVSM Host Kernel KVM Update Required
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: svsm-devel@coconut-svsm.dev, Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>

Hi Pankaj,

On Wed, Mar 12, 2025 at 09:05:50PM +0100, Gupta, Pankaj wrote:
> O.k. Should the KVM fix also goto Upstream KVM as well?

We can try, but my guess is that KVM maintainers will only accept it
together with a general CET enablement for all VMs. Also, my patch does
not cover the CPUID support indication, yet.

John's patch-set is much more complete in that regard, maybe it can
be updated and reposted?

Regards,

	Joerg
