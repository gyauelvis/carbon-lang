// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

class A { var n: i32; }

fn Main() -> i32 {
  var a: A = {.n = 5};
  // CHECK:STDERR: COMPILATION ERROR: fail_no_conversion.carbon:[[@LINE+2]]: type error in `as`: `class A` is not explicitly convertible to `i32`:
  // CHECK:STDERR: could not find implementation of interface As(T = i32) for class A
  return a as i32;
}
