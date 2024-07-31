Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1722440926;
 bh=8MtVYQJyzMjuD2LgXZtF07C/Bqsnrcvv8Udx91o/HFI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=eT+ie6iwguyM33hgurpNTC/3FxV0Q4PtwG9x5PrL9PgyHQE4wSMiRIYO0eD806YH/
 HwYAhVKJdxrduTbD395iKaVGLS3DQWbOImmDDgYXcJ53eVH/Q90JLkmeRL9Xt2g3rc
 d0eP/Sgf7Dy7j4HezMyeBudSq6qWEDCWnNHbsC56tGGlOoF2uxSQEbfc1W8omqPOSV
 WI9+u5tryHLpctbGrZ5jGKCHw/KCdoYsi3iTomDfkRiMRTeRxRo1WTRZZOP1/TzNSg
 F5D6YKrkAPNoyMyKd7NPHbHPMsqvRZ3C2ZptRQ72ioN8zADqZZYmXadaLOcz4AZMAV
 a0mAcxWO5HM5Q==
Date: Wed, 31 Jul 2024 17:48:45 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Zqpc3dbqxorynrHy@8bytes.org>
References: <ZqkGwtfMx_OisW6q@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZqkGwtfMx_OisW6q@8bytes.org>
Subject: Re: [svsm-devel] SVSM Development Call July 31st, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 30, 2024 at 05:29:06PM +0200, Jörg Rödel wrote:
> 	* Can stage1 be removed?
> 	* Pros and cons for requiring specific stable Rust versions
> 	  (tied to PR #428)

Two additional items:

	* SVSM BoF at LPC?
	* Stack unwinder issues update
