Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1741791273;
 bh=efzvtfXAaf8YfaFhfEbQQDYAL7MnLWFF81tjLJnZD3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A1N5gVmfpzilvbmgYRzXd2KzuP6EjxBN15ERNl9677GuOEWSh9PBhjSN1MnDuuaoa
 8wJMlHz3Xd9WYFRhGGpqsWyoWd62jD0X3LeGYX+mfB+styC6bGTrEEFIaq4Ig1cR4w
 ivqJhAQQhQwllMTS43lRvz5aJQZsOuKN2OR6jVILqZI8vXiNFQ5HbzAyJ6q9uz8Ly9
 29kAcL4evnIiy62YEnk7NAHX2zYiPc3Q0ikL0hVfZo3bKRH5g2W8uZpkfubG1GkLja
 iIdNxSM5PGiOD6D1Mk7anVN7cupSl1S5+EexJhCcJvV8fRLN3Z42+Nyq9TCUfay2tf
 ZEk7zSRYHwyoA==
Date: Wed, 12 Mar 2025 15:54:32 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <Z9GgKF7w6Qa-HpIM@8bytes.org>
References: <Z9FSCnYWkV0g12R0@8bytes.org>
 <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com>
 <Z9FbpnCBjpYgOYI3@8bytes.org>
 <c289de63-1723-4c00-9c3d-69628b80bec8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c289de63-1723-4c00-9c3d-69628b80bec8@amd.com>
Subject: Re: [svsm-devel] SVSM Host Kernel KVM Update Required
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: svsm-devel@coconut-svsm.dev

On Wed, Mar 12, 2025 at 03:33:15PM +0100, Gupta, Pankaj wrote:
> So, the support was not working and got triggered when config check in
> 'determine_cet_support()' was removed.

Right, actually it was broken before already when building with the
shadow-stack feature. But since this was not enabled by default nobody
noticed. With the feature check removed it triggered for everyone.

Regards,

	Joerg
