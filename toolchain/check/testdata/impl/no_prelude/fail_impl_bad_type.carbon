// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/impl/no_prelude/fail_impl_bad_type.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/impl/no_prelude/fail_impl_bad_type.carbon

interface I {}

// CHECK:STDERR: fail_impl_bad_type.carbon:[[@LINE+3]]:6: ERROR: Cannot implicitly convert from `bool` to `type`.
// CHECK:STDERR: impl true as I {}
// CHECK:STDERR:      ^~~~
impl true as I {}

// CHECK:STDOUT: --- fail_impl_bad_type.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %.1: type = interface_type @I [template]
// CHECK:STDOUT:   %Self: %.1 = bind_symbolic_name Self 0 [symbolic]
// CHECK:STDOUT:   %.2: bool = bool_literal true [template]
// CHECK:STDOUT:   %.3: type = tuple_type () [template]
// CHECK:STDOUT:   %.4: <witness> = interface_witness () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .I = %I.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %I.decl: type = interface_decl @I [template = constants.%.1] {}
// CHECK:STDOUT:   impl_decl @impl {
// CHECK:STDOUT:     %.loc16: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:     %I.ref: type = name_ref I, %I.decl [template = constants.%.1]
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: interface @I {
// CHECK:STDOUT:   %Self: %.1 = bind_symbolic_name Self 0 [symbolic = constants.%Self]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = %Self
// CHECK:STDOUT:   witness = ()
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: impl @impl: <error> as %.1 {
// CHECK:STDOUT:   %.loc16: <witness> = interface_witness () [template = constants.%.4]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   witness = %.loc16
// CHECK:STDOUT: }
// CHECK:STDOUT:
