Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 698642A9841
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 12:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730805832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rq6A11Nz1i/Qyl0NCl6dZFeMrI8J5iVxdEKebB+/95E=;
 b=CEw+CqW/YetdaC5NEBhQh0TKYbo4oZCP2fAJJOQE/0qg2+zm+y/wU+2URKlzauCn8rxk7e
 YT4RmwCRJ+pYtBvkgrGFdWN44hf82J8Pry9H81GI0NBdh51KCDhi9DsNeel3UGOU89b15Y
 JAoLLB6a3is8fqEm6HIDbECMdkYU2ec=
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-539ec1a590fso3578194e87.0
 for <svsm-devel@coconut-svsm.dev>; Tue, 05 Nov 2024 03:23:51 -0800 (PST)
Date: Tue, 5 Nov 2024 12:23:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
References: <Zynjpg7NdAj8sePr@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <Zynjpg7NdAj8sePr@8bytes.org>
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] [RFC] COCONUT-SVSM Release Process
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

On Tue, Nov 05, 2024 at 10:21:42AM +0100, Jörg Rödel wrote:
>Hi,
>
>Some time ago in the SVSM development call we discussed the plan to tag
>releases in the COCONUT-SVSM repository. For that to make at least some
>sense I started to draft up a release process document and attached it
>below.
>
>This is of course not final and we can make any kinds of changes if
>people feel like it. I also plan to set this on the agenda of tomorrows
>SVSM call.
>
>Please let me know your comments and thoughts on the document. Once
>there is agreement on the process I plan to submit this to the
>COCONUT-SVSM repository as part of the documentation.
>
>Thanks,
>
>	Joerg
>
># COCONUT-SVSM Release Process
>
>This document describes the stages of code and releases in the COCONUT-SVSM
>projects and sets the expectations users into each stage of development.
>
>## Release Stages
>
>The COCONUT-SVSM project has three stages and some sub-stages for releasing
>code to its users:
>
>* Main Development Branch
>* Development Releases
>* Stable Releases
>  * Release Candidates
>  * Final Releases
>  * Release Updates
>
>The next sections explain the expectations users can put into each stage
>
>### Main Development Branch
>
>This is the initial landing site for each new feature and (where applicable)
>bug fix to the COCONUT-SVSM project. The code is in the `main` branch of the
>git repository at [Github](https://github.com/coconut-svsm/svsm/).
>
>Every change must be in the main branch before it can be part of a development
>or stable release. The only exceptions to this rule are made for fixing bugs
>present in a stable release but not in the main branch.
>
>The main branch is only intended for developers and active contributors of the
>COCONUT-SVSM project.
>
>### Development Releases
>
>Development releases are snapshots of the main development branch. A release
>is marked with a git tag in the COCONUT-SVSM Github repository. Upcoming
>development releases are announced at least one week ahead of time. In the
>time from the announcement to the actual release only bug fixes will be merged
>into the main development branch.
>
>Development releases are intended for testing by a wider community outside of
>the active contributors, but not recommended for production use. These
>releases are a marker for COCONUT-SVSM development at a given point in time
>and will not receive updates for fixing issues or adding new features.
>
>### Stable Releases
>
>Stable releases are code streams intended for production use after the final
>release. A given release is branched off the main development branch at least
>4 weeks ahead of the final release. During this time the branch will only
>receive bug fixes which are usually cherry-picked from the main development
>branch. Release candidates will be provided every week until the final 
>release
>is ready.
>
>After the final release the branch will continue to receive updates for bug
>fixes at least until the next stable release is finished.  Each release
>candidate, the final release, and updates to the final release are marked with
>git tags.
>
>## Release Naming
>
>The naming convention for releases is defined as follows:
>
>* `[DR]YYYY.MM[.X[-rcX]]`
>
>Each release starts with either the letter `D` for development releases or `R`
>for stable releases.
>
>Following the initial letter is a year.month marker of the year and month the
>final release is expected to happen. A release name ending after the marker is
>a development or final release.
>
>After the year.month marker of a release there can be an optional `-rcX`,
>where the `X` is an increasing number starting at `1`.If present this marks
                                                        ^ missing space
>release candidates.
>
>Alternatively there can be a dot after the year.month marker, followed by an
>increasing number starting at `1`. These release names mark a release update.
>
>Some examples of valid release names: `D2024.12`, `R2025.03-rc1`, `R2025.03`,
>`R2025.03.2`. Note that development releases always end after the year.month
>marker.

My concern is having two types of release in the same month, e.g.
R2025.03 and D2025.03.

How do we know which one happened sooner or later?

Or do we never expect to have a stable release and a development
release in the same month?

I'm not sure if using YYYY.NN is better, where NN is a counter shared
among all release types (D or R).


Another option is to increase the counter only for a stable release
(or use the month in this case), and for development releases, add a
few digits of the SHA-1 of the commit, something like this:

R2025.03
D2025.03-g9ec10216
D2025.03-g5f4987a1
D2025.03-gbb6e9222
R2025.04

Or just use the year and SHA-1 for development releases:

R2025.03
D2025-g9ec10216
D2025-g5f4987a1
D2025-gbb6e9222
R2025.04

The rest LGTM.

Thanks,
Stefano

>
>## Release Cadence
>
>No release cadence is defined yet.
>-- 
>Svsm-devel mailing list
>Svsm-devel@coconut-svsm.dev
>https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
>

