Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1734520619;
 bh=PX5cv9Kfb4aU8C77Y0/ER5Hf8TW/vCU7nMN8JiKiAHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xLesmLh/2hcL1zi9z9nuzUjpcBgES4sjgX+GKrKJ5rGHTQFubqlk3+6fCGACbvXC1
 l4TeHcRmq+vg8kkfMWvciZccDSYrwYL4RVxxkshDxKkZXc1FOouXCr1DsEu5/xqvfG
 xw9Tt0yNlsFPFObGxQINX2XbrgctcfO49akJx91gsQAq/Gdm0lS8N9ZvcTwrTosMjE
 bvV2SHx0ulL//0D3IM57sbX6dFtBXdhv5wHiKIOJh9zj1bp1Zp1CihXqQfIg0PL472
 OXrlr/Ex211jr17hNWlIS13kpr4DfKz+SqZmYocA8O9Cv1/+EE5vbfA9NJC0KYxn30
 BX+nvs73naeNg==
Date: Wed, 18 Dec 2024 12:16:58 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z2KvKpdviLiSQ-4b@8bytes.org>
References: <Z2GlkOf63fGpsks2@8bytes.org>
 <CAGxU2F53byEE4gp6VTos_eS-=1tnLE2mvMk=wHO7FsXWMysSVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F53byEE4gp6VTos_eS-=1tnLE2mvMk=wHO7FsXWMysSVg@mail.gmail.com>
Subject: Re: [svsm-devel] Linux and QEMU branches updated
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: svsm-devel@coconut-svsm.dev, Oliver Steffen <osteffen@redhat.com>

Hi Stefano,

On Wed, Dec 18, 2024 at 12:09:17PM +0100, Stefano Garzarella wrote:
> I noticed that in the svsm branch of edk2 the TPM driver is no longer
> there, so I tried the PR [1] that Oliver opened upstream, and it seems
> to be working:

Yes, please also open a PR against the svsm branch of our EDK2 fork. I
wll merge it then so that we get back the vTPM driver.

Regards,

	Joerg
