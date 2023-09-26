Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1695754200;
 bh=lCqn62zFxErSztPx90pLBdMnZstI0tvX7x73p4+7HZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBBHfioIDhF7sGLDhlFZOm3JCGO3b5tdIEwKKUkham0Si6rz+BJZwFQrn/AV8rpC5
 I0NySLdozp4MX1pyyBr9KH7K4cvez4hp6LVZdw26jHgtnpxMRGeuvLa1wt0m4BC39M
 Eu/3PKWDMTvlvfyVcc3wfGlCW/E2IhbKVcfusb1R7MSg4hBDy6cHp43tXHl3OsS1gE
 iW1jAWDHNDy6PL7zdcVgm3APoYLDiP9QSFsYSsdFPLNlTBp5b66X73YOaIhgaub0/j
 2QEbcZjhY7elj5Ndpz3joNoUuoXVfGKOnYtHozJeW+wtcvKTXPLiri9O9NFYSGQhxi
 qwNGzLggWOpTQ==
Date: Tue, 26 Sep 2023 20:49:59 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZRMn1xQ50DCpsUTS@8bytes.org>
References: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
 <CAAH4kHaa3v6125D1HQwt_6AbKP34N8rkH+gJQwyRa8zQM+-E8w@mail.gmail.com>
 <56cd11971a4bc07e88f91a53f1918615362bdaec.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56cd11971a4bc07e88f91a53f1918615362bdaec.camel@linux.ibm.com>
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
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, svsm-devel@coconut-svsm.dev

On Mon, Sep 25, 2023 at 11:38:54PM -0400, Claudio Carvalho wrote:
> My impression is that FIPS 140 is a complicated problem when it comes to
> firmware and it seems too big to be considered now. I would like to hear what
> you guys think about that and if CPL0 should have it's own crypto (e.g.
> RustCrypto) in order to simplify the design. At the moment, the only crypto
> requirement we have for CPL0 code is AES_GCM, which is required by the
> attestation report feature.

Agreed, we do not make any decision here yet. Lets start simple and get
vTPM support in CPL3 up and running. Once that is done we can start
improving and extending things as we see need.

Regards,

	Joerg
