Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1692772571;
 bh=7Wz7jODOp7cP7peWiUFYcmlJ0daZjC1uS3TaCn1xvJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BALJWmAePhTUVwvQsUz1WqelPyozsW1Fqi/xr9p+MrdAvoRzGNfrEllLl7TNGhgc1
 g2efkh9P6mVgtskCvV6oLjJLe2pVb9QYxdgs1kbA+Ogifcm95je+BhTZ1M/jawca+X
 0+2cskl6vj9DlpKO9lK0j6+V5elMvasWZH4jFfgIhAH3ltttjV96wtIaBTrTsLWH+u
 EfbSQiKatxJ2uAo2rM6/uDLbMZYhhVH6wV/S7HSZVMxA1kRIC/8RHWgfjcv8iiMpav
 kPtgucePNZYXcLXZxdgaBvzN7d+jYrThldbb3b2IcjHc9rai9lwQoNJNN8qpa9ue8r
 9lKAnL9MJeZAQ==
Date: Wed, 23 Aug 2023 08:36:10 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZOWo2qXyP7Q0emxH@8bytes.org>
References: <4233d253-cb30-c003-6179-86cc2a0e42c8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4233d253-cb30-c003-6179-86cc2a0e42c8@amd.com>
Subject: Re: [svsm-devel] [RFC] Document Coconut-SVSM
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

On Tue, Aug 22, 2023 at 10:27:55AM -0500, Carlos Bilbao wrote:
> I just opened issue #74 on GitHub titled "Document COCONUT-SVSM" [1].
> Little explanation is needed, we should start this task while the project
> is in its early stages. I suggest we (1) Compile a list of critical
> components to document, potentially in order of importance and (2) Decide
> whether we'll use Rustdoc or consider other alternatives e.g. GitHub Wiki.

Good idea, thanks for bringing this up. I think rustdoc is the best
choice because keeps code and documentation close together.

As a starting point we can take a look at the submodules/directories in
the source and take this as the list of components.

Regards,

	Joerg
