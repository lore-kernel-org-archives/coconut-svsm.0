Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 38E38280FE2
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Mar 2024 22:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFSlWnQfXHVhMpD3Rolmcz81Ium3DUFhy4tiBntDq/s=;
 b=OFQ6BUHirlKRixJIAe9HRIUs43XKMZ/THpfM2JYrPNSbTUzqkUdbQV1N6kz/TAZbCg0W1YqLbSNU1LFpzlj5mQfnkjCC2XWbuFJZjfKJ/dZWWeeYEar09cY0Yi//SrITn9xWMTphszybKDVa/P234ycdk3MoieakW+6jKhuB6jc=
Message-ID: <2e6bf651-c720-405f-a598-2f2a2b911049@amd.com>
Date: Wed, 27 Mar 2024 16:49:58 -0500
References: <9a2a2fec29450701145a97b52ce70844eaac793d.camel@ibm.com>
 <ZcZKBdaSWI4cNDBP@8bytes.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
In-Reply-To: <ZcZKBdaSWI4cNDBP@8bytes.org>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] Launch coconut-svsm using IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, Roy Hopkins <roy.hopkins@suse.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 2/9/24 09:51, Jörg Rödel wrote:
> Hi Claudio,
> 
> On Fri, Feb 09, 2024 at 02:46:03PM +0000, Claudio Siqueira de Carvalho wrote:
>> I was doing some research on IGVM, but I did not find any example. Does anybody
>> have an example of an IGVM file and a QEMU command line that I could use to
>> launch the coconut-svsm?
>>
>> This might be helpful for other people too.
> 
> The COCONUT build process will generate two IGVM files, one for use with
> QEMU and one for use with Hyper-V.
> 
> To use it with QEMU, you need an IGVM-enabled QEMU, instructions on how
> to get one can be found in here:
> 
> 	https://github.com/roy-hopkins/svsm/blob/igvm_install_doc/Documentation/INSTALL.md
> 
> This is a file from Roy's pending PR on updating the documentation for
> the IGVM switch.

I just tried building everything fresh on a new system based on the 
installation instructions and can't get the firmware to launch. Doing some 
debugging, the firmware loading appears to be off by a page (0x1000). In 
other words, the code that should be at the CS:RIP 0xfffffff0 is actually 
located at 0xffffeff0, with all 0's at 0xfffffff0.

I don't have a full grasp on the Qemu IGVM support to understand if it is 
the IGVM file that is built wrong or the Qemu IGVM support that ends up 
off by a page. It appears that the firmware is handled as the last item in 
igvm_process() and if process_mem_page() is invoked with "i - 1" instead 
of "i", then the firmware begins booting.

Thanks,
Tom

> 
> Hope that helps.
> 
> Regards,
> 
> 	Joerg
