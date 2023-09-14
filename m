Return-Path: <Carlos.Bilbao@amd.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 699FD1A14FF
 for <svsm-devel@coconut-svsm.dev>; Thu, 14 Sep 2023 16:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLsltu9zxnDaCmR0bbNrwfLnQU64TX5V67iYuZA8xZw=;
 b=1EnlnlUCFghsxOXthE0w+1u9OCeUj1J+D1xGWtXXTmYf3TNQFSPyjl6vKwnFtHHLz2TdlJy3ywx1U/4TRmNuULFKT8ZDuMvC95wMZYjB1xqfCXucnUowjpj69wd03MYHRl8F4QhnXkA9A4uxXYRCgL0AUxAW2957PWpe1mWEe5g=
Message-ID: <cfd7a6c8-33f4-8615-6ed9-6f2eb079c64d@amd.com>
Date: Thu, 14 Sep 2023 09:28:11 -0500
Content-Language: en-US
References: <aa870f4a-d27f-9a6c-6dac-85385caafc7f@amd.com>
 <4998fc1d-6733-2b7e-5409-f43625700eb5@amd.com>
From: Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <4998fc1d-6733-2b7e-5409-f43625700eb5@amd.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] task: Implement system call interface
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>, svsm-devel@coconut-svsm.dev, Roy Hopkins <roy.hopkins@suse.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 9/11/23 12:43, Tom Lendacky wrote:
> On 9/8/23 07:55, Carlos Bilbao wrote:
>> Hello,
>>
>> Just opened pull request to add a system call interface [1]. Sharing below
>> too in case anyone wants to review.
>>
>> [1] https://github.com/roy-hopkins/svsm/pull/5
>>
>> Thanks,
>> Carlos
>> ---
>> [PATCH] scheduler: Implement system call interface
>>
>> Added system call interface with enum-based invocation handling.
>>
>> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
>> ---
>>   src/task/syscall.rs | 122 +++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 114 insertions(+), 8 deletions(-)
>>
>> diff --git a/src/task/syscall.rs b/src/task/syscall.rs
>> index 3ac7b92..67c0197 100644
>> --- a/src/task/syscall.rs
>> +++ b/src/task/syscall.rs
>> @@ -3,8 +3,13 @@
>>   // Copyright (c) 2022-2023 SUSE LLC
>>   //
>>   // Author: Roy Hopkins <rhopkins@suse.de>
>> -
>> +//
>> +// Other contributors:
>> +//
>> +// Carlos Bilbao <carlos.bilbao@amd.com>
>> +//
>>   use core::{
>> +    arch::asm,
>>       arch::global_asm,
>>       ffi::{c_char, CStr},
>>   };
>> @@ -32,21 +37,122 @@ const MSR_STAR: u32 = 0xc000_0081;
>>   const MSR_LSTAR: u32 = 0xc000_0082;
>>   const MSR_SFMASK: u32 = 0xc000_0084;
>>
>> +#[repr(u32)]
>> +#[derive(Debug)]
>> +pub enum SystemCalls {
>> +    Exit = 0,
>> +    Log = 1,
>> +    Sleep = 2,
>> +}
> 
> The SVSM unique syscalls should have numbers that don't conflict with the 
> POSIX syscall numbers. This allows for (future) implementation of userspace 
> support for things like malloc, mmap, etc.

Thanks for pointing that out, I have updated the pull request, now we
start with SystemCalls::Exit = 500.

> 
> Thanks,
> Tom
> 
>> +
>> +fn map_to_syscall(index: u32) -> Option<SystemCalls> {
>> +    match index {
>> +        1 => Some(SystemCalls::Exit),
>> +        2 => Some(SystemCalls::Log),
>> +        3 => Some(SystemCalls::Sleep),
>> +        _ => None,
>> +    }
>> +}
>> +
>> +#[inline]
>> +#[allow(dead_code)]
>> +pub fn syscall0(id: u32) -> u64 {
>> +    let ret: u64;
>> +    // syscall modifies both rcx and r11
>> +    unsafe {
>> +        asm!("syscall",
>> +               inout("rax") id as u64 => ret,
>> +               options(nostack));
>> +    }
>> +
>> +    ret
>> +}
>> +
>> +#[inline]
>> +#[allow(dead_code)]
>> +pub fn syscall1(id: u32, p1: u64) -> u64 {
>> +    let ret: u64;
>> +    unsafe {
>> +        asm!("syscall",
>> +               inout("rax") id as u64 => ret,
>> +               in("rdi") p1,
>> +               options(nostack));
>> +    }
>> +
>> +    ret
>> +}
>> +
>> +#[inline]
>> +#[allow(dead_code)]
>> +pub fn syscall2(id: u32, p1: u64, p2: u64) -> u64 {
>> +    let ret: u64;
>> +    unsafe {
>> +        asm!("syscall",
>> +               inout("rax") id as u64 => ret,
>> +               in("rdi") p1,
>> +               in("rsi") p2,
>> +               options(nostack));
>> +    }
>> +
>> +    ret
>> +}
>> +
>> +#[inline]
>> +#[allow(dead_code)]
>> +pub fn syscall3(id: u32, p1: u64, p2: u64, p3: u64) -> u64 {
>> +    let ret: u64;
>> +    // syscall modifies both rcx and r11
>> +    unsafe {
>> +        asm!("syscall",
>> +               inout("rax") id as u64 => ret,
>> +               in("rdi") p1,
>> +               in("rsi") p2,
>> +               in("rdx") p3,
>> +               options(nostack));
>> +    }
>> +
>> +    ret
>> +}
>> +
>> +// In case of adding system calls with more parameters, this is the order
>> +// in which to fill the registers:
>> +// p4=r10, p5=r8, p6=r9
>> +// We can't pass >6 params without using the stack
>> +// Don't forget to include the call in system_call!() too.
>> +
>> +/// System call macro. Example of usage:
>> +/// system_call!(SystemCalls:CALL_ID, param1)
>> +///
>> +#[macro_export]
>> +macro_rules! system_call {
>> +    ($id: expr) => {
>> +        syscall0($id)
>> +    };
>> +
>> +    ($id: expr, $param_1:expr) => {
>> +        syscall1($id, $param_1 as u64)
>> +    };
>> +    ($id: expr, $param_1:expr, $param_2:expr) => {
>> +        syscall2($id, $param_1 as u64, $param_2 as u64)
>> +    };
>> +
>> +    ($id: expr, $param_1:expr, $param_2:expr, $param_3:expr) => {
>> +        syscall3($id, $param_1 as u64, $param_2 as u64, $param_3 as u64)
>> +    };
>> +}
>> +
>>   #[no_mangle]
>>   extern "C" fn syscall_handler(index: u32, param1: u64) -> u64 {
>> -    let ret = match index {
>> -        // exit
>> -        0 => SyscallRet::Terminate,
>> -        // log
>> -        1 => {
>> +    let ret = match map_to_syscall(index) {
>> +        Some(SystemCalls::Exit) => SyscallRet::Terminate,
>> +        Some(SystemCalls::Log) => {
>>               unsafe {
>>                   let str = CStr::from_ptr(param1 as *const c_char);
>>                   log::info!("{}", str.to_str().unwrap());
>>               }
>>               SyscallRet::Ok
>>           }
>> -        // sleep
>> -        2 => SyscallRet::Ok,
>> +        Some(SystemCalls::Sleep) => SyscallRet::Ok,
>>           _ => {
>>               log::info!("Invalid syscall received: {}", index);
>>               SyscallRet::Unknown

Thanks,
Carlos
