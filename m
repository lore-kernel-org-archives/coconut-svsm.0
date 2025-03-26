Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1743001666;
 bh=wpI/6Tg3JzMLXkj2EE+uVlYMlQYWKMq9bpdzv9t7VoM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=y2t5BMvFP0yQ5oy3p32xDAfTCr40wi3id6LNvdWqqw3EzlyABq31hEwoNfraRp6ra
 cQXhjwmrJKea5gdXwAQckqVmLcyyi6eJ3EyGEtQnUqOHQXlAtjRLhQDVuoWCJVAgu4
 BHLFc4PiGFqvpcyEqinCXq5SeVgwenXaWEP9mUKUNKZUwTDU4NyU7eF2XylEICDD/6
 6IbxrRt/cZ6afA/2VzTnvLw+/e5jg/v2PBFp3NQWmc+n/Dv9gROsHFxiYd7d3oDrdd
 QJ5Xu9FwZhNysz9w3xuJoqrSyKdWRoJl7w/9rJcY2tc5EN90ssguHgysTW9k1i1UjQ
 ukcA4i/1FcrAA==
Date: Wed, 26 Mar 2025 16:07:45 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z-QYQTBuOjJtkiWX@8bytes.org>
References: <Z-LgVcs66nVpAd7x@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-LgVcs66nVpAd7x@8bytes.org>
Subject: Re: [svsm-devel] SVSM Development Call March 26th,
 2025 (Changed meeting time for US)
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

Hey again,

On Tue, Mar 25, 2025 at 05:56:53PM +0100, Jörg Rödel wrote:
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.

Just a notice that I want to bring the status of some of the PRs to the
agenda today, namely:

	- #259 SVSM: require SNP restricted injection
	  (Can we require restricted injection on SNP?)
	- #528 Attestation driver and proxy (with KBS attestation)
	  (How to solve the stack usage problem?)
	- #541 svsm: add SVSM VTPM Service Attestation
	  (Any dependencies regarding the ongoing attestation report
	   format changes?)
	- #635 virtio-blk storage via mmio using virtio-drivers [v3]
	  (Any blockers, maybe generic MMIO routine support?)

See you in the meeting :)

Regards,

	Joerg
