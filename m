Return-Path: <Carlos.Bilbao@amd.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7DBAF1A26CA
 for <svsm-devel@coconut-svsm.dev>; Thu, 28 Sep 2023 16:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSrDlBxTC7Pi7nB69+A3PYdelDDxSqh8GPP3ziHrAss=;
 b=YTeXUwraGS6NE8TAOYw+yEBjxVtLqbZqkS6Dz2TH/5g2ca7fAnFUFvBKaZYkC3mgW/q8G3X/YvQFerD8WmrYVACGFH2LP8Vo4AMUVHJS0tgT8tmCIECuXSDcf6W9KbojQSd+toisJW9vOFOv9YKx2YNgxUswF+X+QIBEU0+nODI=
Message-ID: <9d9d2325-9b4c-c1ab-a829-72b448d3a1e0@amd.com>
Date: Thu, 28 Sep 2023 09:51:44 -0500
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: [svsm-devel] [PR] locking: Add unit tests
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hello,

Just opened pull request to add unit tests for our custom spinlock and
rwlock [1]. Sharing patch below too in case anyone wants to review. Please
remember we also have an open PR for the unit tests for ELF handling [2].

[1] https://github.com/coconut-svsm/svsm/pull/105
[2] https://github.com/coconut-svsm/svsm/pull/99

Thanks,
Carlos

---

Subject: [PATCH] locking: Add unit tests

Add unit tests to test correct behavior of both spinlock and
rwlock.

Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
  src/locking/rwlock.rs   | 43 +++++++++++++++++++++++++++++++++++++++++
  src/locking/spinlock.rs | 25 ++++++++++++++++++++++++
  2 files changed, 68 insertions(+)

diff --git a/src/locking/rwlock.rs b/src/locking/rwlock.rs
index 517862e..c219a52 100644
--- a/src/locking/rwlock.rs
+++ b/src/locking/rwlock.rs
@@ -155,3 +155,46 @@ impl<T: Debug> RWLock<T> {
          }
      }
  }
+
+mod tests {
+    use crate::locking::*;
+
+    #[test]
+    fn test_lock_rw() {
+        let rwlock = RWLock::new(42);
+
+        // Acquire a read lock and check the initial value
+        let read_guard = rwlock.lock_read();
+        assert_eq!(*read_guard, 42);
+
+        drop(read_guard);
+
+        let read_guard2 = rwlock.lock_read();
+        assert_eq!(*read_guard2, 42);
+
+        // Create another RWLock instance for modification
+        let rwlock_modify = RWLock::new(0);
+
+        let mut write_guard = rwlock_modify.lock_write();
+        *write_guard = 99;
+        assert_eq!(*write_guard, 99);
+
+        drop(write_guard);
+
+        let read_guard = rwlock.lock_read();
+        assert_eq!(*read_guard, 42);
+
+        // Let's test two concurrent readers on a new RWLock instance
+        let rwlock_concurrent = RWLock::new(123);
+
+        let read_guard1 = rwlock_concurrent.lock_read();
+        let read_guard2 = rwlock_concurrent.lock_read();
+
+        // Assert that both readers can access the same value (123)
+        assert_eq!(*read_guard1, 123);
+        assert_eq!(*read_guard2, 123);
+
+        drop(read_guard1);
+        drop(read_guard2);
+    }
+}
diff --git a/src/locking/spinlock.rs b/src/locking/spinlock.rs
index ef0e0c5..a4b7b34 100644
--- a/src/locking/spinlock.rs
+++ b/src/locking/spinlock.rs
@@ -89,3 +89,28 @@ impl<T: Debug> SpinLock<T> {
          None
      }
  }
+
+#[cfg(test)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn test_spin_lock() {
+        let spin_lock = SpinLock::new(0);
+
+        let mut guard = spin_lock.lock();
+        *guard += 1;
+
+        // Ensure the locked data is updated.
+        assert_eq!(*guard, 1);
+
+        let spin_lock = SpinLock::new(0);
+
+        let mut guard_failed = spin_lock.lock();
+        *guard_failed += 1;
+
+        // Try to lock again; it should fail and return None.
+        let try_lock_result = spin_lock.try_lock();
+        assert!(try_lock_result.is_none());
+    }
+}
-- 
2.41.0



