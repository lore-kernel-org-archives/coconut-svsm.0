Return-Path: <joro@8bytes.org>
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id C9FAC2A8F51
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 10:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1730798503;
 bh=W4wF5R1loM45KuyxAWoGGme2IgmcWN21siqPXbhj/vU=;
 h=Date:From:To:Subject:From;
 b=O5xs4TCAX2IU9hvcg+vL6434CdAdxd1n4Gq7iXR0Suk3RVsHlU0KU2UKfB5zWfnC5
 OnNaSUzZoU/p97I8MCKCXP3NhORi38Hqi59kY/akbwnrVuR6fOeR4CHZ6W50HeDToe
 GcsKyEKN/EXGUAyhcu9d8hlxfgSK2Kv2ksYqCgBAL2gjuBr0x4ZtFLtmxpB5pM/2me
 lS3gW5Z+lJxWD2BvQtthNBU+5XOz0In+X05FqlcZMJUQXa/cayElg2BO1kTEHUsTSt
 X5aUluRzN7LgJM61h+GRcAXyRRY9pp/YkUh4vXWab4LrGyjpcYMPHyc5YHYYXuDKiK
 5wuay6NWzT7yA==
Date: Tue, 5 Nov 2024 10:21:42 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Zynjpg7NdAj8sePr@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] [RFC] COCONUT-SVSM Release Process
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi,

Some time ago in the SVSM development call we discussed the plan to tag
releases in the COCONUT-SVSM repository. For that to make at least some
sense I started to draft up a release process document and attached it
below.

This is of course not final and we can make any kinds of changes if
people feel like it. I also plan to set this on the agenda of tomorrows
SVSM call.

Please let me know your comments and thoughts on the document. Once
there is agreement on the process I plan to submit this to the
COCONUT-SVSM repository as part of the documentation.

Thanks,

	Joerg

# COCONUT-SVSM Release Process

This document describes the stages of code and releases in the COCONUT-SVSM
projects and sets the expectations users into each stage of development.

## Release Stages

The COCONUT-SVSM project has three stages and some sub-stages for releasing
code to its users:

* Main Development Branch
* Development Releases
* Stable Releases
  * Release Candidates
  * Final Releases
  * Release Updates

The next sections explain the expectations users can put into each stage

### Main Development Branch

This is the initial landing site for each new feature and (where applicable)
bug fix to the COCONUT-SVSM project. The code is in the `main` branch of the
git repository at [Github](https://github.com/coconut-svsm/svsm/).

Every change must be in the main branch before it can be part of a development
or stable release. The only exceptions to this rule are made for fixing bugs
present in a stable release but not in the main branch.

The main branch is only intended for developers and active contributors of the
COCONUT-SVSM project.

### Development Releases

Development releases are snapshots of the main development branch. A release
is marked with a git tag in the COCONUT-SVSM Github repository. Upcoming
development releases are announced at least one week ahead of time. In the
time from the announcement to the actual release only bug fixes will be merged
into the main development branch.

Development releases are intended for testing by a wider community outside of
the active contributors, but not recommended for production use. These
releases are a marker for COCONUT-SVSM development at a given point in time
and will not receive updates for fixing issues or adding new features.

### Stable Releases

Stable releases are code streams intended for production use after the final
release. A given release is branched off the main development branch at least
4 weeks ahead of the final release. During this time the branch will only
receive bug fixes which are usually cherry-picked from the main development
branch. Release candidates will be provided every week until the final release
is ready.

After the final release the branch will continue to receive updates for bug
fixes at least until the next stable release is finished.  Each release
candidate, the final release, and updates to the final release are marked with
git tags.

## Release Naming

The naming convention for releases is defined as follows:

* `[DR]YYYY.MM[.X[-rcX]]`

Each release starts with either the letter `D` for development releases or `R`
for stable releases.

Following the initial letter is a year.month marker of the year and month the
final release is expected to happen. A release name ending after the marker is
a development or final release.

After the year.month marker of a release there can be an optional `-rcX`,
where the `X` is an increasing number starting at `1`.If present this marks
release candidates.

Alternatively there can be a dot after the year.month marker, followed by an
increasing number starting at `1`. These release names mark a release update.

Some examples of valid release names: `D2024.12`, `R2025.03-rc1`, `R2025.03`,
`R2025.03.2`. Note that development releases always end after the year.month
marker.

## Release Cadence

No release cadence is defined yet.
