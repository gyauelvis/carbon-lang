// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/operators/builtin/unary_op.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/operators/builtin/unary_op.carbon

fn Not(b: bool) -> bool {
  return not b;
}

let not_true: bool = not true;
let not_false: bool = not false;

fn Constant() {
  var a: if not true then bool else () = ();
  var b: if not false then bool else () = true;
}

// CHECK:STDOUT: --- unary_op.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Bool.type: type = fn_type @Bool [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %Bool: %Bool.type = struct_value () [template]
// CHECK:STDOUT:   %Not.type: type = fn_type @Not [template]
// CHECK:STDOUT:   %Not: %Not.type = struct_value () [template]
// CHECK:STDOUT:   %.2: bool = bool_literal true [template]
// CHECK:STDOUT:   %.3: bool = bool_literal false [template]
// CHECK:STDOUT:   %Constant.type: type = fn_type @Constant [template]
// CHECK:STDOUT:   %Constant: %Constant.type = struct_value () [template]
// CHECK:STDOUT:   %tuple: %.1 = tuple_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     .Bool = %import_ref
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/operators
// CHECK:STDOUT:     import Core//prelude/types
// CHECK:STDOUT:     import Core//prelude/operators/arithmetic
// CHECK:STDOUT:     import Core//prelude/operators/bitwise
// CHECK:STDOUT:     import Core//prelude/operators/comparison
// CHECK:STDOUT:     import Core//prelude/types/bool
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref: %Bool.type = import_ref Core//prelude/types/bool, inst+2, loaded [template = constants.%Bool]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .Not = %Not.decl
// CHECK:STDOUT:     .not_true = @__global_init.%not_true
// CHECK:STDOUT:     .not_false = @__global_init.%not_false
// CHECK:STDOUT:     .Constant = %Constant.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %Not.decl: %Not.type = fn_decl @Not [template = constants.%Not] {
// CHECK:STDOUT:     %bool.make_type.loc11_11: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc11_11.1: type = value_of_initializer %bool.make_type.loc11_11 [template = bool]
// CHECK:STDOUT:     %.loc11_11.2: type = converted %bool.make_type.loc11_11, %.loc11_11.1 [template = bool]
// CHECK:STDOUT:     %b.loc11_8.1: bool = param b
// CHECK:STDOUT:     @Not.%b: bool = bind_name b, %b.loc11_8.1
// CHECK:STDOUT:     %bool.make_type.loc11_20: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc11_20.1: type = value_of_initializer %bool.make_type.loc11_20 [template = bool]
// CHECK:STDOUT:     %.loc11_20.2: type = converted %bool.make_type.loc11_20, %.loc11_20.1 [template = bool]
// CHECK:STDOUT:     @Not.%return: ref bool = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %bool.make_type.loc15: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc15_15.1: type = value_of_initializer %bool.make_type.loc15 [template = bool]
// CHECK:STDOUT:   %.loc15_15.2: type = converted %bool.make_type.loc15, %.loc15_15.1 [template = bool]
// CHECK:STDOUT:   %bool.make_type.loc16: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc16_16.1: type = value_of_initializer %bool.make_type.loc16 [template = bool]
// CHECK:STDOUT:   %.loc16_16.2: type = converted %bool.make_type.loc16, %.loc16_16.1 [template = bool]
// CHECK:STDOUT:   %Constant.decl: %Constant.type = fn_decl @Constant [template = constants.%Constant] {}
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Bool() -> type = "bool.make_type";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Not(%b: bool) -> bool {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %b.ref: bool = name_ref b, %b
// CHECK:STDOUT:   %.loc12: bool = not %b.ref
// CHECK:STDOUT:   return %.loc12
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Constant() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc19_17: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   %.loc19_13: bool = not %.loc19_17 [template = constants.%.3]
// CHECK:STDOUT:   if %.loc19_13 br !if.expr.then.loc19 else br !if.expr.else.loc19
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc19:
// CHECK:STDOUT:   %bool.make_type.loc19: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc19_27.1: type = value_of_initializer %bool.make_type.loc19 [template = bool]
// CHECK:STDOUT:   %.loc19_27.2: type = converted %bool.make_type.loc19, %.loc19_27.1 [template = bool]
// CHECK:STDOUT:   br !if.expr.result.loc19(%.loc19_27.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc19:
// CHECK:STDOUT:   %.loc19_38: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc19_32: type = converted %.loc19_38, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   br !if.expr.result.loc19(%.loc19_32)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc19:
// CHECK:STDOUT:   %.loc19_10: type = block_arg !if.expr.result.loc19 [template = constants.%.1]
// CHECK:STDOUT:   %a.var: ref %.1 = var a
// CHECK:STDOUT:   %a: ref %.1 = bind_name a, %a.var
// CHECK:STDOUT:   %.loc19_43.1: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc19_43.2: init %.1 = tuple_init () to %a.var [template = constants.%tuple]
// CHECK:STDOUT:   %.loc19_44: init %.1 = converted %.loc19_43.1, %.loc19_43.2 [template = constants.%tuple]
// CHECK:STDOUT:   assign %a.var, %.loc19_44
// CHECK:STDOUT:   %.loc20_17: bool = bool_literal false [template = constants.%.3]
// CHECK:STDOUT:   %.loc20_13: bool = not %.loc20_17 [template = constants.%.2]
// CHECK:STDOUT:   if %.loc20_13 br !if.expr.then.loc20 else br !if.expr.else.loc20
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc20:
// CHECK:STDOUT:   %bool.make_type.loc20: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc20_28.1: type = value_of_initializer %bool.make_type.loc20 [template = bool]
// CHECK:STDOUT:   %.loc20_28.2: type = converted %bool.make_type.loc20, %.loc20_28.1 [template = bool]
// CHECK:STDOUT:   br !if.expr.result.loc20(%.loc20_28.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc20:
// CHECK:STDOUT:   %.loc20_39: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc20_33: type = converted %.loc20_39, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   br !if.expr.result.loc20(%.loc20_33)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc20:
// CHECK:STDOUT:   %.loc20_10: type = block_arg !if.expr.result.loc20 [template = bool]
// CHECK:STDOUT:   %b.var: ref bool = var b
// CHECK:STDOUT:   %b: ref bool = bind_name b, %b.var
// CHECK:STDOUT:   %.loc20_43: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   assign %b.var, %.loc20_43
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @__global_init() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc15_26: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   %.loc15_22: bool = not %.loc15_26 [template = constants.%.3]
// CHECK:STDOUT:   %not_true: bool = bind_name not_true, %.loc15_22
// CHECK:STDOUT:   %.loc16_27: bool = bool_literal false [template = constants.%.3]
// CHECK:STDOUT:   %.loc16_23: bool = not %.loc16_27 [template = constants.%.2]
// CHECK:STDOUT:   %not_false: bool = bind_name not_false, %.loc16_23
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
