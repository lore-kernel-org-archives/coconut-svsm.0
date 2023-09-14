Return-Path: <joro@8bytes.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1694690397;
 bh=fcFbbhumxDboHyNN7Cuohv0HjvbDm5M6tg8tTIpIwbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0Vak1M98i+nBVe/Km1nVs/1cslIAJyL5YV7Lsm2dDejeiruZgno7RtO9UywbCNbMR
 nMz5lllqNjQcP+QRzmTnhbFA9X2pLcvTBIx3UcJIjrKw2gUYFPT2L6hCI0AeC+qLn/
 CstOI+AvM9uaut53yz2sqLJu13TNieasutCgGe+Ijs5BT+pb5RfWUnuHLCzNBr234n
 Y/p1LGFVAUYPtBRJkGfE2Du6db+e8cA/j2LAjYE8GS5CgaijYsNE6IoPJlqfK5lali
 YHYJ/A8a1zbQ88OLfYf72rXvH7ni9OsgBbKyHmafOMcm8XpQ2OYlZePgKR3O8T5FAF
 bK4/nEtehYrUA==
Date: Thu, 14 Sep 2023 13:19:56 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Message-ID: <ZQLsXABCSv2JME-V@8bytes.org>
References: <CA+bRGFrbQPcVKs4suEkM1c-5GxqGYrxLp48DLBT3knwgx=nABA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+bRGFrbQPcVKs4suEkM1c-5GxqGYrxLp48DLBT3knwgx=nABA@mail.gmail.com>
Subject: Re: [svsm-devel] Notes: SVSM Call 2023-09-13
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Oliver Steffen <osteffen@redhat.com>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Hi,

thanks a lot for taking notes, Oliver. Much appreciated!

And appologies for the abrupt ending, next time we will use another
meeting tool which does not have the limitations of unpaid Google Meet.

Regards,

	Joerg

On Wed, Sep 13, 2023 at 08:48:13PM +0200, Oliver Steffen wrote:
> Hi all,
> I tried to capture the conversation during the meeting as best I
> could. But it definitely has some holes, sorry. We talked about a lot of
> things during this 1h.
> 
> Please feel free to comment, correct, and extend where necessary.
> 
> ---
> 
> Recording of the meeting was not possible due to technical reasons.
> 
> The introduction round was skipped due to the number of participants
> (>20).
> 
> Agenda:
> 
> - Jörg: Goal of this call is to raise awareness in the community on who
>   is doing what and to sync on plans and wishes for the project.
> 
> Development update from SUSE:
>   - Work on CPL3 support ongoing
>     Jörg showed a diagram of the virtual memory management data
>     structures.
> 
>    @Jörg, can you describe it again here? I was not able to correctly
>      capture this during the meeting. Also please attach the diagram :-)
> 
> Crypto support
> 
>   - Claudio's PR uses the RustCrypto crate, which is fine for now.
>      Later, we need something different to get certification.
>   - Jörg: We could create a separate crypto module, that could be in C,
>     and make use of well established libraries
>   - Claudio: could be a good idea, but this needs more infrastructure
>     for exchanging data between the modules, etc.
>   - James: IPC vs library based approach, IPC might have architectural
>     problems if used in a kernel (as the SVSM is)
>   - Jörg: OTOH, including crypto lib into each module requires
>     certification for each module. We should look at the performance
>     impact of IPC, see if it is feasible.
>     We could use shared memory between tasks.
>   - Nicolai: We might need an object file for FIPS certification,
>     a static Rust crate might not be sufficient.
>   - Jörg: We would need a userspace library linker
>   - James: Look at the a.out format.
>   - Carlos: Separate libraries would also help with fuzzing.
> 
>   The discussion is to be continued on the mailing list.
> 
> Launch protocol
> 
>   Jörg talked about the IGVM file format from Microsoft
>   (https://github.com/microsoft/igvm)
>   - It is a hypervisor independent description of a CVM
>   - usable for both AMD SEV-SNP and Intel TDX
>   - It is under MIT license
>   - Comes with a Rust crate (for use on the hypervisor side)
>   - This could be a replacement for the current launch protocol
>   - With this we could get rid of the stage2 loader
>   - Would not have to touch Qemu's fw_cfg mechanism in Coconut
>   - The implementation on the Qemu side is still missing.
>   - The question is, will this be adopted widely?
>   - It might become a maintenance burden if nobody else is using it.
>   - OVMF also needs to adopt it.
> 
> Priorities of features
> 
>  - Jörg:
>     - CPL3 has highest priority
>     - it is hard to parallelize this work across people
>     - but other features can be developed in parallel
>  - Jörg was asked to share diagrams or description of the intended CPL3
>    design, so the community can discuss in parallel.
>  - Would it help to implement a simplified CPL3 support as a first step?
>    So that work on dependent parts (vTPM module, for example) can start
>    sooner?
> 
> Governance
> 
>   - Jörg: From face to face discussions at KVM forum:
>     - A model of 3 top-level maintainers from different entities.
>     - But how to choose?
>   - Candidates should have a significant track record in the project
>     (code contribution and/or reviews)
>   - Which entities are to consider?
>   - Claudio volunteered to look after the vTPM implementation, but so
>     far no other candidates.
>   - Currently approx. 14 contributions according to GitHub, many have
>     very few commits.
>   - Maybe we should wait some more time and see who is active in the
>     project?
> 
> The call ended abruptly due to the time limit of 1h imposed by gmeet.
> 
> 
> Oliver
> 
> -- 
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
