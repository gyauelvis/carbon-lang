// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/function/call/no_prelude/return_implicit.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/function/call/no_prelude/return_implicit.carbon

fn MakeImplicitEmptyTuple() {
}

fn Main() {
  var b: () = MakeImplicitEmptyTuple();
}

// CHECK:STDOUT: --- return_implicit.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %MakeImplicitEmptyTuple.type: type = fn_type @MakeImplicitEmptyTuple [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %MakeImplicitEmptyTuple: %MakeImplicitEmptyTuple.type = struct_value () [template]
// CHECK:STDOUT:   %Main.type: type = fn_type @Main [template]
// CHECK:STDOUT:   %Main: %Main.type = struct_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .MakeImplicitEmptyTuple = %MakeImplicitEmptyTuple.decl
// CHECK:STDOUT:     .Main = %Main.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %MakeImplicitEmptyTuple.decl: %MakeImplicitEmptyTuple.type = fn_decl @MakeImplicitEmptyTuple [template = constants.%MakeImplicitEmptyTuple] {}
// CHECK:STDOUT:   %Main.decl: %Main.type = fn_decl @Main [template = constants.%Main] {}
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @MakeImplicitEmptyTuple() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Main() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc15_11.1: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc15_11.2: type = converted %.loc15_11.1, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   %b.var: ref %.1 = var b
// CHECK:STDOUT:   %b: ref %.1 = bind_name b, %b.var
// CHECK:STDOUT:   %MakeImplicitEmptyTuple.ref: %MakeImplicitEmptyTuple.type = name_ref MakeImplicitEmptyTuple, file.%MakeImplicitEmptyTuple.decl [template = constants.%MakeImplicitEmptyTuple]
// CHECK:STDOUT:   %MakeImplicitEmptyTuple.call: init %.1 = call %MakeImplicitEmptyTuple.ref()
// CHECK:STDOUT:   assign %b.var, %MakeImplicitEmptyTuple.call
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
