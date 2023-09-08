Return-Path: <Carlos.Bilbao@amd.com>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BC7641A08CD
 for <svsm-devel@coconut-svsm.dev>; Fri,  8 Sep 2023 15:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8DqmD2wLNvO5d/d8i16yWY/AhPY6ZVzzib4LD1kuFs=;
 b=1707hXkRKLkppy4RSmNR5GKtntPoW+YDb3bPjJSlMI7iX6uRfkVLE0dVEGxJdJvV/gshC1Ql+cXmkjRiCwnKjyUPwMSmnyEV1Ial6aJKbBfv8HPzy/x+VcmfLtzo64KeABFN9FyOV6ayk9K/aXgKqUP6FT9+eRkArHiMtrV8ykc=
Message-ID: <8c00adce-09e3-3049-50c6-bd3c1690bbd2@amd.com>
Date: Fri, 8 Sep 2023 08:58:15 -0500
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao@amd.com>
References: <3210ec8a-b2e8-0e6e-3092-8b4337e7637f@amd.com>
In-Reply-To: <3210ec8a-b2e8-0e6e-3092-8b4337e7637f@amd.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] acpi: Document ACPI tables
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 9/8/23 08:57, Carlos Bilbao wrote:
> Hello,
> 
> Just opened pull request to add a system call interface [1]. Sharing below

... to add documentation for ACPI tables

