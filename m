Return-Path: <sathyanarayanan.nkuppuswamy@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 93BBC1CA3CF
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 May 2024 05:40:57 +0200 (CEST)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-57230faeb81so4513117a12.0
 for <svsm-devel@coconut-svsm.dev>; Wed, 01 May 2024 20:40:57 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056402428600b0057266474cd2sm31358edc.15.2024.05.01.20.40.55
 for <svsm-devel@coconut-svsm.dev>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 20:40:55 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56e6affdd21so2864209a12.3
 for <svsm-devel@coconut-svsm.dev>; Wed, 01 May 2024 20:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
 <CAC41dw-g2=jKkevGOJUqnzYTpxQ8+Z_JxnNNuoLR+CM_yqfRzA@mail.gmail.com>
 <6632a2e0738d_1384629442@dwillia2-mobl3.amr.corp.intel.com.notmuch>
In-Reply-To: <6632a2e0738d_1384629442@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Wed, 1 May 2024 20:40:43 -0700
Message-ID: <CAC41dw_Dnm=suyue+jFx2z8f+YT1K_aWfQEijrU=WH4OLWpOqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] [PATCH v4 13/15] x86/sev: Take advantage of
 configfs visibility support in TSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On Wed, May 1, 2024 at 1:15=E2=80=AFPM Dan Williams <dan.j.williams@intel.c=
om> wrote:
>
> Kuppuswamy Sathyanarayanan wrote:
> > On Wed, Apr 24, 2024 at 9:00=E2=80=AFAM Tom Lendacky <thomas.lendacky@a=
md.com> wrote:
> > >
> > > The TSM attestation report support provides multiple configfs attribu=
te
> > > types (both for standard and binary attributes) to allow for addition=
al
> > > attributes to be displayed for SNP as compared to TDX. With the abili=
ty
> > > to hide attributes via configfs, consoldate the multiple attribute gr=
oups
> > > into a single standard attribute group and a single binary attribute
> > > group. Modify the TDX support to hide the attributes that were previo=
usly
> > > "hidden" as a result of registering the selective attribute groups.
> > >
> > > Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [..]
> > > + */
> > > +enum tsm_attr_index {
> > > +       TSM_REPORT_GENERATION,
> >
> > Do we need an index for the generation attribute ? Since it is a core
> > function, we can allow it by default.
>
> That is up to the is_visible() callback to decide the declaration of
> which index corresponds to which attribute is just static information.
>
> >
> > > +       TSM_REPORT_PROVIDER,
> >
> > Same as above.
>
> These numbers need to match the array indices of tsm_report_attrs.
>
> Your suggestion makes the declaration of tsm_report_attrs more
> difficult:
>
>  static struct configfs_attribute *tsm_report_attrs[] =3D {
>     [TSM_REPORT_GENERATION] =3D &tsm_report_attr_generation,
>     [TSM_REPORT_PROVIDER] =3D &tsm_report_attr_provider,
>     [TSM_REPORT_PRIVLEVEL] =3D &tsm_report_attr_privlevel,
>     [TSM_REPORT_PRIVLEVEL_FLOOR] =3D &tsm_report_attr_privlevel_floor,
>     NULL,
>  };
>
> ...because then the definition of TSM_REPORT_PRIVLEVEL would need to
> know how many attributes precede it in the array. So, defining it this
> way makes it more robust against future changes that want to
> add/delete/reorder attributes in the array.

Got it. Makes sense. It is simpler to do it this way. I am just
worried that the vendor driver might mistakenly disable some core
attributes like inblob, outblob, provider and generation.
