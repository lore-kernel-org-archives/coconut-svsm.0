Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1707493894;
 bh=/Bpv7HpwazgLJa3jYZ2VWt8XUmMxmn4dkZGaxMTD8Wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1/TMKg3UVTXsnaLfmZC0KVFsrYU5KSwvccttQ+jkZaIeFGXKgRF0jdoHviLNTsrLe
 tY3bkGgSI908kmep5V6JDx6UMiYuB4KQJxkRG1VrxSVdoHmSlldIhjKu7qpvJ1yakL
 FlF7Ipe43gD9TbH3UYCGX1DAyYcyN7bTKc6+OahwhlOc5FMiNsJTlwsVq4820cMFiE
 5QcwwMfnA9p8sxzA2sRR6aghVOTmfDVS7k99EoxcnnwfDh5okN/Nq8nrk7i0e0XrLi
 8RpEeJ2hkNADyhY3TkRuIn7UDnRqBaSfE1B8HSgC4hZ60mmFeLcxCv0Ob9+8PD9NlX
 4Rxx+38Y2TLSg==
Date: Fri, 9 Feb 2024 16:51:33 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZcZKBdaSWI4cNDBP@8bytes.org>
References: <9a2a2fec29450701145a97b52ce70844eaac793d.camel@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a2a2fec29450701145a97b52ce70844eaac793d.camel@ibm.com>
Subject: Re: [svsm-devel] Launch coconut-svsm using IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi Claudio,

On Fri, Feb 09, 2024 at 02:46:03PM +0000, Claudio Siqueira de Carvalho wrote:
> I was doing some research on IGVM, but I did not find any example. Does anybody
> have an example of an IGVM file and a QEMU command line that I could use to
> launch the coconut-svsm?
> 
> This might be helpful for other people too.

The COCONUT build process will generate two IGVM files, one for use with
QEMU and one for use with Hyper-V.

To use it with QEMU, you need an IGVM-enabled QEMU, instructions on how
to get one can be found in here:

	https://github.com/roy-hopkins/svsm/blob/igvm_install_doc/Documentation/INSTALL.md

This is a file from Roy's pending PR on updating the documentation for
the IGVM switch.

Hope that helps.

Regards,

	Joerg
