Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1742490345;
 bh=nN15trT2JYopnU53x6z5j+S2SZvD5SBfowH49dGtARs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=laDfOG1KrSkG1ENgpowrmpttjkpPIC5K4+NI/eCYhKJlNREVm+nQud+fLBnazuc2s
 qKkzI7lAOwRNItaZkBvFeIRPOxe03fnBl5Vc+XQwGxkCOlljRkMkXQyqn4FnkRFq6k
 30wGiZ/T7MZIa+Tj2CCWLT8z3qWCge+F7suUyfy4uwD+KyoeyTtqO48J7dHVTrn2fZ
 W3cniT23ayMIyIHfXg4nPec4WJ0XBQ+spLI2kQuHp54Zu0+qvK9xPJaFLAbUUW2tYs
 fJ2qK+Ca10Pb4MeV1q2eZI6jYDmy1qo+SV01A8xGAxeHj2LXfckyd9acYsDsdpdMfe
 O5ROuqHt+sKfA==
Date: Thu, 20 Mar 2025 18:05:44 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z9xK6ACrFT5PTmrJ@8bytes.org>
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
Subject: Re: [svsm-devel] Call for mentors/ideas for Google Summer of Code
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: svsm-devel@coconut-svsm.dev

Hi Stefano,

On Thu, Mar 20, 2025 at 10:25:38AM +0100, Stefano Garzarella wrote:
> the QEMU community has kindly offered to use their GSoC as an umbrella
> for ideas regarding SVSM as well, since there are many students
> interested in programming in Rust.

This is a great opportunity for our SVSM project. I have a few ideas for
projects I am happily be the mentor for those:

1. Implement proper CPUID Feature Handling Framework for COCONUT

* Extend x86-cpuid project to generate Rust code usable by SVSM.
* Integrate code into the SVSM and convert existing checks.
* Re-work checking for required features.
* Bring changes upstream to their respective projects (x86-cpuid and
  SVSM).
* (Not sure if this is big enough for a GSoC project).

2. Observability Device and Linux Support

* Design a protocol for SVSM observability.
* Implement SVSM and Linux kernel + user-mode side for getting and
  presenting the data.

3. Encryption and simple File-System Layer for Block Storage device

* Title says it all
* Maybe good for someone else to mentor as well.


Regards,

	Joerg
