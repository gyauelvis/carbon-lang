// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn Main() -> i32 {
  var t: auto = 5;
  match (t) {
    // CHECK:STDERR: COMPILATION ERROR: fail_generic_in_pattern.carbon:[[@LINE+1]]: generic binding may not occur in pattern with expected type T:! i32
    case T:! i32 => { return 0; }
    default => { return 1; }
  }
}
