// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

class Holder(N:! i32) {
  fn Get() -> i32 {
    return N;
  }
}

class IntLike {
  extend impl as ImplicitAs(i32) {
    fn Convert[self: Self]() -> i32 { return 4; }
  }
  fn Make() -> IntLike { return {}; }
}

fn Main() -> i32 {
  return Holder(IntLike.Make()).Get();
}

// CHECK:STDOUT: result: 4
