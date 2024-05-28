Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 78A241C27CC
 for <svsm-devel@coconut-svsm.dev>; Tue, 28 May 2024 23:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+t/iE+uMtVJibx6k6FpKgetzh5oAEDtExhsjYNv6lA=;
 b=GQ2qDn6+X+2FNJ1c+cA9H/8sPCYq1IwdKJX/99caknugkoGv45eN2YuM5sfh6IIKrG+dCu+hQuo5O4Pr0kO+oNk4jjJt7AzAe82a1Fuefol+au0g9jTQ/MQuRvxORA1KDLZlzzrTDJ/dFgilwg5UnHQkPi4h2uVxAHcXEIpjutk=
Message-ID: <e7c24be1-dbea-0efd-2661-b626fd655478@amd.com>
Date: Tue, 28 May 2024 16:08:35 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <435f78e07c76e25d2d857138724098bc2a729b0a.1713974291.git.thomas.lendacky@amd.com>
 <20240527135101.GBZlSPxQ6iBSlMDefY@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240527135101.GBZlSPxQ6iBSlMDefY@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 09/15] x86/sev: Provide guest VMPL level
 to userspace
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 5/27/24 08:51, Borislav Petkov wrote:
> On Wed, Apr 24, 2024 at 10:58:05AM -0500, Tom Lendacky wrote:
>> Requesting an attestation report from userspace involves providing the
>> VMPL level for the report. Currently any value from 0-3 is valid because
>> Linux enforces running at VMPL0.
>>
>> When an SVSM is present, though, Linux will not be running at VMPL0 and
>> only VMPL values starting at the VMPL level Linux is running at to 3 are
>> valid. In order to allow userspace to determine the minimum VMPL value
>> that can be supplied to an attestation report, create a sysfs entry that
>> can be used to retrieve the current VMPL level of Linux.
> 
> So what is the use case here: you create the attestation report *on* the
> running guest and as part of that, the script which does that should do
> 
> cat /sys/.../sev/vmpl
> 
> ?
> 
> But then sev-guest does some VMPL including into some report:
> 
> struct snp_report_req {
>          /* user data that should be included in the report */
>          __u8 user_data[SNP_REPORT_USER_DATA_SIZE];
> 
>          /* The vmpl level to be included in the report */
>          __u32 vmpl;
> 
> Why do you need this and can't use sev-guest?

The vmpl value is input from user-space.

The SNP spec allows the VMPL that is put in the attestation report to be 
numerically equal to or higher than the current VMPL (which is 
determined based on the VMPCK key that is used). So this is to let 
userspace know that it shouldn't request a value numerically smaller 
than what is reported in sysfs in order to avoid failure of the request.

> 
>> +static int __init sev_sysfs_init(void)
>> +{
>> +	struct kobject *sev_kobj;
>> +	int ret;
>> +
>> +	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
>> +		return -ENODEV;
>> +
>> +	sev_kobj = kobject_create_and_add("sev", kernel_kobj);
> 
> In the main hierarchy?!
> 
> This is a x86 CPU thing, so if anything, it should be under
> /sys/devices/system/cpu/

I can move it there. Or what about creating a coco folder under 
/sys/kernel/? This would then create /sys/kernel/coco/sev/?

Thanks,
Tom

> 
