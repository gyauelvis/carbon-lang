// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/struct/tuple_as_element.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/struct/tuple_as_element.carbon

var x: {.a: i32, .b: (i32,)} = {.a = 1, .b = (2,)};
var y: {.a: i32, .b: (i32,)} = x;

// CHECK:STDOUT: --- tuple_as_element.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Int32.type: type = fn_type @Int32 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %Int32: %Int32.type = struct_value () [template]
// CHECK:STDOUT:   %.2: type = tuple_type (type) [template]
// CHECK:STDOUT:   %.3: type = tuple_type (i32) [template]
// CHECK:STDOUT:   %.4: type = struct_type {.a: i32, .b: %.3} [template]
// CHECK:STDOUT:   %.5: type = ptr_type %.4 [template]
// CHECK:STDOUT:   %.6: i32 = int_literal 1 [template]
// CHECK:STDOUT:   %.7: i32 = int_literal 2 [template]
// CHECK:STDOUT:   %tuple: %.3 = tuple_value (%.7) [template]
// CHECK:STDOUT:   %struct: %.4 = struct_value (%.6, %tuple) [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     .Int32 = %import_ref
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/operators
// CHECK:STDOUT:     import Core//prelude/types
// CHECK:STDOUT:     import Core//prelude/operators/arithmetic
// CHECK:STDOUT:     import Core//prelude/operators/bitwise
// CHECK:STDOUT:     import Core//prelude/operators/comparison
// CHECK:STDOUT:     import Core//prelude/types/bool
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref: %Int32.type = import_ref Core//prelude/types, inst+4, loaded [template = constants.%Int32]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .x = %x
// CHECK:STDOUT:     .y = %y
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %int.make_type_32.loc11_13: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:   %.loc11_13.1: type = value_of_initializer %int.make_type_32.loc11_13 [template = i32]
// CHECK:STDOUT:   %.loc11_13.2: type = converted %int.make_type_32.loc11_13, %.loc11_13.1 [template = i32]
// CHECK:STDOUT:   %int.make_type_32.loc11_23: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:   %.loc11_27.1: %.2 = tuple_literal (%int.make_type_32.loc11_23)
// CHECK:STDOUT:   %.loc11_27.2: type = value_of_initializer %int.make_type_32.loc11_23 [template = i32]
// CHECK:STDOUT:   %.loc11_27.3: type = converted %int.make_type_32.loc11_23, %.loc11_27.2 [template = i32]
// CHECK:STDOUT:   %.loc11_27.4: type = converted %.loc11_27.1, constants.%.3 [template = constants.%.3]
// CHECK:STDOUT:   %.loc11_28: type = struct_type {.a: i32, .b: %.3} [template = constants.%.4]
// CHECK:STDOUT:   %x.var: ref %.4 = var x
// CHECK:STDOUT:   %x: ref %.4 = bind_name x, %x.var
// CHECK:STDOUT:   %int.make_type_32.loc12_13: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:   %.loc12_13.1: type = value_of_initializer %int.make_type_32.loc12_13 [template = i32]
// CHECK:STDOUT:   %.loc12_13.2: type = converted %int.make_type_32.loc12_13, %.loc12_13.1 [template = i32]
// CHECK:STDOUT:   %int.make_type_32.loc12_23: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:   %.loc12_27.1: %.2 = tuple_literal (%int.make_type_32.loc12_23)
// CHECK:STDOUT:   %.loc12_27.2: type = value_of_initializer %int.make_type_32.loc12_23 [template = i32]
// CHECK:STDOUT:   %.loc12_27.3: type = converted %int.make_type_32.loc12_23, %.loc12_27.2 [template = i32]
// CHECK:STDOUT:   %.loc12_27.4: type = converted %.loc12_27.1, constants.%.3 [template = constants.%.3]
// CHECK:STDOUT:   %.loc12_28: type = struct_type {.a: i32, .b: %.3} [template = constants.%.4]
// CHECK:STDOUT:   %y.var: ref %.4 = var y
// CHECK:STDOUT:   %y: ref %.4 = bind_name y, %y.var
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Int32() -> type = "int.make_type_32";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @__global_init() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc11_38: i32 = int_literal 1 [template = constants.%.6]
// CHECK:STDOUT:   %.loc11_47: i32 = int_literal 2 [template = constants.%.7]
// CHECK:STDOUT:   %.loc11_49.1: %.3 = tuple_literal (%.loc11_47)
// CHECK:STDOUT:   %.loc11_50.1: %.4 = struct_literal (%.loc11_38, %.loc11_49.1)
// CHECK:STDOUT:   %.loc11_50.2: ref i32 = struct_access file.%x.var, element0
// CHECK:STDOUT:   %.loc11_50.3: init i32 = initialize_from %.loc11_38 to %.loc11_50.2 [template = constants.%.6]
// CHECK:STDOUT:   %.loc11_50.4: ref %.3 = struct_access file.%x.var, element1
// CHECK:STDOUT:   %.loc11_49.2: init %.3 = tuple_init (%.loc11_47) to %.loc11_50.4 [template = constants.%tuple]
// CHECK:STDOUT:   %.loc11_50.5: init %.3 = converted %.loc11_49.1, %.loc11_49.2 [template = constants.%tuple]
// CHECK:STDOUT:   %.loc11_50.6: init %.3 = initialize_from %.loc11_50.5 to %.loc11_50.4 [template = constants.%tuple]
// CHECK:STDOUT:   %.loc11_50.7: init %.4 = struct_init (%.loc11_50.3, %.loc11_50.6) to file.%x.var [template = constants.%struct]
// CHECK:STDOUT:   %.loc11_51: init %.4 = converted %.loc11_50.1, %.loc11_50.7 [template = constants.%struct]
// CHECK:STDOUT:   assign file.%x.var, %.loc11_51
// CHECK:STDOUT:   %x.ref: ref %.4 = name_ref x, file.%x
// CHECK:STDOUT:   %.loc12_32.1: ref i32 = struct_access %x.ref, element0
// CHECK:STDOUT:   %.loc12_32.2: i32 = bind_value %.loc12_32.1
// CHECK:STDOUT:   %.loc12_32.3: ref i32 = struct_access file.%y.var, element0
// CHECK:STDOUT:   %.loc12_32.4: init i32 = initialize_from %.loc12_32.2 to %.loc12_32.3
// CHECK:STDOUT:   %.loc12_32.5: ref %.3 = struct_access %x.ref, element1
// CHECK:STDOUT:   %.loc12_32.6: ref i32 = tuple_access %.loc12_32.5, element0
// CHECK:STDOUT:   %.loc12_32.7: i32 = bind_value %.loc12_32.6
// CHECK:STDOUT:   %.loc12_32.8: ref %.3 = struct_access file.%y.var, element1
// CHECK:STDOUT:   %.loc12_32.9: init %.3 = tuple_init (%.loc12_32.7) to %.loc12_32.8
// CHECK:STDOUT:   %.loc12_32.10: init %.3 = converted %.loc12_32.5, %.loc12_32.9
// CHECK:STDOUT:   %.loc12_32.11: init %.3 = initialize_from %.loc12_32.10 to %.loc12_32.8
// CHECK:STDOUT:   %.loc12_32.12: init %.4 = struct_init (%.loc12_32.4, %.loc12_32.11) to file.%y.var
// CHECK:STDOUT:   %.loc12_33: init %.4 = converted %x.ref, %.loc12_32.12
// CHECK:STDOUT:   assign file.%y.var, %.loc12_33
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
