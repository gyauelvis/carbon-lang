// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn Main() -> i32 {
  var x: i32;
  // CHECK:STDERR: COMPILATION ERROR: fail_field_value.carbon:[[@LINE+1]]: use of uninitialized variable x
  var p: auto = {.x = x,};
  return 0;
}
