// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn swap[T:! type, U:! type](tuple: (T, U)) -> (U, T) {
  return (tuple[1], tuple[0]);
}

fn Main() -> i32 {
  return swap((0, true))[1];
}

// CHECK:STDOUT: result: 0
