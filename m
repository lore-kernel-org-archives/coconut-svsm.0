Return-Path: <Carlos.Bilbao@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E45471A15D6
 for <svsm-devel@coconut-svsm.dev>; Tue, 12 Sep 2023 16:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA8wM9dx2ThtWytZ5r61lIvCKzdRmD7m2fFq0e6QvFk=;
 b=S9enj5oaiTfLp4VPVYowdsbi6nv0w33nFdPyS63HFqn3CbEPyRAc+C0J9vblyA4Lsm0yoawn7WytOQgnBnTqgYI7+92j+CLKX6mdxD3MS06iB1f3iFkPvFwmU0ep10il889uU/l1n1uKNB+bZeB3sk7HjJLe/T31NuRCKnVvFHo=
Message-ID: <62dd0d24-8034-4795-9725-dce0470a03c6@amd.com>
Date: Tue, 12 Sep 2023 09:32:12 -0500
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: [svsm-devel] elf: Document ELF file handling
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev
Cc: "Giani, Dhaval" <dhaval.giani@amd.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, nstange@suse.de, carlos.lopez@suse.com

Hello folks,

I wanted to inform you that I have just updated my pull request (PR #89
[1]) with a new commit. This update focuses on documenting the ELF file
handling and related structures, addressing a part of issue #74 "Document
COCONUT-SVSM" [2].

I paste the patch below for your reference. I have CC'd the original code
author, Nicolai.

Please feel free to share your thoughts. To avoid any bottlenecks, I will
wait until this PR is merged (with any necessary modifications), before I
proceed with additional code documentation.

Thanks,
Carlos

[1] https://github.com/coconut-svsm/svsm/pull/89
[2] https://github.com/coconut-svsm/svsm/issues/74

---
Subject: [PATCH] elf: Document ELF files handling

Document ELF files handling, code and structures, including some function
usage examples. This relates to issue #74 titled "Document COCONUT-SVSM".

Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
  src/elf/mod.rs | 932 ++++++++++++++++++++++++++++++++++++++++++++++++-
  1 file changed, 920 insertions(+), 12 deletions(-)

diff --git a/src/elf/mod.rs b/src/elf/mod.rs
index 39731f8..2ac7646 100644
--- a/src/elf/mod.rs
+++ b/src/elf/mod.rs
@@ -17,6 +17,23 @@ use core::fmt;
  use core::matches;
  use core::mem;

