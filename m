Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1715336247;
 bh=gw8UmHQ1FmnL0vaSor6MhpqNM5ASt2xxiddrAJWrGZU=;
 h=Date:From:To:Subject:From;
 b=gMsjjDMe0tVzO4M2wNzI+lt+b6kFf/CWb4HXUsTqLzMyLGbE1EbnzF+4nwofao6ID
 zgqUzrUuSQO83FPa3/2xKSa34XiX+A7LUBvRc5rh6SkstdnDguaMKGeViKkjrLwZkG
 viaSigzihl7qm73KDf9Sc+jof11hK8iE21EXKitCO5SIAktK1bLegWRx0/82oSL3tI
 6BQwKNJQjz/03x99+imapFbZomiPKKxx4C/yUzIcej15Jlq+aai3OKL39BkxT6cA1X
 8fFtCW7QZXaZ68m2fGoDMBlKYo7gEVRVVJTpj2CsBFkE6U5mq3kyrlgyLwC/6tjm2f
 dvqbZs9w50tWw==
Date: Fri, 10 May 2024 12:17:26 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Zj30Nqq3OS58DwpP@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] Development Plan Document
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

Hi,

As announced in the last meeting I am sharing a development plan
document which lists the in-progress and future work items to get
COCONUT-SVSM to the envisioned point.

The list is very likely incomplete and I am sure the document still has
a lot of room for improvement to become more useful, but I share it in
this initial state to discuss it early and align everyone on what is
planned.

The starting section lists the first priniciples I apply when thinking
about design choices. All following sections list work items.

The document is on GitHub in Markdown and PDF format:

	https://github.com/joergroedel/svsm-governance/blob/dev-plan/draft-development-plan.md

	https://github.com/joergroedel/svsm-governance/blob/dev-plan/draft-development-plan.pdf

The PDF version has a TOC which I find very useful. I encourage everyone
to have a look and bring any suggestions and questions to the next SVSM
development call on May 15th.

Regards,

	Joerg

P.S.: The PDF file was created with pandoc from the Markdown file, so
      the later contains some special markup which is not compatible
      with GitHub Markdown.
