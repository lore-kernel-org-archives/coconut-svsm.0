Return-Path: <joro@8bytes.org>
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id E45722E0016
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 Jan 2025 09:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1736326652;
 bh=IywHqTWQU9SJ6FNJ14bWn7hHkfkObS2Llm9u5fBLumc=;
 h=Date:From:To:Subject:From;
 b=H4kn9I2LNAy5A0d10khpWZDwJvrfmBaLLXY5ab4brC/uC0wC0R9XbJv6WisWGrYZ/
 B/WJRJUNRx7bLvwg0u7Ua4WTh0uGWmEGnDtux2gvqWMfn9TX3QAPK+1WOyZ6vJpz+S
 R/qrq58rEoFahx5benwVZwJAE2hS24uFOKugBiVO1WXxzuDqq/h24twQr47LYbWZpj
 fHpqApNkHDeCuX/yiIn0xW41nbwEqIovlh+tmeSbl7niV10qwibU1QdfTFuwT5+/iw
 pqqHWwfAI9tBPsB9hCNlPzgH+ak0QK2DlGFQoSVfufvoh22enM5BN2yL62ImkcrHTn
 cHNoQWkm0lFgQ==
Date: Wed, 8 Jan 2025 09:57:31 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z349-60J8YOYVmjZ@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] Updated COCONUT-SVSM release process document
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

Attached is the updated version of the document describing the planned
COCONUT-SVSM release process. It contains all changes we discussed in
our community call on November 6th, 2024.

I also added a section describing the release cadence of development
releases, which are now expected to happen once a month.

Please have a look and provide feedback. I will also set this topic on
the agenda of todays community call.

Regards,

	Joerg

Here is the updated document:

# COCONUT-SVSM Release Process

This document describes the stages of code and releases in the COCONUT-SVSM
project and defines what users and developers can expect from each stage of
development.

## Release Stages

The COCONUT-SVSM project has three stages and a couple of sub-stages for
releasing code to its users:

* Main Development Branch
* Development Releases
* Stable Releases
  * Release Candidates
  * Final Releases
  * Release Updates

The next sections explain the expectations users can put into each stage

### Main Development Branch

This is the initial landing site for each new feature and (where applicable)
bug fixes to the COCONUT-SVSM project. The code is in the `main` branch of the
git repository at [Github](https://github.com/coconut-svsm/svsm/).

Every change must be merge to the main branch before it can be part of a
development or stable release. The only exceptions to this rule are made for
fixing bugs present in a stable release but not in the main branch.

The main branch is only intended for developers and active contributors of the
COCONUT-SVSM project.

### Development Releases

Development releases are snapshots of the main development branch. A release
is marked with a git tag in the COCONUT-SVSM Github repository. Prior to a
development release the `main` branch of the project is frozen for one week and
only bug fixes will be accepted. After the week has passed and no major known
issues remain in the code base the development release is tagged.

The development release week starts when the Technical Steering Committee (TSC)
opens a PR updating the release version and ends with this PR being merged and
the release tag being created. Release tags need to be signed by one member of
the TSC.

Development releases are intended for testing by a wider community outside of
the active contributors group, but not recommended for production use. These
releases are a marker for COCONUT-SVSM development at a given point in time and
will not receive updates for fixing issues or adding new features. 

### Stable Releases

Stable releases are code streams intended for production use. A given release
branch is created off the `main` development branch at least 4 weeks ahead
of the planned final release. During these 4 weeks the branch will only receive bug
fixes which are usually cherry-picked from the main development branch. Release
candidates will be provided every week until the final release is ready.

After the final release the branch will continue to receive updates for bug
fixes at least until the next stable release is finished.  Each release
candidate, the final release, and updates to the final release are marked with
git tags signed by a member of the TSC.

## Release Naming

Release names have the following form:

* `YYYY.MM[.NN][-TYPE]`

Where:

* `YYYY` - The calendar year of when the release is expected to happen.
* `MM` - The month of the year (1-12) when the release is expected to happen.
* `NN` - An optional increasing number for updates to a prior release.
* `-TYPE` - The release type. For development releases this will be `-devel`.
  Candidates of stable releases will have `-rcN` with `N` being an increasing
  number.

Some examples:

* `2025.01-devel` Marks a development release from January 2025.
* `2025.10-rc2` Marks the second release candidate for a stable release
  expected to be tagged in October 2025.
* `2025.10` Marks a stable release from October 2025
* `2025.10.4` Marks the fourth update to the stable release from October 2025.

## Release Cadence

There is no release cadence defined for stable releases yet.

Development releases are tagged once a month with the release PR being opened on
a Monday and the release being tagged on the following Monday. The default is
to use the first Monday of a month for opening the PR and the second Monday for
tagging the release, but this can be deviated from if needed.