> too in case anyone wants to review.
> 
> [1] https://github.com/roy-hopkins/svsm/pull/5
> 
> Thanks,
> Carlos
> ---
> 
> Subject: [PATCH] acpi: Document ACPI tables
> 
> Document ACPI tables structs and code, including function usage examples.
> This is related to issue #74 titled "Document COCONUT-SVSM".
> 
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
> ---
>   src/acpi/tables.rs | 196 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 195 insertions(+), 1 deletion(-)
> 
> diff --git a/src/acpi/tables.rs b/src/acpi/tables.rs
> index bc8e90c..8b4cb0e 100644
> --- a/src/acpi/tables.rs
> +++ b/src/acpi/tables.rs
> @@ -13,17 +13,34 @@ use alloc::vec::Vec;
>   use core::mem;
>   use log;
> 
> -#[derive(Debug)]
> +/// ACPI Root System Description Pointer (RSDP)
> +/// used by ACPI programming interface
> +#[derive(Debug, Default)]
>   #[repr(C, packed)]
>   struct RSDPDesc {
> +    /// Signature must contain "RSD PTR"
>       sig: [u8; 8],
> +    /// Checksum to add to all other bytes
>       chksum: u8,
> +    /// OEM-supplied string
>       oem_id: [u8; 6],
> +    /// Revision of the ACPI
>       rev: u8,
> +    /// Physical address of the RSDT
>       rsdt_addr: u32,
>   }
> 
>   impl RSDPDesc {
> +    /// Create an RSPDesc instance from FwCfg
> +    ///
> +    /// # Arguments
> +    ///
> +    /// - `fw_cfg`: A reference to the FwCfg instance.
> +    ///
> +    /// # Returns
> +    ///
> +    /// A Result containing the RSDPDesc if successful, or an SvsmError on 
> failure.
> +    ///
>       fn from_fwcfg(fw_cfg: &FwCfg) -> Result<Self, SvsmError> {
>           let mut buf = mem::MaybeUninit::<Self>::uninit();
>           let file = fw_cfg.file_selector("etc/acpi/rsdp")?;
> @@ -46,20 +63,32 @@ impl RSDPDesc {
> 
>   #[derive(Copy, Clone, Debug)]
>   #[repr(C, packed)]
> +/// Raw header of an ACPI table. It corresponds to the beginning
> +/// portion of ACPI tables, before any specific table data
>   struct RawACPITableHeader {
> +    /// Signature specificies the type of ACPI table
>       sig: [u8; 4],
> +    /// Length of the table
>       len: u32,
> +    /// Revision (signature field)
>       rev: u8,
> +    /// Checksum for data integrity
>       chksum: u8,
> +    /// OEM-supplied string to identify OEM
>       oem_id: [u8; 6],
> +    /// OEM-supplied string to identify tables
>       oem_table_id: [u8; 8],
> +    /// OEM-supplied version number
>       oem_rev: u32,
> +    /// ID for compiler
>       compiler_id: [u8; 4],
> +    /// Revision of compiler used to create the table
>       compiler_rev: u32,
>   }
> 
>   #[derive(Debug)]
>   #[allow(dead_code)]
> +/// Higher level representation of the raw ACPI table header
>   struct ACPITableHeader {
>       sig: [u8; 4],
>       len: u32,
> @@ -73,6 +102,17 @@ struct ACPITableHeader {
>   }
> 
>   impl ACPITableHeader {
> +    /// Create a new `ACPITableHeader` from a raw `RawACPITableHeader`.
> +    ///
> +    /// This constructor converts a raw ACPI table header into a 
> higher-level `ACPITableHeader`.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `raw` - A `RawACPITableHeader` containing the raw header data.
> +    ///
> +    /// # Returns
> +    ///
> +    /// A new `ACPITableHeader` instance.
>       const fn new(raw: RawACPITableHeader) -> Self {
>           Self {
>               sig: raw.sig,
> @@ -87,6 +127,7 @@ impl ACPITableHeader {
>           }
>       }
> 
> +    /// Print a human-readable summary of the ACPI table header's fields
>       #[allow(dead_code)]
>       fn print_summary(&self) {
>           let sig = FixedString::from(self.sig);
> @@ -109,12 +150,25 @@ impl ACPITableHeader {
>   }
> 
>   #[derive(Debug)]
> +/// ACPI table, both header and contents
>   struct ACPITable {
>       header: ACPITableHeader,
> +    /// Raw binary content of ACPI table
>       buf: Vec<u8>,
>   }
> 
>   impl ACPITable {
> +    /// Create a new `ACPITable` from raw binary data.
> +    ///
> +    /// This constructor creates an `ACPITable` instance by parsing raw 
> binary data.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `ptr` - A slice containing the raw binary data of the ACPI table.
> +    ///
> +    /// # Returns
> +    ///
> +    /// A new `ACPITable` instance on success, or an `SvsmError` if 
> parsing fails.
>       fn new(ptr: &[u8]) -> Result<Self, SvsmError> {
>           let raw_header = ptr
>               .get(..mem::size_of::<RawACPITableHeader>())
> @@ -134,43 +188,100 @@ impl ACPITable {
>           Ok(Self { header, buf })
>       }
> 
> +    /// Get the signature of the ACPI table.
> +    ///
> +    /// This method returns the 4-character signature of the ACPI table, 
> such as "APIC."
> +
>       #[allow(dead_code)]
>       fn signature(&self) -> FixedString<4> {
>           FixedString::from(self.header.sig)
>       }
> 
> +    /// Get the content of the ACPI table.
> +    ///
> +    /// This method returns a reference to the binary content of the ACPI 
> table,
> +    /// excluding the header.
> +    ///
> +    /// # Returns
> +    ///
> +    /// A reference to the ACPI table content, or `None` if the content is 
> empty.
> +
>       fn content(&self) -> Option<&[u8]> {
>           let offset = mem::size_of::<RawACPITableHeader>();
>           // Zero-length slices are valid, but we do not want them
>           self.buf.get(offset..).filter(|b| !b.is_empty())
>       }
> 
> +    /// Get a pointer to the content of the ACPI table at a specific offset.
> +    ///
> +    /// This method returns a pointer to the content of the ACPI table at 
> the specified offset,
> +    /// converted to the desired type `T`.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `offset` - The offset at which to obtain the pointer.
> +    ///
> +    /// # Returns
> +    ///
> +
>       fn content_ptr<T>(&self, offset: usize) -> Option<*const T> {
>           let end = offset.checked_add(mem::size_of::<T>())?;
>           Some(self.content()?.get(offset..end)?.as_ptr().cast::<T>())
>       }
>   }
> 
> +/// ACPI Table Metadata
> +/// Metadata associated with an ACPI, information about signature and offset
>   #[derive(Debug)]
>   struct ACPITableMeta {
> +    /// 4-character signature of the table
>       sig: FixedString<4>,
> +    /// The offset of the table within the table buffer
>       offset: usize,
>   }
> 
>   impl ACPITableMeta {
> +    /// Create a new `ACPITableMeta` instance.
> +    ///
> +    /// This constructor creates an `ACPITableMeta` instance with the 
> specified signature and offset.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `header` - The raw ACPI table header containing the signature.
> +    /// * `offset` - The offset of the ACPI table within the ACPI table 
> buffer.
> +    ///
> +    /// # Returns
> +    ///
> +    /// A new `ACPITableMeta` instance.
>       fn new(header: &RawACPITableHeader, offset: usize) -> Self {
>           let sig = FixedString::from(header.sig);
>           Self { sig, offset }
>       }
>   }
> 
> +/// ACPI Table Buffer
> +/// A buffer containing ACPI tables. Responsible for loading the tables
> +/// from a firmware configuration
>   #[derive(Debug)]
>   struct ACPITableBuffer {
>       buf: Vec<u8>,
> +    /// Collection of metadata for ACPI tables, including signatures
>       tables: Vec<ACPITableMeta>,
>   }
> 
>   impl ACPITableBuffer {
> +    /// Create a new `ACPITableBuffer` instance from a firmware 
> configuration source.
> +    ///
> +    /// This constructor creates an `ACPITableBuffer` instance by reading 
> ACPI tables from the specified FwCfg source.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fw_cfg` - The firmware configuration source (FwCfg) from which 
> ACPI tables will be loaded.
> +    ///
> +    /// # Returns
> +    ///
> +    /// A new `ACPITableBuffer` instance containing ACPI tables and their 
> metadata.
> +
>       fn from_fwcfg(fw_cfg: &FwCfg) -> Result<Self, SvsmError> {
>           let file = fw_cfg.file_selector("etc/acpi/tables")?;
>           let size = file.size() as usize;
> @@ -194,6 +305,19 @@ impl ACPITableBuffer {
>           Ok(acpibuf)
>       }
> 
> +    /// Load ACPI tables and their metadata from the ACPI Root System 
> Description Pointer (RSDP).
> +    ///
> +    /// This method populates the `tables` field of the `ACPITableBuffer` 
> with metadata for ACPI tables
> +    /// found within the ACPI Root System Description Pointer (RSDP) 
> structure.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fw_cfg` - The firmware configuration source (FwCfg) containing 
> ACPI tables.
> +    ///
> +    /// # Returns
> +    ///
> +    /// An `Result` indicating success or an error if ACPI tables cannot 
> be loaded.
> +
>       fn load_tables(&mut self, fw_cfg: &FwCfg) -> Result<(), SvsmError> {
>           let desc = RSDPDesc::from_fwcfg(fw_cfg)?;
> 
> @@ -222,11 +346,37 @@ impl ACPITableBuffer {
>           Ok(())
>       }
> 
> +    /// Retrieve an ACPI table from a specified offset within the ACPI 
> table buffer.
> +    ///
> +    /// This function attempts to retrieve an ACPI table from the ACPI 
> table buffer starting from the
> +    /// specified offset. It parses the table header and creates an 
> `ACPITable` instance representing
> +    /// the ACPI table's content.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `offset` - The offset within the ACPI table buffer from which to 
> retrieve the ACPI table.
> +    ///
> +    /// # Returns
> +    ///
> +    /// An `Result` containing the `ACPITable` instance if successfully 
> retrieved, or an `SvsmError`
> +    /// if the table cannot be retrieved or parsed.
>       fn acpi_table_from_offset(&self, offset: usize) -> Result<ACPITable, 
> SvsmError> {
>           let buf = self.buf.get(offset..).ok_or(SvsmError::Acpi)?;
>           ACPITable::new(buf)
>       }
> 
> +    /// Retrieve an ACPI table by its signature.
> +    ///
> +    /// This method attempts to retrieve an ACPI table by its 4-character 
> signature.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `sig` - The signature of the ACPI table to retrieve.
> +    ///
> +    /// # Returns
> +    ///
> +    /// An `Option` containing the ACPI table if found, or `None` if not 
> found.
> +
>       fn acp_table_by_sig(&self, sig: &str) -> Option<ACPITable> {
>           let offset = self
>               .tables
> @@ -240,6 +390,7 @@ impl ACPITableBuffer {
> 
>   const MADT_HEADER_SIZE: usize = 8;
> 
> +/// Header of an entry within MADT
>   #[derive(Clone, Copy, Debug)]
>   #[allow(dead_code)]
>   #[repr(C, packed)]
> @@ -248,6 +399,7 @@ struct RawMADTEntryHeader {
>       entry_len: u8,
>   }
> 
> +/// Entry for a local APIC within MADT
>   #[derive(Clone, Copy, Debug)]
>   #[allow(dead_code)]
>   #[repr(C, packed)]
> @@ -258,6 +410,7 @@ struct RawMADTEntryLocalApic {
>       flags: u32,
>   }
> 
> +/// Entry for a local X2APIC within MADT
>   #[derive(Clone, Copy, Debug)]
>   #[allow(dead_code)]
>   #[repr(C, packed)]
> @@ -269,12 +422,53 @@ struct RawMADTEntryLocalX2Apic {
>       acpi_id: u32,
>   }
> 
> +/// Information about an ACPI CPU
>   #[derive(Clone, Copy, Debug)]
>   pub struct ACPICPUInfo {
> +    /// The APIC ID for the CPU
>       pub apic_id: u32,
> +    /// Indicates whether the CPU is enabled
>       pub enabled: bool,
>   }
> 
> +/// Loads ACPI CPU information by parsing the ACPI tables.
> +///
> +/// This function retrieves CPU information from the ACPI tables provided 
> by the firmware.
> +/// It processes the Multiple APIC Description Table (MADT) to extract 
> information about each CPU's
> +/// APIC ID and enabled status.
> +///
> +/// # Arguments
> +///
> +/// * `fw_cfg`: A reference to the Firmware Configuration (FwCfg) 
> interface for accessing ACPI tables.
> +///
> +/// # Returns
> +///
> +/// A `Result` containing a vector of `ACPICPUInfo` structs representing 
> CPU information.
> +/// If successful, the vector contains information about each detected 
> CPU; otherwise, an error is returned.
> +///
> +/// # Errors
> +///
> +/// This function returns an error if there are issues with reading or 
> parsing ACPI tables,
> +/// or if the required ACPI tables are not found.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use svsm::acpi::load_acpi_cpu_info;
> +/// use svsm::fw_cfg::FwCfg;
> +///
> +/// let fw_cfg = FwCfg::new(/* initialize your FwCfg interface */);
> +/// match load_acpi_cpu_info(&fw_cfg) {
> +///     Ok(cpu_info) => {
> +///         for info in cpu_info {
> +///             // You can print id (info.apic_id) and whether it is 
> enabled (info.enabled)
> +///         }
> +///     },
> +///     Err(err) => {
> +///         // Print error
> +///     }
> +/// }
> +/// ```
>   pub fn load_acpi_cpu_info(fw_cfg: &FwCfg) -> Result<Vec<ACPICPUInfo>, 
> SvsmError> {
>       let buffer = ACPITableBuffer::from_fwcfg(fw_cfg)?;
> 
