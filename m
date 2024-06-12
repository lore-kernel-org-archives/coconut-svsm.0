Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1718195305;
 bh=D1vCetl9fXFNm3p4yN6sjVIB++BC7YKYsEGkFzcfCQg=;
 h=Date:From:To:Subject:From;
 b=TtyZMiQf176RxxUF+iM4KqqJE0tcnlp0Z7HVdq9aEdpNcf3Jwu7EZLoNT69BxCT8p
 wq1NNZXvXF4YXUYsygIJvArAku8xFGB3P8eKVT4TDkJwzGSv1kgDFhtWk6KG/XHBzF
 QFYIIkA+YCqY/DSe15uHyIpu9JUFHs0xVzaKN/KA+dLb4xk5zlAR1YRoOl0wL23L+0
 FpZdkE2EQDOq0BFtX34lvYm2tCRbTB9NglgdHQnvDJvJSnmmN1j5L9jFGxwV339e8/
 FcO1Ikn5i+88QmNuF0QtF3PGhMa/V+vskQy9vJXc0GP21qdgwfZ4X3UxQMFGpMXY5s
 +kvoZk9v65jNA==
Date: Wed, 12 Jun 2024 14:28:23 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZmmUZ5-DoVjKtoE3@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] SVSM Development Call June 12th, 2024
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

Hi,

Here is the usual call for agenda items for this weeks SVSM development
call. Please send me any agenda items you have in mind or raise them in
the meeting.

For now we have these items from Claudio:

	- What does TPM locality[1] mean for the SVSM vTPM?
	- Is there any SVSM boot event that we want to record in the TPM
	  PCRs/Event log?  E.g. a SVSM configuration, the OVMF hash, etc

Please note that there will be no SVSM Development Call next week, as I
will be at SUSECon on Wednesday. Next call after today will happen on
June 26th.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
