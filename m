Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 33E731C7FDF
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 18:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tM1tEwro2rjm4FGZZZCeUi509ZVthQoM1tWA6AA7Sbo=;
 b=hhDylQkDH7+uZc1J7PU2tcSsfkre+y+ziye8Y6ZlRMpHw7amVWRDX2mY0q+ABb1XvyIyPN5fORpwC1AJhEWyunlAGQvpQT9etKAkRGWMIO6MjPxRZ9fEWXYKbvRAasdcL5W/eE8eV9L/vCG5Vj/pmIfFa+wXTfHQhQldYlaICzA=
Message-ID: <2be81e12-9c62-7fa0-5f3c-ab195406b6b6@amd.com>
Date: Tue, 16 Apr 2024 11:17:38 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <bb088b1409283cd323515138feda224759a247ec.1711405593.git.thomas.lendacky@amd.com>
 <661e04cd345af_4d56129468@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <061802e1-7c95-f1f0-b462-3aca27583d76@amd.com>
 <661ea007d1844_4d5612948c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <661ea007d1844_4d5612948c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 10/14] configfs-tsm: Allow the
 privlevel_floor attribute to be updated
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 4/16/24 10:57, Dan Williams wrote:
> Tom Lendacky wrote:
>> On 4/15/24 23:55, Dan Williams wrote:
>>> Tom Lendacky wrote:
>>>> With the introduction of an SVSM, Linux will be running at a non-zero
>>>> VMPL. Any request for an attestation report at a higher priviledge VMPL
>>>> than what Linux is currently running will result in an error. Allow for
>>>> the privlevel_floor attribute to be updated dynamically so that the
>>>> attribute may be set dynamically.
>>>>
>>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>>>> ---
>>>>    drivers/virt/coco/sev-guest/sev-guest.c | 5 ++++-
>>>>    include/linux/tsm.h                     | 2 +-
>>>>    2 files changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
>>>> index 1ff897913bf4..bba6531cb606 100644
>>>> --- a/drivers/virt/coco/sev-guest/sev-guest.c
>>>> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
>>>> @@ -885,7 +885,7 @@ static int sev_report_new(struct tsm_report *report, void *data)
>>>>    	return 0;
>>>>    }
>>>>    
>>>> -static const struct tsm_ops sev_tsm_ops = {
>>>> +static struct tsm_ops sev_tsm_ops = {
>>>>    	.name = KBUILD_MODNAME,
>>>>    	.report_new = sev_report_new,
>>>>    };
>>>> @@ -972,6 +972,9 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>>>>    	snp_dev->input.resp_gpa = __pa(snp_dev->response);
>>>>    	snp_dev->input.data_gpa = __pa(snp_dev->certs_data);
>>>>    
>>>> +	/* Set the privlevel_floor attribute based on the current VMPL */
>>>> +	sev_tsm_ops.privlevel_floor = snp_get_vmpl();
>>>
>>> Why is this not vmpck_id?
>>
>> Good catch, this probably should be pulled out separately and submitted
>> as a Fixes: against the current support. If you think it's important
>> enough, I can do that and put this at the beginning of the series. Or I
>> can just modify this to use the vmpck_id value. Any preference?
> 
> I dunno, you tell me. What breaks if privlevel_floor is mismatched vs
> vmpl and/or vmpck_id? If it warrants a "Fixes:" it should probably be
> broken out.
> 
> However, I *guess* it is just adding some sanity checking precision to
> userspace requests and makes some input validation not catch errors when
> userspace tries to generate reports from the wrong level, right? I.e.
> privlevel_floor may be lower than expected, but userspace should not be
> depending on that since the report generation will fail.

Yeah, it just results in a different type of error. If the VMPL 
specified by the user is numerically lower than the vmpck_id, then the 
request will fail with a specific return code value. With the change to 
privlevel_floor to use vmpck_id, then you would just get the error that 
much sooner when trying to set a value that is lower than the floor.

Since I don't think the vmpck_id module parameter is a common case 
today, let's just leave that change in this patch.

Thanks,
Tom
