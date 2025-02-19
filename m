Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1739982296;
 bh=c6S5c6Tyzh1iqkV/UvxGe2kZxZgEAK8hswY9oPs2C8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oMSvPVhX5Pvgm9Ekk5jzjZiuK1I2wBBJRGo7XVkBgVdYpOg+QaLdD9xEDH3XdhC3g
 YCrqeVl1gaxUSy98N+ud2QbY/A8wsMtr1waTkLVDyHWoB0pYQYnwH7Z8FkfRQDig9M
 7Z+NKJh2gIRFIZDNYOPMBbi1ver4AJkCTU4qg5OJJe5TLjhBwTNqledgrAPF3W72RW
 OYyMHdKEmOQxTubU7TAyMQvbHLpeaVZWyRx8HOYWv/NMGG7qzCDLRRMW8uwioN+2/S
 AeIzB8UFaERTfhL48E7/E17kcVOmTI2Yu/vfqyYVjSQ4DNoFo14rz7VKKyWg3sUoHA
 Jf2dYH7Jnu8Xw==
Date: Wed, 19 Feb 2025 17:24:53 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z7YF1fSQSp9BrJrx@8bytes.org>
References: <CA+bRGFprMx2s6scqXgjdrDUG2JOz0ybp6Srx0g1kp2ahSCoJuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+bRGFprMx2s6scqXgjdrDUG2JOz0ybp6Srx0g1kp2ahSCoJuA@mail.gmail.com>
Subject: Re: [svsm-devel] virtio-mmio base address: fw_cfg vs IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Oliver Steffen <osteffen@redhat.com>
Cc: svsm-devel@coconut-svsm.dev, Stefano Garzarella <sgarzare@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

Hi Oliver,

On Tue, Feb 18, 2025 at 08:04:49PM +0100, Oliver Steffen wrote:
> In last week's meeting we talked about communicating the mmio base address
> for the virtio driver to the SVSM via Qemu's fw_cfg interface.
> 
> This is easy to do, but now I am unsure how we want to
> handle hardware information in general.
> 
> Currently, the serial ports for logging, gdb, etc. are configured via
> the IGVM file.

That is right, but I consider IGVM parameters more of a workaround than a real
interface for communicating hardware specifics from the hypervisor to
the SVSM.

For the console it is not really important because a) A serial port can
easily be shared between SVSM and guest OS, and b) Mid-term the SVSM
will not use the serial port in release builds anyway.

So, in addition to what Jon wrote, I don't want to extend the IGVM
parameters for this matter. A "cleanly layered" solution would be much more
complicated (I think we discussed that in the meeting as well):

	1. Let SVSM consume ACPI tables from Hypervisor (e.g. via FWCFG)
	2. SVSM takes the devices it wants
	3. SVSM removes these devices from ACPI tables and forwards the
	   resulting tables to OVMF.

That is much more effort so I think for now all is well and we are okay
with QEMU communicating SVSM specific devices via FWCFG, so that the OS
will not see them.

Regards,

	Joerg
