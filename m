Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1717512605;
 bh=LANm07rXulL9ApxBvdsMiKVZhbidRpa5Qu4jlOZvGHk=;
 h=Date:From:To:Cc:Subject:From;
 b=FzrN1Kds631zTIBTSz4dBpVeMvB1pGtIFg7wcRSE572DTLpCGo1I8Bj6AZ9vvsWIr
 oBxmB9CutBlPmcRQGSTAN/w2BC0If+ofJfZxFcrBOuPx6tyK4i/kgYkxf9W4hru/sW
 dhlh4t+EoIeKgfslE+b4dAFf5Tl2MDKgAyzMSahRVsqVMD5OUF21VqjOP7BxU6vvn9
 gLtG1JVMEoZHA30XRr4WZoy5+ySFZMv7zxP3cJQY5d2RZvJ+FaIsyj11h5rwcK9twz
 qX6jkBbOSXoZFVpPnSG8yHDwfdSAhdG+GTW9CG5LYIepxfbKWasWTaXvPXeG1P18qC
 4jifFXXMXHMgA==
Date: Tue, 4 Jun 2024 16:50:04 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Zl8pnPS8EVgFgxSR@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] [CfP] Confidential Computing Microconference @ LPC 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, kvm@vger.kernel.org, linux-sgx@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Cc: Dhaval Giani <dhaval.giani@gmail.com>

Hi,

We are pleased to announce the call for presentations for the
Confidential Computing microconference at the Linux Plumbers Conference,
happening in Vienna from September 18th to 20th.

In this microconference we want to discuss ongoing developments around Linux
support for memory encryption and confidential computing in general.

Topics of interest include:


	* Support TEE privilege separation extensions (TDX partitioning and AMD
	  SEV-SNP VM Privilege Levels) both on the guest and host side.

	* Secure IRQ delivery

	* Secure VM Service Module (SVSM) support for multiple TEE architectures

	* Trusted I/O software architecture

	* Live migration of confidential virtual machines

	* Remote attestation architectures

	* Deployment of Confidential VMs

	* Linux as a CVM operating system across hypervisors

	* Unification of various confidential computing API

Please use the LPC CfP process to submit your proposals. Submissions can
be made via

	https://lpc.events/event/18/abstracts/

Make sure to select "Confidential Computing MC" as the track and submit
your session proposal by July 15th. Submissions made after that date
can not be included into the microconference.

Looking forward to seeing all of you in Vienna in September!

Thanks,

	Dhaval and Joerg