+/// Errors while working with ELF files, e.g. invalid, unmaped or unbacked
+/// address ranges, invalid ELF type or endianness. The `fmt::Display` trait
+/// is implemented to allow formatting error instances.
+///
+/// # Examples
+///
+/// To format an `ElfError` as a string, you can use the `to_string()` method
+/// or the `format!` macro, like this:
+///
+/// ```rust
+/// use your_module::ElfError;
+///
+/// let error = ElfError::InvalidAddressRange;
+/// let error_message = error.to_string();
+///
+/// assert_eq!(error_message, "invalid ELF address range");
+///
  #[derive(Debug)]
  pub enum ElfError {
      FileTooShort,
@@ -182,6 +199,10 @@ pub type Elf64Xword = u64;
  pub type Elf64Sxword = i64;
  pub type Elf64char = u8;

+/// Represents a 64-bit ELF virtual address range.
+///
+/// In mathematical notation, the range is [vaddr_begin, vaddr_end)
+///
  #[derive(PartialEq, Eq, Debug, Default)]
  pub struct Elf64AddrRange {
      pub vaddr_begin: Elf64Addr,
@@ -189,10 +210,38 @@ pub struct Elf64AddrRange {
  }

  impl Elf64AddrRange {
+    /// Returns the length of the virtual address range, calculated as the
+    /// difference between `vaddr_end` and `vaddr_begin`.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use your_module::{Elf64AddrRange, Elf64Addr};
+    ///
+    /// let range = Elf64AddrRange {
+    ///     vaddr_begin: Elf64Addr(0x1000),
+    ///     vaddr_end: Elf64Addr(0x1100),
+    /// };
+    ///
+    /// assert_eq!(range.len(), 0x100);
      pub fn len(&self) -> Elf64Xword {
          self.vaddr_end - self.vaddr_begin
      }

+    /// Checks if the virtual address range is empty, i.e.
+    /// if its length is zero.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use your_module::{Elf64AddrRange, Elf64Addr};
+    ///
+    /// let range1 = Elf64AddrRange {
+    ///     vaddr_begin: Elf64Addr(0x1000),
+    ///     vaddr_end: Elf64Addr(0x1000),
+    /// };
+    ///
+    /// assert!(range1.is_empty());
      pub fn is_empty(&self) -> bool {
          self.len() == 0
      }
@@ -201,6 +250,28 @@ impl Elf64AddrRange {
  impl convert::TryFrom<(Elf64Addr, Elf64Xword)> for Elf64AddrRange {
      type Error = ElfError;

+    /// Tries to create an `Elf64AddrRange` from a tuple of `(Elf64Addr, 
Elf64Xword)`.
+    ///
+    /// This implementation calculates the `vaddr_end` based on the 
`vaddr_begin`
+    /// and the provided `Elf64Xword` size, ensuring that the range is valid.
+    ///
+    /// # Errors
+    ///
+    /// Returns an `ElfError::InvalidAddressRange` if the calculation of 
`vaddr_end`
+    /// results in an invalid address range.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use your_module::{Elf64AddrRange, Elf64Addr, Elf64Xword};
+    ///
+    /// let vaddr_begin = Elf64Addr(0x1000);
+    /// let size = Elf64Xword(0x100);
+    /// let range = Elf64AddrRange::try_from((vaddr_begin, size)).unwrap();
+    ///
+    /// assert_eq!(range.vaddr_begin, Elf64Addr(0x1000));
+    /// assert_eq!(range.vaddr_end, Elf64Addr(0x1100));
+    /// ```
      fn try_from(value: (Elf64Addr, Elf64Xword)) -> Result<Self, 
Self::Error> {
          let vaddr_begin = value.0;
          let size = value.1;
@@ -214,6 +285,30 @@ impl convert::TryFrom<(Elf64Addr, Elf64Xword)> for 
Elf64AddrRange {
      }
  }

+/// Compares two `Elf64AddrRange` instances for partial ordering. It returns
+/// `Some(Ordering)` if there is a partial order, and `None` if there is no
+/// order (i.e., if the ranges overlap without being equal).
+///
+/// # Arguments
+///
+/// * `other` - The other `Elf64AddrRange` to compare to.
+///
+/// # Returns
+///
+/// - `Some(Ordering::Less)` if `self` is less than `other`.
+/// - `Some(Ordering::Greater)` if `self` is greater than `other`.
+/// - `Some(Ordering::Equal)` if `self` is equal to `other`.
+/// - `None` if there is no partial order (i.e., ranges overlap but are 
not equal).
+///
+/// # Examples
+///
+/// ```rust
+/// use your_module::Elf64AddrRange;
+///
+/// let range1 = Elf64AddrRange { vaddr_begin: Elf64Addr(0x1000), 
vaddr_end: Elf64Addr(0x1100) };
+/// let range2 = Elf64AddrRange { vaddr_begin: Elf64Addr(0x1100), 
vaddr_end: Elf64Addr(0x1200) };
+///
+/// assert_eq!(range1.partial_cmp(&range2), Some(Ordering::Less));
  impl cmp::PartialOrd for Elf64AddrRange {
      fn partial_cmp(&self, other: &Elf64AddrRange) -> Option<cmp::Ordering> {
          if self.vaddr_end <= other.vaddr_begin {
@@ -228,6 +323,8 @@ impl cmp::PartialOrd for Elf64AddrRange {
      }
  }

+/// This struct represents a parsed 64-bit ELF file. It contains information
+/// about the ELF file's header, load segments, dynamic section, and more.
  #[derive(Default, Debug)]
  pub struct Elf64FileRange {
      pub offset_begin: usize,
@@ -237,6 +334,26 @@ pub struct Elf64FileRange {
  impl convert::TryFrom<(Elf64Off, Elf64Xword)> for Elf64FileRange {
      type Error = ElfError;

+    /// Tries to create an `Elf64FileRange` from a tuple of `(Elf64Off, 
Elf64Xword)`.
+    ///
+    ///
+    /// # Errors
+    ///
+    /// Returns an `ElfError::InvalidFileRange` if the calculation of 
`offset_end`
+    /// results in an invalid file range.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use your_module::Elf64FileRange;
+    ///
+    /// let offset_begin = Elf64Off(0x1000);
+    /// let size = Elf64Xword(0x100);
+    /// let range = Elf64FileRange::try_from((offset_begin, size)).unwrap();
+    ///
+    /// assert_eq!(range.offset_begin, 0x1000);
+    /// assert_eq!(range.offset_end, 0x1100);
+    ///
      fn try_from(value: (Elf64Off, Elf64Xword)) -> Result<Self, Self::Error> {
          let offset_begin = usize::try_from(value.0).map_err(|_| 
ElfError::InvalidFileRange)?;
          let size = usize::try_from(value.1).map_err(|_| 
ElfError::InvalidFileRange)?;
@@ -250,18 +367,39 @@ impl convert::TryFrom<(Elf64Off, Elf64Xword)> for 
Elf64FileRange {
      }
  }

+/// This struct represents a parsed 64-bit ELF file. It contains information
+/// about the ELF file's header, load segments, dynamic section, and more.
  #[derive(Default, Debug)]
  pub struct Elf64File<'a> {
+    /// Buffer containing the ELF file data
      elf_file_buf: &'a [u8],
+    /// The ELF file header
      elf_hdr: Elf64Hdr,
+    /// The load segments present in the ELF file
      load_segments: Elf64LoadSegments,
+    /// The maximum alignment requirement among load segments
      max_load_segment_align: Elf64Xword,
+    /// THe section header string table may not be present
      #[allow(unused)]
      sh_strtab: Option<Elf64Strtab<'a>>,
      dynamic: Option<Elf64Dynamic>,
  }

  impl<'a> Elf64File<'a> {
+    /// This method takes a byte buffer containing the ELF file data and 
parses
+    /// it into an `Elf64File` struct, providing access to the ELF file's 
information.
+    ///
+    /// # Errors
+    ///
+    /// Returns an `ElfError` if there are issues parsing the ELF file.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use your_module::Elf64File;
+    ///
+    /// let elf_file = Elf64File::read(&elf_file_buf).unwrap();
+    /// ``
      pub fn read(elf_file_buf: &'a [u8]) -> Result<Self, ElfError> {
          let mut elf_hdr = Elf64Hdr::read(elf_file_buf)?;

@@ -375,6 +513,20 @@ impl<'a> Elf64File<'a> {
          })
      }

+    /// Reads an ELF Program Header (Phdr) from the ELF file buffer.
+    ///
+    /// This function reads an ELF Program Header (Phdr) from the provided 
ELF file buffer
+    /// based on the given index `i` and the ELF file header `elf_hdr`.
+    ///
+    /// # Arguments
+    ///
+    /// * `elf_file_buf` - The byte buffer containing the ELF file data.
+    /// * `elf_hdr` - The ELF file header.
+    /// * `i` - The index of the Phdr to read.
+    ///
+    /// # Returns
+    ///
+    /// The ELF Program Header (Phdr) at the specified index.
      fn read_phdr_from_file(elf_file_buf: &'a [u8], elf_hdr: &Elf64Hdr, i: 
Elf64Half) -> Elf64Phdr {
          let phdrs_off = usize::try_from(elf_hdr.e_phoff).unwrap();
          let phdr_size = usize::try_from(elf_hdr.e_phentsize).unwrap();
@@ -384,6 +536,20 @@ impl<'a> Elf64File<'a> {
          Elf64Phdr::read(phdr_buf)
      }

+    /// Verifies the integrity of an ELF Program Header (Phdr).
+    ///
+    /// This function verifies the integrity of an ELF Program Header 
(Phdr). It checks
+    /// if the Phdr's type is not PT_NULL and performs additional 
validation to ensure
+    /// the header is valid.
+    ///
+    /// # Arguments
+    ///
+    /// * `phdr` - The ELF Program Header (Phdr) to verify.
+    /// * `elf_file_buf_len` - The length of the ELF file buffer.
+    ///
+    /// # Errors
+    ///
+    /// Returns an `Err(ElfError)` if the Phdr is invalid.
      fn verify_phdr(phdr: &Elf64Phdr, elf_file_buf_len: usize) -> 
Result<(), ElfError> {
          if phdr.p_type == Elf64Phdr::PT_NULL {
              return Ok(());
@@ -401,10 +567,35 @@ impl<'a> Elf64File<'a> {
          Ok(())
      }

+    /// Reads an ELF Program Header (Phdr) from the ELF file.
+    ///
+    /// This method reads an ELF Program Header (Phdr) from the ELF file 
based on the
+    /// given index `i`.
+    ///
+    /// # Arguments
+    ///
+    /// * `i` - The index of the Phdr to read.
+    ///
+    /// # Returns
+    ///
+    /// The ELF Program Header (Phdr) at the specified index.
      fn read_phdr(&self, i: Elf64Half) -> Elf64Phdr {
          Self::read_phdr_from_file(self.elf_file_buf, &self.elf_hdr, i)
      }

+    /// Checks if the section header table is within the ELF file bounds.
+    ///
+    /// This function verifies that the section header table is within the 
bounds of
+    /// the ELF file. It checks the offsets and sizes in the ELF file header.
+    ///
+    /// # Arguments
+    ///
+    /// * `elf_hdr` - The ELF file header.
+    /// * `elf_file_buf_len` - The length of the ELF file buffer.
+    ///
+    /// # Errors
+    ///
+    /// Returns an `Err(ElfError)` if the section header table is out of 
bounds.
      fn check_section_header_table_bounds(
          elf_hdr: &Elf64Hdr,
          elf_file_buf_len: usize,
@@ -425,6 +616,20 @@ impl<'a> Elf64File<'a> {
          Ok(())
      }

+    /// Reads an ELF Section Header (Shdr) from the ELF file buffer.
+    ///
+    /// This function reads an ELF Section Header (Shdr) from the provided 
ELF file buffer
+    /// based on the given index `i` and the ELF file header `elf_hdr`.
+    ///
+    /// # Arguments
+    ///
+    /// * `elf_file_buf` - The byte buffer containing the ELF file data.
+    /// * `elf_hdr` - The ELF file header.
+    /// * `i` - The index of the Shdr to read.
+    ///
+    /// # Returns
+    ///
+    /// The ELF Section Header (Shdr) at the specified index.
      fn read_shdr_from_file(elf_file_buf: &'a [u8], elf_hdr: &Elf64Hdr, i: 
Elf64Word) -> Elf64Shdr {
          let shdrs_off = usize::try_from(elf_hdr.e_shoff).unwrap();
          let shdr_size = usize::try_from(elf_hdr.e_shentsize).unwrap();
@@ -434,6 +639,21 @@ impl<'a> Elf64File<'a> {
          Elf64Shdr::read(shdr_buf)
      }

+    /// Verifies the integrity of an ELF Section Header (Shdr).
+    ///
+    /// This function verifies the integrity of an ELF Section Header 
(Shdr). It checks
+    /// if the Shdr's type is not SHT_NULL and performs additional 
validation to ensure
+    /// the header is valid.
+    ///
+    /// # Arguments
+    ///
+    /// * `shdr` - The ELF Section Header (Shdr) to verify.
+    /// * `elf_file_buf_len` - The length of the ELF file buffer.
+    /// * `shnum` - The number of section headers.
+    ///
+    /// # Errors
+    ///
+    /// Returns an `Err(ElfError)` if the Shdr is invalid.
      fn verify_shdr(
          shdr: &Elf64Shdr,
          elf_file_buf_len: usize,
@@ -459,19 +679,94 @@ impl<'a> Elf64File<'a> {
          Ok(())
      }

+    /// Reads an ELF Section Header (Shdr) from the ELF file.
+    ///
+    /// This method reads an ELF Section Header (Shdr) from the ELF file 
based on the
+    /// given index `i`.
+    ///
+    /// # Arguments
+    ///
+    /// * `i` - The index of the Shdr to read.
+    ///
+    /// # Returns
+    ///
+    /// The ELF Section Header (Shdr) at the specified index.
      fn read_shdr(&self, i: Elf64Word) -> Elf64Shdr {
          Self::read_shdr_from_file(self.elf_file_buf, &self.elf_hdr, i)
      }

+    /// Creates an iterator over ELF Section Headers (Shdrs) in the ELF file.
+    ///
+    /// This method creates an iterator over ELF Section Headers (Shdrs) 
in the ELF file.
+    /// It allows iterating through the section headers for processing.
+    ///
+    /// # Returns
+    ///
+    /// An `Elf64ShdrIterator` over the ELF Section Headers.
      pub fn shdrs_iter(&self) -> Elf64ShdrIterator {
          Elf64ShdrIterator::new(self)
      }

+    /// Verifies the integrity of the ELF Dynamic section.
+    ///
+    /// This function verifies the integrity of the ELF Dynamic section.
+    ///
+    /// # Arguments
+    ///
+    /// * `dynamic` - The ELF Dynamic section to verify.
+    ///
+    /// # Errors
+    ///
+    /// Returns an `Err(ElfError)` if the Dynamic section is invalid.
      fn verify_dynamic(dynamic: &Elf64Dynamic) -> Result<(), ElfError> {
          dynamic.verify()?;
          Ok(())
      }

+    /// Maps a virtual address (Vaddr) range to a corresponding file offset.
+    ///
+    /// This function maps a given virtual address (Vaddr) range to the 
corresponding
+    /// file offset within the ELF file. It takes the beginning 
`vaddr_begin` and an
+    /// optional `vaddr_end` (if provided), and returns the corresponding 
file offset
+    /// range as an `Elf64FileRange`.
+    ///
+    /// # Arguments
+    ///
+    /// * `vaddr_begin` - The starting virtual address of the range.
+    /// * `vaddr_end` - An optional ending virtual address of the range. 
If not provided,
+    ///   the function assumes a range of size 1.
+    ///
+    /// # Returns
+    ///
+    /// A `Result` containing an `Elf64FileRange` representing the file 
offset range.
+    ///
+    /// # Errors
+    ///
+    /// Returns an `Err(ElfError)` in the following cases:
+    ///
+    /// * If `vaddr_begin` is `Elf64Addr::MAX`, indicating an unmapped 
virtual address range.
+    /// * If the virtual address range is not found within any loaded segment.
+    /// * If the file offset calculations result in an invalid file range.
+    /// * If the virtual address range extends beyond the loaded segment's 
file content,
+    ///   indicating an unbacked virtual address range.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use my_elf_parser::{Elf64File, Elf64Addr};
+    /// let elf_file = Elf64File::read("my_elf_file.bin").unwrap();
+    /// let vaddr_begin = Elf64Addr::new(0x1000);
+    /// let vaddr_end = Elf64Addr::new(0x2000);
+    /// let file_range = elf_file.map_vaddr_to_file_off(vaddr_begin, 
Some(vaddr_end));
+    /// match file_range {
+    ///     Ok(range) => {
+    ///         println!("File Offset Range: {} to {}", 
range.offset_begin, range.offset_end);
+    ///     },
+    ///     Err(error) => {
+    ///         println!("Error: {:?}", error);
+    ///     }
+    /// }
+    ///
      fn map_vaddr_to_file_off(
          &self,
          vaddr_begin: Elf64Addr,
@@ -525,6 +820,48 @@ impl<'a> Elf64File<'a> {
          })
      }

+    /// Maps a virtual address range to a slice of bytes from the ELF file 
buffer.
+    ///
+    /// This function takes a virtual address range specified by 
`vaddr_begin` and
+    /// optionally `vaddr_end` and maps it to a slice of bytes from the 
ELF file buffer.
+    ///
+    /// If `vaddr_end` is `Some`, the function maps the range from 
`vaddr_begin` (inclusive)
+    /// to `vaddr_end` (exclusive) to a slice of bytes from the ELF file 
buffer.
+    ///
+    /// If `vaddr_end` is `None`, the function maps the range from 
`vaddr_begin` to the end
+    /// of the virtual address range associated with `vaddr_begin` to a 
slice of bytes from
+    /// the ELF file buffer.
+    ///
+    /// # Arguments
+    ///
+    /// * `vaddr_begin` - The starting virtual address of the range to map.
+    /// * `vaddr_end` - An optional ending virtual address of the range to 
map.
+    ///
+    /// # Returns
+    ///
+    /// - `Ok(slice)`: If the virtual address range is valid and 
successfully mapped, returns
+    ///   a reference to the corresponding slice of bytes from the ELF 
file buffer.
+    /// - `Err(ElfError)`: If an error occurs during mapping, such as an 
unmapped or unbacked
+    ///   virtual address range, returns an `ElfError`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use my_elf_parser::{Elf64File, Elf64Addr};
+    /// let elf_file = Elf64File::read("my_elf_file.bin").unwrap();
+    /// let vaddr_begin = Elf64Addr::new(0x1000);
+    ///
+    /// // Map a virtual address range to a slice of bytes.
+    /// match elf_file.map_vaddr_to_file_buf(vaddr_begin, Some(vaddr_begin 
+ 0x100)) {
+    ///     Ok(slice) => {
+    ///     // Using println for example purposes
+    ///         println!("Mapped slice: {:?}", slice);
+    ///     }
+    ///     Err(error) => {
+    ///         println!("Error mapping virtual address range: {:?}", error);
+    ///     }
+    /// }
+    ///
      fn map_vaddr_to_file_buf(
          &self,
          vaddr_begin: Elf64Addr,
@@ -550,6 +887,33 @@ impl<'a> Elf64File<'a> {
          }
      }

+    /// Calculates the alignment offset for the image load address.
+    ///
+    /// This function calculates the alignment offset that needs to be 
applied to the
+    /// image's load address to ensure alignment with the maximum 
alignment constraint
+    /// of all load segments.
+    ///
+    /// If the `max_load_segment_align` is 0 (indicating no alignment 
constraints), the
+    /// offset is 0.
+    ///
+    /// If there are load segments with alignment constraints, this 
function determines
+    /// the offset needed to align the image load address with the maximum 
alignment
+    /// constraint among all load segments.
+    ///
+    /// # Returns
+    ///
+    /// - `Elf64Off`: The alignment offset for the image's load address.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use my_elf_parser::Elf64File;
+    /// let elf_file = Elf64File::read("my_elf_file.bin").unwrap();
+    ///
+    /// // Calculate the alignment offset for the image load address.
+    /// let align_offset = elf_file.image_load_align_offset();
+    /// println!("Image load address alignment offset: {}", align_offset);
+    /// ```
      fn image_load_align_offset(&self) -> Elf64Off {
          if self.max_load_segment_align == 0 {
              return 0;
@@ -587,6 +951,32 @@ impl<'a> Elf64File<'a> {
          Elf64ImageLoadVaddrAllocInfo { range, align }
      }

+    /// Creates an iterator over the ELF segments that are part of the 
loaded image.
+    ///
+    /// This function returns an iterator that allows iterating over the 
ELF segments
+    /// belonging to the loaded image. It takes the `image_load_addr`, 
which represents
+    /// the virtual address where the ELF image is loaded in memory. The 
iterator yields
+    /// `Elf64ImageLoadSegment` instances.
+    ///
+    /// # Arguments
+    ///
+    /// * `image_load_addr` - The virtual address where the ELF image is 
loaded in memory.
+    ///
+    /// # Returns
+    ///
+    /// An `Elf64ImageLoadSegmentIterator` over the loaded image segments.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use my_elf_parser::{Elf64File, Elf64Addr};
+    /// let elf_file = Elf64File::read("my_elf_file.bin").unwrap();
+    /// let image_load_addr = Elf64Addr::new(0x1000);
+    /// // Using println! for example purposes:
+    /// for segment in elf_file.image_load_segment_iter(image_load_addr) {
+    ///     println!("Segment at 0x{:x} - 0x{:x}", segment.vaddr, 
segment.vaddr + segment.memsz);
+    /// }
+    /// ```
      pub fn image_load_segment_iter(
          &'a self,
          image_load_addr: Elf64Addr,
@@ -599,6 +989,51 @@ impl<'a> Elf64File<'a> {
          }
      }

+    ///
+    /// This function processes dynamic relocations (relas) in the ELF 
file and applies them
+    /// to the loaded image. It takes a generic `rela_proc` parameter that 
should implement the
+    /// `Elf64RelocProcessor` trait, allowing custom relocation processing 
logic.
+    ///
+    /// The `image_load_addr` parameter specifies the virtual address 
where the ELF image is
+    /// loaded in memory.
+    ///
+    /// # Arguments
+    ///
+    /// * `rela_proc` - A relocation processor implementing the 
`Elf64RelocProcessor` trait.
+    /// * `image_load_addr` - The virtual address where the ELF image is 
loaded in memory.
+    ///
+    /// # Returns
+    ///
+    /// - `Ok(Some(iterator))`: If relocations are successfully applied, 
returns an iterator
+    ///   over the applied relocations.
+    /// - `Ok(None)`: If no relocations are present or an error occurs 
during processing,
+    ///   returns `None`.
+    /// - `Err(ElfError)`: If an error occurs while processing 
relocations, returns an
+    ///   `ElfError`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use my_elf_parser::{Elf64File, Elf64Addr, MyRelocationProcessor};
+    /// let elf_file = Elf64File::read("my_elf_file.bin").unwrap();
+    /// let image_load_addr = Elf64Addr::new(0x1000);
+    /// let relocation_processor = MyRelocationProcessor::new();
+    ///
+    /// match elf_file.apply_dyn_relas(relocation_processor, 
image_load_addr) {
+    ///     Ok(Some(relocation_iter)) => {
+    ///     // Using println! for example purposes
+    ///         for applied_rela in relocation_iter {
+    ///             println!("Applied relocation: {:?}", applied_rela);
+    ///         }
+    ///     }
+    ///     Ok(None) => {
+    ///         println!("No relocations to apply.");
+    ///     }
+    ///     Err(error) => {
+    ///         println!("Error applying relocations: {:?}", error);
+    ///     }
+    /// }
+    /// ```
      pub fn apply_dyn_relas<RP: Elf64RelocProcessor>(
          &'a self,
          rela_proc: RP,
@@ -640,6 +1075,29 @@ impl<'a> Elf64File<'a> {
          )))
      }

+    /// Retrieves the entry point virtual address of the ELF image.
+    ///
+    /// This function returns the virtual address of the entry point of 
the ELF image.
+    /// The `image_load_addr` parameter specifies the virtual address 
where the ELF image
+    /// is loaded in memory, and the entry point address is adjusted 
accordingly.
+    ///
+    /// # Arguments
+    ///
+    /// * `image_load_addr` - The virtual address where the ELF image is 
loaded in memory.
+    ///
+    /// # Returns
+    ///
+    /// The adjusted entry point virtual address.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use my_elf_parser::{Elf64File, Elf64Addr};
+    /// let elf_file = Elf64File::read("my_elf_file.bin").unwrap();
+    /// let image_load_addr = Elf64Addr::new(0x1000);
+    /// let entry_point = elf_file.get_entry(image_load_addr);
+    /// println!("Entry point address: 0x{:x}", entry_point);
+    ///
      pub fn get_entry(&self, image_load_addr: Elf64Addr) -> Elf64Addr {
          self.elf_hdr
              .e_entry
@@ -647,28 +1105,45 @@ impl<'a> Elf64File<'a> {
      }
  }

+/// Header of the ELF64 file, including fields describing properties such
+/// as type, machine architecture, entry point, etc.
  #[derive(Debug, Default)]
  pub struct Elf64Hdr {
      #[allow(unused)]
+    /// An array of 16 bytes representing the ELF identification, 
including the ELF magic number
      e_ident: [Elf64char; 16],
      #[allow(unused)]
+    /// The type of ELF file
      e_type: Elf64Half,
      #[allow(unused)]
+    /// The target architecture of the ELF file
      e_machine: Elf64Half,
      #[allow(unused)]
+    /// The version of the ELF file
      e_version: Elf64Word,
+    /// The virtual address of the program entry point
      e_entry: Elf64Addr,
+    /// The file offset to the start of the program header table
      e_phoff: Elf64Off,
+    /// The file offset to the start of the program header table
      e_shoff: Elf64Off,
+    /// The file offset to the start of the section header table
      #[allow(unused)]
+    /// Processor-specific flags associated with the file
      e_flags: Elf64Word,
      #[allow(unused)]
+    /// The size of the ELF header
      e_ehsize: Elf64Half,
+    /// The size of a program header entry
      e_phentsize: Elf64Half,
+    /// The number of program header entries
      e_phnum: Elf64Half,
+    /// The size of a section header entry
      e_shentsize: Elf64Half,
+    /// The number of section header entries (overflowed to a Word-sized 
entry when needed)
      e_shnum: Elf64Word, // The actual Elf64Hdr entry is Elf64Half, on 
overflow it's read from section
      // table entry zero
+    /// The section header table index of the section name string table
      e_shstrndx: Elf64Word, // The actual Elf64Hdr entry is Elf64Half, on 
overflow it's read from section
                             // table entry zero
  }
@@ -695,6 +1170,42 @@ impl Elf64Hdr {

      const EV_CURRENT: Elf64Word = 1;

+    /// Reads an ELF64 header from a byte buffer.
+    ///
+    /// This function reads an ELF64 header from the provided byte buffer 
and performs various
+    /// checks to verify the integrity and compatibility of the ELF file. 
If any errors are
+    /// encountered during the reading process, they are returned as an 
`ElfError`.
+    ///
+    /// # Parameters
+    ///
+    /// - `buf`: A byte slice containing the ELF header data.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<Self, ElfError>`: A result containing the parsed 
`Elf64Hdr` if successful,
+    ///   or an `ElfError` if any errors occur during parsing.
+    ///
+    /// # Errors
+    ///
+    /// This function may return the following errors:
+    ///
+    /// - `ElfError::FileTooShort`: The provided buffer is too short to 
contain a valid ELF header.
+    /// - `ElfError::UnrecognizedMagic`: The ELF magic number in the 
identification section is unrecognized.
+    /// - `ElfError::UnsupportedClass`: The ELF file class (64-bit) is not 
supported.
+    /// - `ElfError::UnsupportedEndianess`: The endianness of the ELF file 
is not supported.
+    /// - `ElfError::UnsupportedVersion`: The version of the ELF file is 
not supported.
+    /// - `ElfError::UnsupportedOsAbi`: The ELF file uses an unsupported 
OS/ABI.
+    /// - Other errors specific to reading and parsing the header fields.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use my_elf_parser::{Elf64Hdr, ElfError};
+    ///
+    /// // Read the ELF64 header from a binary file.
+    /// let file_contents: Vec<u8> = 
std::fs::read("my_elf_file.bin").unwrap();
+    /// let elf_hdr = Elf64Hdr::read(&file_contents).unwrap();
+    /// ```
      fn read(buf: &[u8]) -> Result<Self, ElfError> {
          // Examine the e_ident[] magic.
          if buf.len() < 16 {
@@ -764,18 +1275,29 @@ impl Elf64Hdr {
      }
  }

+/// Program header entry in an ELF64 file
  #[derive(Debug)]
  pub struct Elf64Phdr {
+    /// Type of the program header entry
      pub p_type: Elf64Word,
+    /// Flags specifying the attributes of the segment
      pub p_flags: Elf64PhdrFlags,
+    /// Offset in the ELF file where the segment data begins
      pub p_offset: Elf64Off,
+    /// Virtual address at which the segment should be loaded into memory
      pub p_vaddr: Elf64Addr,
+    /// Physical address at which the segment should be loaded (for 
systems with separate physical memory)
      pub p_paddr: Elf64Addr,
+    /// Size of the segment in the ELF file (may be smaller than `p_memsz`)
      pub p_filesz: Elf64Xword,
+    /// Size of the segment in memory (may include additional padding)
      pub p_memsz: Elf64Xword,
+    /// Alignment of the segment in memory and in the file
      pub p_align: Elf64Xword,
  }

+// Attributes of an ELF64 program header, to specify whether
+// the segment is readable, writable, and/or executable
  bitflags! {
      #[derive(Debug)]
      pub struct Elf64PhdrFlags : Elf64Word {
@@ -786,10 +1308,22 @@ bitflags! {
  }

  impl Elf64Phdr {
+    /// Represents a null program header type
      pub const PT_NULL: Elf64Word = 1;
+    /// Represents a loadable segment program header type
      pub const PT_LOAD: Elf64Word = 1;
+    /// Represents a dynamic segment program header type
      pub const PT_DYNAMIC: Elf64Word = 2;

+    /// Reads a program header from a byte buffer and returns an 
`Elf64Phdr` instance.
+    ///
+    /// # Arguments
+    ///
+    /// * `phdr_buf` - A byte buffer containing the program header data.
+    ///
+    /// # Returns
+    ///
+    /// An `Elf64Phdr` instance representing the program header.
      fn read(phdr_buf: &[u8]) -> Self {
          let p_type = 
Elf64Word::from_le_bytes(phdr_buf[0..4].try_into().unwrap());
          let p_flags = 
Elf64Word::from_le_bytes(phdr_buf[4..8].try_into().unwrap());
@@ -814,6 +1348,12 @@ impl Elf64Phdr {
          }
      }

+    /// Verifies the integrity and validity of the program header.
+    ///
+    /// # Returns
+    ///
+    /// Returns `Ok(())` if the program header is valid; otherwise, an `Err`
+    /// variant with an `ElfError` is returned.
      fn verify(&self) -> Result<(), ElfError> {
          if self.p_type == Self::PT_NULL {
              return Ok(());
@@ -842,15 +1382,26 @@ impl Elf64Phdr {
          Ok(())
      }

+    /// Returns the file range of the segment as an `Elf64FileRange`.
+    ///
+    /// # Returns
+    ///
+    /// An `Elf64FileRange` representing the file range of the segment.
      fn file_range(&self) -> Elf64FileRange {
          Elf64FileRange::try_from((self.p_offset, self.p_filesz)).unwrap()
      }

+    /// Returns the virtual address range of the segment as an 
`Elf64AddrRange`.
+    ///
+    /// # Returns
+    ///
+    /// An `Elf64AddrRange` representing the virtual address range of the 
segment.
      fn vaddr_range(&self) -> Elf64AddrRange {
          Elf64AddrRange::try_from((self.p_vaddr, self.p_memsz)).unwrap()
      }
  }

+/// An ELF64 section header
  #[derive(Debug)]
  pub struct Elf64Shdr {
      pub sh_name: Elf64Word,
@@ -858,15 +1409,22 @@ pub struct Elf64Shdr {
      sh_flags: Elf64ShdrFlags,
      sh_addr: Elf64Addr,
      sh_offset: Elf64Off,
+    /// Size of the section
      sh_size: Elf64Xword,
+    /// Link to another section
      sh_link: Elf64Word,
+    /// Additional section information
      sh_info: Elf64Word,
+    /// Address alignment constraint
      sh_addralign: Elf64Xword,
      #[allow(unused)]
+    /// Size of each entry
      sh_entsize: Elf64Xword,
  }

  bitflags! {
+    /// Flags associated with ELF64 section header (e.g.,
+    /// writable, contains null-terminated string, etc.
      #[derive(Debug)]
      pub struct Elf64ShdrFlags : Elf64Xword {
          const WRITE            = 0x001;
@@ -884,14 +1442,33 @@ bitflags! {
  }

  impl Elf64Shdr {
+    /// Represents an undefined section index
      const SHN_UNDEF: Elf64Word = 0;
+
+    /// Represents an absolute section index
      const SHN_ABS: Elf64Word = 0xfff1;
+
+    /// Represents an extended section index
      const SHN_XINDEX: Elf64Word = 0xffff;

+    /// Represents a null section type
      pub const SHT_NULL: Elf64Word = 0;
+
+    /// Represents a string table section type
      pub const SHT_STRTAB: Elf64Word = 3;
+
+    /// Represents a section with no associated data in the ELF file
      pub const SHT_NOBITS: Elf64Word = 8;

+    /// Reads a section header from a byte buffer and returns an 
`Elf64Shdr` instance.
+    ///
+    /// # Arguments
+    ///
+    /// * `shdr_buf` - A byte buffer containing the section header data.
+    ///
+    /// # Returns
+    ///
+    /// An `Elf64Shdr` instance representing the section header.
      fn read(shdr_buf: &'_ [u8]) -> Self {
          let sh_name = 
Elf64Word::from_le_bytes(shdr_buf[0..4].try_into().unwrap());
          let sh_type = 
Elf64Word::from_le_bytes(shdr_buf[4..8].try_into().unwrap());
@@ -920,6 +1497,15 @@ impl Elf64Shdr {
          }
      }

+    /// Verifies the integrity of the ELF section header.
+    ///
+    /// # Errors
+    /// Returns an `Err` variant of `ElfError` if validation fails.
+    ///
+    /// - If `sh_type` is `SHT_NULL`, the section is considered valid.
+    /// - For non-empty sections (`SHT_NOBITS`), it checks the file range.
+    /// - For allocated sections (`ALLOC` flag), it checks the address 
range and alignment.
+    /// - Returns `Ok(())` if all checks pass.
      fn verify(&self) -> Result<(), ElfError> {
          if self.sh_type == Self::SHT_NULL {
              return Ok(());
@@ -949,6 +1535,13 @@ impl Elf64Shdr {
          Ok(())
      }

+    /// Returns the file range of the ELF section.
+    ///
+    /// If the section is not empty (`SHT_NOBITS`), it represents a valid 
file range
+    /// based on the `sh_offset` and `sh_size` fields.
+    ///
+    /// # Returns
+    /// Returns an `Elf64FileRange` representing the file range of the 
section.
      fn file_range(&self) -> Elf64FileRange {
          if self.sh_type != Self::SHT_NOBITS {
              Elf64FileRange::try_from((self.sh_offset, self.sh_size)).unwrap()
@@ -958,18 +1551,33 @@ impl Elf64Shdr {
      }
  }

+/// Represents a collection of ELF64 load segments, each associated with an
+/// address range and a program header index.
  #[derive(Debug, Default)]
  struct Elf64LoadSegments {
      segments: Vec<(Elf64AddrRange, Elf64Half)>,
  }

  impl Elf64LoadSegments {
+    /// Creates a new empty `Elf64LoadSegments` instance.
+    ///
+    /// # Returns
+    /// Returns a new `Elf64LoadSegments` with no segments.
      fn new() -> Self {
          Self {
              segments: Vec::new(),
          }
      }

+    /// Finds the index of the first load segment whose address range does 
not come before
+    /// the specified `range`.
+    ///
+    /// # Parameters
+    /// - `range`: An `Elf64AddrRange` representing the address range to 
compare against.
+    ///
+    /// # Returns
+    /// Returns `Some(index)` if a matching segment is found, where 
`index` is the index
+    /// of the first such segment. Returns `None` if no matching segment 
is found.
      fn find_first_not_before(&self, range: &Elf64AddrRange) -> 
Option<usize> {
          let i = self.segments.partition_point(|segment| {
              matches!(segment.0.partial_cmp(range), Some(cmp::Ordering::Less))
@@ -982,6 +1590,18 @@ impl Elf64LoadSegments {
          }
      }

+    /// Attempts to insert a new load segment into the collection.
+    ///
+    /// If the segment does not overlap with any existing segments, it is 
inserted
+    /// into the collection.
+    ///
+    /// # Parameters
+    /// - `segment`: An `Elf64AddrRange` representing the address range of 
the segment to insert.
+    /// - `phdr_index`: An `Elf64Half` representing the program header 
index associated with
+    ///   the segment.
+    ///
+    /// # Returns
+    /// Returns `Ok(())` if the insertion is successful and there is no 
overlap with existing
      fn try_insert(&mut self, segment: Elf64AddrRange, phdr_index: 
Elf64Half) -> Result<(), ()> {
          let i = self.find_first_not_before(&segment);
          match i {
@@ -1002,6 +1622,15 @@ impl Elf64LoadSegments {
          }
      }

+    /// Looks up an address range and returns the associated program 
header index and offset
+    /// within the segment.
+    ///
+    /// # Parameters
+    /// - `range`: An `Elf64AddrRange` representing the address range to 
look up.
+    ///
+    /// # Returns
+    /// Returns `Some((phdr_index, offset))` if the address range is found 
within a segment,
+    /// where `phdr_index` is the program header index, and `offset` is 
the offset within
      fn lookup_vaddr_range(&self, range: &Elf64AddrRange) -> 
Option<(Elf64Half, Elf64Xword)> {
          let i = self.find_first_not_before(range);
          let i = match i {
@@ -1018,6 +1647,12 @@ impl Elf64LoadSegments {
          }
      }

+    /// Computes the total virtual address range covered by all load segments.
+    ///
+    /// # Returns
+    /// Returns an `Elf64AddrRange` representing the total virtual address 
range covered by
+    /// all load segments. If there are no segments, it returns a range 
with both boundaries set
+    /// to 0.
      fn total_vaddr_range(&self) -> Elf64AddrRange {
          Elf64AddrRange {
              vaddr_begin: self.segments.first().map_or(0, |first| 
first.0.vaddr_begin),
@@ -1026,19 +1661,34 @@ impl Elf64LoadSegments {
      }
  }

+/// Represents an ELF64 dynamic relocation table
  #[derive(Debug)]
  struct Elf64DynamicRelocTable {
-    base_vaddr: Elf64Addr, // DT_RELA / DT_REL
-    size: Elf64Xword,      // DT_RELASZ / DT_RELSZ
-    entsize: Elf64Xword,   // DT_RELAENT / DT_RELENT
+    /// Virtual address of the relocation table (DT_RELA / DR_REL)
+    base_vaddr: Elf64Addr,
+    /// Size of the relocation table (DT_RELASZ / DT_RELSZ)
+    size: Elf64Xword,
+    /// Size of each relocation entry (DT_RELAENT / DT_RELENT)
+    entsize: Elf64Xword,
  }

  impl Elf64DynamicRelocTable {
+    /// Verifies the integrity and validity of the dynamic relocation table.
+    ///
+    /// # Returns
+    ///
+    /// Returns `Ok(())` if the dynamic relocation table is valid; 
otherwise, returns an
+    /// `ElfError` indicating the issue.
      fn verify(&self) -> Result<(), ElfError> {
          Elf64AddrRange::try_from((self.base_vaddr, self.size))?;
          Ok(())
      }

+    /// Calculates and returns the virtual address range covered by the 
dynamic relocation table.
+    ///
+    /// # Returns
+    ///
+    /// An `Elf64AddrRange` representing the virtual address range of the 
dynamic relocation table.
      fn vaddr_range(&self) -> Elf64AddrRange {
          Elf64AddrRange::try_from((self.base_vaddr, self.size)).unwrap()
      }
@@ -1046,14 +1696,26 @@ impl Elf64DynamicRelocTable {

  #[derive(Debug)]
  struct Elf64DynamicSymtab {
-    base_vaddr: Elf64Addr, // DT_SYMTAB
-    entsize: Elf64Xword,   // DT_SYMENT
+    /// Base virtual address of the symbol table (DT_SYMTAB)
+    base_vaddr: Elf64Addr,
+    /// Size of each symbol table entry (DT_SYMENT)
+    entsize: Elf64Xword,
+    /// Optional value indicating the table index of symbols
+    /// in the extended section header table (DT_SYMTAB_SHNDX)
      #[allow(unused)]
-    shndx: Option<Elf64Addr>, // DT_SYMTAB_SHNDX
+    shndx: Option<Elf64Addr>,
  }

  impl Elf64DynamicSymtab {
+    /// Verifies the integrity and validity of the dynamic symbol table.
+    ///
+    /// # Returns
+    ///
+    /// Returns `Ok(())` if the dynamic symbol table is valid; otherwise, 
returns an
+    /// `ElfError` indicating the issue.
      fn verify(&self) -> Result<(), ElfError> {
+        // Verification of the dynamic symbol table can be implemented here.
+        // It may involve checking the table's base virtual address and 
the size of each entry.
          Ok(())
      }
  }
@@ -1062,31 +1724,60 @@ impl Elf64DynamicSymtab {
  struct Elf64Dynamic {
      // No DT_REL representation: "The AMD64 ABI architectures uses only
      // Elf64_Rela relocation entries [...]".
+    /// Optional representation of the dynamic relocation table (DT_RELA / 
DT_REL)
      rela: Option<Elf64DynamicRelocTable>,
+    /// Optional representation of the dynamic symbol table (DT_SYMTAB)
      symtab: Option<Elf64DynamicSymtab>,
+    /// Flags related to dynamic linking (DT_FLAGS_1)
      flags_1: Elf64Xword,
  }

  impl Elf64Dynamic {
+    /// Constant representing a null dynamic entry
      const DT_NULL: Elf64Xword = 0;
+    /// Constant representing a hash table address (DT_HASH)
      const DT_HASH: Elf64Xword = 4;
+    /// Constant representing the address of the string table (DT_STRTAB)
      const DT_STRTAB: Elf64Xword = 5;
+    /// Constant representing the address of the symbol table (DT_SYMTAB)
      const DT_SYMTAB: Elf64Xword = 6;
+    /// Constant representing the address of the relocation table (DT_RELA)
      const DT_RELA: Elf64Xword = 7;
+    /// Constant representing the size of the relocation table (DT_RELASZ)
      const DT_RELASZ: Elf64Xword = 8;
+    /// Constant representing the size of each relocation entry (DT_RELAENT)
      const DT_RELAENT: Elf64Xword = 9;
+    /// Constant representing the size of the string table (DT_STRSZ)
      const DT_STRSZ: Elf64Xword = 10;
+    /// Constant representing the size of each symbol table entry (DT_SYMENT)
      const DT_SYMENT: Elf64Xword = 11;
+    /// Constant representing debug information (DT_DEBUG)
      const DT_DEBUG: Elf64Xword = 21;
+    /// Constant representing the presence of text relocations (DT_TEXTREL)
      const DT_TEXTREL: Elf64Xword = 22;
+    /// Constant representing dynamic flags (DT_FLAGS)
      const DT_FLAGS: Elf64Xword = 30;
+    /// Constant representing the index of the symbol table section header 
(DT_SYMTAB_SHNDX)
      const DT_SYMTAB_SHNDX: Elf64Xword = 34;
+    /// Constant representing GNU hash (DT_GNU_HASH)
      const DT_GNU_HASH: Elf64Xword = 0x6ffffef5;
+    /// Constant representing the number of relocations (DT_RELACOUNT)
      const DT_RELACOUNT: Elf64Xword = 0x6ffffff9;
+    /// Constant representing dynamic flags (DT_FLAGS_1)
      const DT_FLAGS_1: Elf64Xword = 0x6ffffffb;
-
+    /// Constant representing position-independent executable flag (DF_PIE_1)
      const DF_PIE_1: Elf64Xword = 0x08000000;

+    /// Reads the ELF64 dynamic section from a byte buffer.
+    ///
+    /// # Arguments
+    ///
+    /// * `buf` - A byte buffer containing the dynamic section data.
+    ///
+    /// # Returns
+    ///
+    /// Returns a `Result` containing the parsed `Elf64Dynamic` structure 
if successful, or an
+    /// `ElfError` indicating the issue.
      fn read(buf: &[u8]) -> Result<Self, ElfError> {
          let mut rela: Option<Elf64Addr> = None;
          let mut relasz: Option<Elf64Xword> = None;
@@ -1179,6 +1870,12 @@ impl Elf64Dynamic {
          })
      }

+    /// Verifies the integrity and validity of the ELF64 dynamic section.
+    ///
+    /// # Returns
+    ///
+    /// Returns `Ok(())` if the dynamic section is valid; otherwise, 
returns an
+    /// `ElfError` indicating the issue.
      fn verify(&self) -> Result<(), ElfError> {
          if let Some(rela) = &self.rela {
              rela.verify()?;
@@ -1189,22 +1886,36 @@ impl Elf64Dynamic {
          Ok(())
      }

+    /// Checks if the ELF64 executable is a Position-Independent 
Executable (PIE).
+    ///
+    /// # Returns
+    ///
+    /// Returns `true` if the PIE flag (DF_PIE_1) is set; otherwise, 
returns `false`.
      fn is_pie(&self) -> bool {
          self.flags_1 & Self::DF_PIE_1 != 0
      }
  }

+/// Information about the allocation of a virtual address range
  pub struct Elf64ImageLoadVaddrAllocInfo {
-    pub range: Elf64AddrRange,     // vaddr range to allocate
-    pub align: Option<Elf64Xword>, // Set for PIE executables so that a 
valid vaddr base can be allocated.
+    /// The virtual address (vaddr) range to allocate
+    pub range: Elf64AddrRange,
+    /// Optional alignment value set for PIE (Position-Independent
+    /// Executable) executables, allowing a valid vaddr base to be allocated
+    pub align: Option<Elf64Xword>,
  }

+/// Represents an ELF64 image load segment
  pub struct Elf64ImageLoadSegment<'a> {
+    /// The virtual address (vaddr) range covering by this segment
      pub vaddr_range: Elf64AddrRange,
+    /// The contents of the segment in the ELF file
      pub file_contents: &'a [u8],
+    /// Flags associated with this segment
      pub flags: Elf64PhdrFlags,
  }

+/// An iterator over ELF64 image load segments within an ELF file
  pub struct Elf64ImageLoadSegmentIterator<'a> {
      elf_file: &'a Elf64File<'a>,
      load_base: Elf64Xword,
@@ -1215,6 +1926,12 @@ pub struct Elf64ImageLoadSegmentIterator<'a> {
  impl<'a> Iterator for Elf64ImageLoadSegmentIterator<'a> {
      type Item = Elf64ImageLoadSegment<'a>;

+    /// Advances the iterator to the next ELF64 image load segment and 
returns it.
+    ///
+    /// # Returns
+    ///
+    /// - `Some(Elf64ImageLoadSegment)` if there are more segments to 
iterate over.
+    /// - `None` if all segments have been processed.
      fn next(&mut self) -> Option<Self::Item> {
          let cur = self.next;
          if cur == self.elf_file.load_segments.segments.len() {
@@ -1222,14 +1939,18 @@ impl<'a> Iterator for 
Elf64ImageLoadSegmentIterator<'a> {
          }
          self.next += 1;

+        // Retrieve the program header (phdr) associated with the current 
segment
          let phdr_index = self.elf_file.load_segments.segments[cur].1;
          let phdr = self.elf_file.read_phdr(phdr_index);

+        // Calculate the virtual address (vaddr) range based on the phdr 
information and load base
          let mut vaddr_range = phdr.vaddr_range();
          vaddr_range.vaddr_begin = 
vaddr_range.vaddr_begin.wrapping_add(self.load_base);
          vaddr_range.vaddr_end = 
vaddr_range.vaddr_end.wrapping_add(self.load_base);

+        // Retrieve the file range for this phdr
          let file_range = phdr.file_range();
+        // Extract the segment's file contents from the ELF file buffer
          let file_contents =
 
&self.elf_file.elf_file_buf[file_range.offset_begin..file_range.offset_end];

@@ -1241,16 +1962,29 @@ impl<'a> Iterator for 
Elf64ImageLoadSegmentIterator<'a> {
      }
  }

+/// Represents an ELF64 string table (`Elf64Strtab`) containing strings
+/// used within the ELF file
  #[derive(Debug, Default)]
  struct Elf64Strtab<'a> {
      strtab_buf: &'a [u8],
  }

  impl<'a> Elf64Strtab<'a> {
+    /// Creates a new `Elf64Strtab` instance from the provided string 
table buffer
      fn new(strtab_buf: &'a [u8]) -> Self {
          Self { strtab_buf }
      }

+    /// Retrieves a string from the string table by its index.
+    ///
+    /// # Arguments
+    ///
+    /// - `index`: The index of the string to retrieve.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<&'a ffi::CStr, ElfError>`: A `Result` containing the 
string as a CStr reference
+    ///   if found, or an `ElfError` if the index is out of bounds or the 
string is invalid.
      #[allow(unused)]
      fn get_str(&self, index: Elf64Word) -> Result<&'a ffi::CStr, ElfError> {
          let index = usize::try_from(index).unwrap();
@@ -1263,21 +1997,37 @@ impl<'a> Elf64Strtab<'a> {
      }
  }

+/// Represents an ELF64 symbol (`Elf64Sym`) within the symbol table.
  #[derive(Debug)]
  struct Elf64Sym {
+    /// Name of the symbol as an index into the string table
      #[allow(unused)]
      st_name: Elf64Word,
+    /// Symbol information and binding attributes
      #[allow(unused)]
      st_info: Elf64char,
+    /// Reserved for additional symbol attributes (unused)
      #[allow(unused)]
      st_other: Elf64char,
+    /// Section index associated with the symbol
      st_shndx: Elf64Half,
+    /// Value or address of the symbol
      st_value: Elf64Addr,
+    /// Size of the symbol in bytes
      #[allow(unused)]
      st_size: Elf64Xword,
  }

  impl Elf64Sym {
+    /// Reads an `Elf64Sym` from the provided buffer.
+    ///
+    /// # Arguments
+    ///
+    /// - `buf`: A slice of bytes containing the symbol data.
+    ///
+    /// # Returns
+    ///
+    /// - `Elf64Sym`: An `Elf64Sym` instance parsed from the buffer.
      fn read(buf: &[u8]) -> Self {
          let st_name = 
Elf64Word::from_le_bytes(buf[0..4].try_into().unwrap());
          let st_info = 
Elf64char::from_le_bytes(buf[4..5].try_into().unwrap());
@@ -1296,15 +2046,32 @@ impl Elf64Sym {
      }
  }

+/// Represents an ELF64 symbol table (`Elf64Symtab`) containing
+/// symbols used within the ELF file.
  struct Elf64Symtab<'a> {
+    /// The underlying buffer containing the symbol table data
      syms_buf: &'a [u8],
+    /// Size of each symbol entry in bytes
      entsize: usize,
+    /// Number of symbols in the symbol table
      syms_num: Elf64Word,
  }

  impl<'a> Elf64Symtab<'a> {
+    /// Indicates an undefined symbol
      const STN_UNDEF: Elf64Word = 0;

+    /// Creates a new `Elf64Symtab` instance from the provided symbol 
table buffer.
+    ///
+    /// # Arguments
+    ///
+    /// - `syms_buf`: The buffer containing the symbol table data.
+    /// - `entsize`: The size of each symbol entry in bytes.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<Self, ElfError>`: A `Result` containing the 
`Elf64Symtab` instance if valid,
+    ///   or an `ElfError` if the provided parameters are invalid.
      fn new(syms_buf: &'a [u8], entsize: Elf64Xword) -> Result<Self, 
ElfError> {
          let entsize = usize::try_from(entsize).map_err(|_| 
ElfError::InvalidSymbolEntrySize)?;
          if entsize < 24 {
@@ -1319,6 +2086,16 @@ impl<'a> Elf64Symtab<'a> {
          })
      }

+    /// Reads a symbol from the symbol table by its index.
+    ///
+    /// # Arguments
+    ///
+    /// - `i`: The index of the symbol to retrieve.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<Elf64Sym, ElfError>`: A `Result` containing the 
`Elf64Sym` if found,
+    ///   or an `ElfError` if the index is out of bounds or the symbol is 
invalid.
      fn read_sym(&self, i: Elf64Word) -> Result<Elf64Sym, ElfError> {
          if i > self.syms_num {
              return Err(ElfError::InvalidSymbolIndex);
@@ -1330,22 +2107,37 @@ impl<'a> Elf64Symtab<'a> {
      }
  }

+/// Represents a relocation entry in an ELF64 file (`Elf64Rela`)
  #[derive(Debug)]
  pub struct Elf64Rela {
+    /// Offset within the section where the relocation should be applied
      r_offset: Elf64Addr,
+    /// A combination of symbol index and relocation type information
      r_info: Elf64Xword,
+    /// The value to add to the target symbol's value during relocation
      r_addend: Elf64Sxword,
  }

  impl Elf64Rela {
+    /// Extracts the symbol index from the `r_info` field
      fn get_sym(&self) -> Elf64Word {
          (self.r_info >> 32) as Elf64Word
      }

+    /// Extracts the relocation type from the `r_info` field
      fn get_type(&self) -> Elf64Word {
          (self.r_info & 0xffffffffu64) as Elf64Word
      }

+    /// Reads an `Elf64Rela` relocation entry from the provided buffer.
+    ///
+    /// # Arguments
+    ///
+    /// - `rela_buf`: A slice of bytes containing the relocation entry data.
+    ///
+    /// # Returns
+    ///
+    /// - `Elf64Rela`: An `Elf64Rela` instance parsed from the buffer.
      fn read(rela_buf: &[u8]) -> Self {
          let r_offset = 
Elf64Addr::from_le_bytes(rela_buf[0..8].try_into().unwrap());
          let r_info = 
Elf64Xword::from_le_bytes(rela_buf[8..16].try_into().unwrap());
@@ -1358,13 +2150,28 @@ impl Elf64Rela {
      }
  }

+/// Represents a collection of relocation entries in an ELF64 file 
(`Elf64Relas`)
  struct Elf64Relas<'a> {
+    /// The underlying buffer containing the relocation entries
      relas_buf: &'a [u8],
+    /// Size of each relocation entry in bytes
      entsize: usize,
+    /// Number of relocation entries in the collection
      relas_num: usize,
  }

  impl<'a> Elf64Relas<'a> {
+    /// Creates a new `Elf64Relas` instance from the provided buffer and 
entry size.
+    ///
+    /// # Arguments
+    ///
+    /// - `relas_buf`: The buffer containing the relocation entries.
+    /// - `entsize`: The size of each relocation entry in bytes.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<Self, ElfError>`: A `Result` containing the `Elf64Relas` 
instance if valid,
+    ///   or an `ElfError` if the provided parameters are invalid.
      fn new(relas_buf: &'a [u8], entsize: Elf64Xword) -> Result<Self, 
ElfError> {
          let entsize = usize::try_from(entsize).map_err(|_| 
ElfError::InvalidRelocationEntrySize)?;
          if entsize < 24 {
@@ -1378,6 +2185,16 @@ impl<'a> Elf64Relas<'a> {
          })
      }

+    /// Reads a relocation entry from the collection by its index.
+    ///
+    /// # Arguments
+    ///
+    /// - `i`: The index of the relocation entry to retrieve.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<Elf64Rela, ElfError>`: A `Result` containing the 
`Elf64Rela` entry if found,
+    ///   or an `ElfError` if the index is out of bounds or the entry is 
invalid.
      fn read_rela(&self, i: usize) -> Result<Elf64Rela, ElfError> {
          let rela_off = i * self.entsize;
          let rela_buf = &self.relas_buf[rela_off..(rela_off + self.entsize)];
@@ -1385,12 +2202,25 @@ impl<'a> Elf64Relas<'a> {
      }
  }

+/// Represents an iterator over section headers in an ELF64 file
  pub struct Elf64ShdrIterator<'a> {
+    /// The ELF64 file from which section headers are being iterated
      elf_file: &'a Elf64File<'a>,
+    /// Next index to be retrieved
      next: Elf64Word,
  }

  impl<'a> Elf64ShdrIterator<'a> {
+    /// Creates a new `Elf64ShdrIterator` instance for iterating section 
headers
+    /// in an ELF64 file.
+    ///
+    /// # Arguments
+    ///
+    /// - `elf_file`: The ELF64 file to iterate section headers from.
+    ///
+    /// # Returns
+    ///
+    /// - `Self`: A `Self` instance for iterating section headers.
      fn new(elf_file: &'a Elf64File<'a>) -> Self {
          Self { elf_file, next: 0 }
      }
@@ -1399,6 +2229,12 @@ impl<'a> Elf64ShdrIterator<'a> {
  impl<'a> Iterator for Elf64ShdrIterator<'a> {
      type Item = Elf64Shdr;

+    /// Retrieves the next section header from the ELF64 file.
+    ///
+    /// # Returns
+    ///
+    /// - `Option<Self::Item>`: An option containing the next `Elf64Shdr` 
if available, or `None`
+    ///   if all section headers have been iterated.
      fn next(&mut self) -> Option<Self::Item> {
          let cur = self.next;
          if cur == self.elf_file.elf_hdr.e_shnum {
@@ -1409,14 +2245,32 @@ impl<'a> Iterator for Elf64ShdrIterator<'a> {
      }
  }

+/// Represents a relocation operation
  #[derive(Debug)]
  pub struct Elf64RelocOp {
+    /// Destination address where the relocation operation should be applied
      pub dst: Elf64Addr,
+    /// The value to be written to the destination address
      pub value: [u8; 8],
+    /// The length (in bytes) of the value to be written
      pub value_len: usize,
  }

+/// A trait for processing ELF64 relocations
  pub trait Elf64RelocProcessor {
+    /// Applies a relocation operation to produce an `Elf64RelocOp`.
+    ///
+    /// # Arguments
+    ///
+    /// - `rela`: The relocation entry specifying the operation.
+    /// - `load_base`: The base address for loading ELF sections.
+    /// - `sym_value`: The value associated with the symbol being relocated.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<Elf64RelocOp, ElfError>`: A `Result` containing the
+    /// relocation operation (`Elf64RelocOp`) if successful, or an 
`ElfError` if
+    /// there was an issue applying the relocation.
      fn apply_relocation(
          &self,
          rela: &Elf64Rela,
@@ -1425,16 +2279,24 @@ pub trait Elf64RelocProcessor {
      ) -> Result<Elf64RelocOp, ElfError>;
  }

+/// Relocation processor specifically for x86_64 ELF files.
  pub struct Elf64X86RelocProcessor;

  impl Elf64X86RelocProcessor {
+    /// Relocation type value for a 64-bit absolute relocation
      const R_X86_64_64: Elf64Word = 1;
+    /// Relocation type value for a PC-relative 32-bit relocation
      const R_X86_64_PC32: Elf64Word = 2;
+    /// Relocation type value for a relative relocation
      const R_X86_64_RELATIVE: Elf64Word = 8;
+    /// Relocation type value for a 32-bit relocation
      const R_X86_64_32: Elf64Word = 10;
+    /// Relocation type value for a signed 32-bit relocation
      const R_X86_64_32S: Elf64Word = 11;
+    /// Relocation type value for a PC-relative 64-bit relocation
      const R_X86_64_PC64: Elf64Word = 24;

+    /// Creates a new `Elf64X86RelocProcessor` instance
      pub fn new() -> Self {
          Self
      }
@@ -1447,6 +2309,19 @@ impl Default for Elf64X86RelocProcessor {
  }

  impl Elf64RelocProcessor for Elf64X86RelocProcessor {
+    /// Applies a relocation operation for x86_64 ELF files.
+    ///
+    /// # Arguments
+    ///
+    /// - `rela`: The relocation entry specifying the operation.
+    /// - `load_base`: The base address for loading ELF sections.
+    /// - `sym_value`: The value associated with the symbol being relocated.
+    ///
+    /// # Returns
+    ///
+    /// - `Result<Elf64RelocOp, ElfError>`: A `Result` containing the 
relocation
+    /// operation (`Elf64RelocOp`) if successful, or an `ElfError` if 
there was an
+    /// issue applying the relocation.
      fn apply_relocation(
          &self,
          rela: &Elf64Rela,
@@ -1498,19 +2373,36 @@ impl Elf64RelocProcessor for Elf64X86RelocProcessor {
      }
  }

+/// An iterator that applies relocation operations to ELF64 relocations
  pub struct Elf64AppliedRelaIterator<'a, RP: Elf64RelocProcessor> {
+    /// The ELF64 relocation processor used for applying relocations
      rela_proc: RP,
+    /// Base address for loading ELF sections
      load_base: Elf64Xword,
-
+    /// Reference to the ELF64 load segments
      load_segments: &'a Elf64LoadSegments,
-
+    /// ELF64 relocation entries
      relas: Elf64Relas<'a>,
+    /// Optional symbol table for resolving symbols
      symtab: Option<Elf64Symtab<'a>>,
-
+    /// Index of the next relocation entry to process
      next: usize,
  }

  impl<'a, RP: Elf64RelocProcessor> Elf64AppliedRelaIterator<'a, RP> {
+    /// Creates a new `Elf64AppliedRelaIterator` instance.
+    ///
+    /// # Arguments
+    ///
+    /// - `rela_proc`: The ELF64 relocation processor.
+    /// - `load_base`: The base address for loading ELF sections.
+    /// - `load_segments`: Reference to the ELF64 load segments.
+    /// - `relas`: ELF64 relocation entries.
+    /// - `symtab`: Optional symbol table for symbol resolution.
+    ///
+    /// # Returns
+    ///
+    /// - A new `Elf64AppliedRelaIterator` instance.
      fn new(
          rela_proc: RP,
          load_base: Elf64Xword,
@@ -1532,6 +2424,18 @@ impl<'a, RP: Elf64RelocProcessor> 
Elf64AppliedRelaIterator<'a, RP> {
  impl<'a, RP: Elf64RelocProcessor> Iterator for 
Elf64AppliedRelaIterator<'a, RP> {
      type Item = Result<Option<Elf64RelocOp>, ElfError>;

+    /// Advances the iterator to the next relocation operation, processes it,
+    /// and returns the result.
+    ///
+    /// If there are no more relocations to process, `None` is returned to 
signal
+    /// the end of the iterator.
+    ///
+    /// # Returns
+    ///
+    /// - `Some(Ok(None))`: If the relocation entry indicates no operation 
(type == 0).
+    /// - `Some(Ok(Some(reloc_op)))`: If a relocation operation is 
successfully applied.
+    /// - `Some(Err(ElfError))`: If an error occurs during relocation 
processing.
+    /// - `None`: If there are no more relocation entries to process.
      fn next(&mut self) -> Option<Self::Item> {
          let cur = self.next;
          if cur == self.relas.relas_num {
@@ -1539,15 +2443,18 @@ impl<'a, RP: Elf64RelocProcessor> Iterator for 
Elf64AppliedRelaIterator<'a, RP>
          }
          self.next += 1;

+        // Read the next ELF64 relocation entry
          let rela = match self.relas.read_rela(cur) {
              Ok(rela) => rela,
              Err(e) => return Some(Err(e)),
          };

+        // Check if the relocation type is zero, indicating no operation
          if rela.get_type() == 0 {
              return Some(Ok(None));
          }

+        // Resolve the symbol associated with the relocation
          let sym_index = rela.get_sym();
          let sym_value = if sym_index != Elf64Symtab::STN_UNDEF {
              let symtab = match &self.symtab {
@@ -1574,6 +2481,7 @@ impl<'a, RP: Elf64RelocProcessor> Iterator for 
Elf64AppliedRelaIterator<'a, RP>
              0
          };

+        // Apply the relocation and obtain the relocation operation
          let reloc_op = match self
              .rela_proc
              .apply_relocation(&rela, self.load_base, sym_value)
-- 
2.41.0
