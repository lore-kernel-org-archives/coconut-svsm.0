Return-Path: <jejb@linux.ibm.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Z8bZG1R++6NentQ1IocUMD15JpigmH7esz2Bdn+cJG4=;
 b=FFdeWL9kp2HZD1FKdM7dhaL145SZfC6q1Az9zApLJEoXAiLJ5wlFNqdSio8fnHcBNfs4
 oalJwcGF/YAYj73wcED/GHdwJ/TAwEXhNnnEzjLfyl/VxIScsg7PbqZ9Rq5V1rPlsPWE
 +cpINv/VxZGQPJ2+1a1ahD9s2lRoG1RB+qB/Pi63vS0NMnk+yA/7vIXfvEo+u80a3JUF
 QG6DAzA5CYLpzO7C6hKNDWHPU68xCmE2ZQTO2PLLFvUrLz5mX2Uy/QbG1veqU9+LfN65
 ODbRoBWmCYEimusEuhQOlZFVItghFgEk/xFGg/7KTdb1psl4P9TufvnZ0fwIsbEjVHxV 0A== 
Message-ID: <74ff4091f24370033a349b72ba222a30ed039b6f.camel@linux.ibm.com>
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
Date: Wed, 03 Apr 2024 08:18:46 -0400
In-Reply-To: <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
 <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [svsm-devel] SVSM Development Call April 3rd, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Yao, Jiewen" <jiewen.yao@intel.com>, =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

On Wed, 2024-04-03 at 11:59 +0000, Yao, Jiewen wrote:
> Hi Jorg
> Probably you already notice that I have raised the question on vTPM
> interface in coconut-svsm.
> 
> I have explained how we did the POC in a secure way for TD-
> partitioning with TPM CRB buffer.
> Jeremi Piotrowski also explained the mechanism to expose vTPM through
> TPM CRB MMIO. In Intel, we still don't understand why SVSM must use a
> specific vTPM protocol, but not use TCG defined TPM2 CRB buffer
> directly.

Nobody has said *must*.  The enlightened interface was designed after
we had all the trouble with the CRB one outlined in the previous email
thread, so that's what this pull request has.  However, this being open
source nothing prevents you submitting a pull request for a functioning
CRB interface if that's what you want.

James

