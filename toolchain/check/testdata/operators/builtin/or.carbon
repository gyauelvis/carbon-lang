// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/operators/builtin/or.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/operators/builtin/or.carbon

fn F() -> bool { return true; }
fn G() -> bool { return true; }

fn Or() -> bool {
  return F() or G();
}

fn Constant() {
  var a: if true or true then bool else () = true;
  var b: if true or false then bool else () = true;
  var c: if false or true then bool else () = true;
  var d: if false or false then bool else () = ();
}

fn PartialConstant(x: bool) {
  var a: if true or x then bool else () = true;
}

// CHECK:STDOUT: --- or.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Bool.type: type = fn_type @Bool [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %Bool: %Bool.type = struct_value () [template]
// CHECK:STDOUT:   %F.type: type = fn_type @F [template]
// CHECK:STDOUT:   %F: %F.type = struct_value () [template]
// CHECK:STDOUT:   %.2: bool = bool_literal true [template]
// CHECK:STDOUT:   %G.type: type = fn_type @G [template]
// CHECK:STDOUT:   %G: %G.type = struct_value () [template]
// CHECK:STDOUT:   %Or.type: type = fn_type @Or [template]
// CHECK:STDOUT:   %Or: %Or.type = struct_value () [template]
// CHECK:STDOUT:   %Constant.type: type = fn_type @Constant [template]
// CHECK:STDOUT:   %Constant: %Constant.type = struct_value () [template]
// CHECK:STDOUT:   %.3: bool = bool_literal false [template]
// CHECK:STDOUT:   %tuple: %.1 = tuple_value () [template]
// CHECK:STDOUT:   %PartialConstant.type: type = fn_type @PartialConstant [template]
// CHECK:STDOUT:   %PartialConstant: %PartialConstant.type = struct_value () [template]
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
// CHECK:STDOUT:     .F = %F.decl
// CHECK:STDOUT:     .G = %G.decl
// CHECK:STDOUT:     .Or = %Or.decl
// CHECK:STDOUT:     .Constant = %Constant.decl
// CHECK:STDOUT:     .PartialConstant = %PartialConstant.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %F.decl: %F.type = fn_decl @F [template = constants.%F] {
// CHECK:STDOUT:     %bool.make_type.loc11: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc11_11.1: type = value_of_initializer %bool.make_type.loc11 [template = bool]
// CHECK:STDOUT:     %.loc11_11.2: type = converted %bool.make_type.loc11, %.loc11_11.1 [template = bool]
// CHECK:STDOUT:     @F.%return: ref bool = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %G.decl: %G.type = fn_decl @G [template = constants.%G] {
// CHECK:STDOUT:     %bool.make_type.loc12: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc12_11.1: type = value_of_initializer %bool.make_type.loc12 [template = bool]
// CHECK:STDOUT:     %.loc12_11.2: type = converted %bool.make_type.loc12, %.loc12_11.1 [template = bool]
// CHECK:STDOUT:     @G.%return: ref bool = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Or.decl: %Or.type = fn_decl @Or [template = constants.%Or] {
// CHECK:STDOUT:     %bool.make_type.loc14: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc14_12.1: type = value_of_initializer %bool.make_type.loc14 [template = bool]
// CHECK:STDOUT:     %.loc14_12.2: type = converted %bool.make_type.loc14, %.loc14_12.1 [template = bool]
// CHECK:STDOUT:     @Or.%return: ref bool = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Constant.decl: %Constant.type = fn_decl @Constant [template = constants.%Constant] {}
// CHECK:STDOUT:   %PartialConstant.decl: %PartialConstant.type = fn_decl @PartialConstant [template = constants.%PartialConstant] {
// CHECK:STDOUT:     %bool.make_type.loc25: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc25_23.1: type = value_of_initializer %bool.make_type.loc25 [template = bool]
// CHECK:STDOUT:     %.loc25_23.2: type = converted %bool.make_type.loc25, %.loc25_23.1 [template = bool]
// CHECK:STDOUT:     %x.loc25_20.1: bool = param x
// CHECK:STDOUT:     @PartialConstant.%x: bool = bind_name x, %x.loc25_20.1
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Bool() -> type = "bool.make_type";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @F() -> bool {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc11: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   return %.loc11
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @G() -> bool {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc12: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   return %.loc12
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Or() -> bool {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %F.ref: %F.type = name_ref F, file.%F.decl [template = constants.%F]
// CHECK:STDOUT:   %F.call: init bool = call %F.ref()
// CHECK:STDOUT:   %.loc15_14.1: bool = value_of_initializer %F.call
// CHECK:STDOUT:   %.loc15_14.2: bool = converted %F.call, %.loc15_14.1
// CHECK:STDOUT:   %.loc15_14.3: bool = not %.loc15_14.2
// CHECK:STDOUT:   %.loc15_14.4: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   if %.loc15_14.3 br !or.rhs else br !or.result(%.loc15_14.4)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.rhs:
// CHECK:STDOUT:   %G.ref: %G.type = name_ref G, file.%G.decl [template = constants.%G]
// CHECK:STDOUT:   %G.call: init bool = call %G.ref()
// CHECK:STDOUT:   %.loc15_14.5: bool = value_of_initializer %G.call
// CHECK:STDOUT:   %.loc15_14.6: bool = converted %G.call, %.loc15_14.5
// CHECK:STDOUT:   br !or.result(%.loc15_14.6)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.result:
// CHECK:STDOUT:   %.loc15_14.7: bool = block_arg !or.result
// CHECK:STDOUT:   return %.loc15_14.7
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Constant() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc19_13: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   %.loc19_18.1: bool = not %.loc19_13 [template = constants.%.3]
// CHECK:STDOUT:   %.loc19_18.2: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   if %.loc19_18.1 br !or.rhs.loc19 else br !or.result.loc19(%.loc19_18.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.rhs.loc19:
// CHECK:STDOUT:   %.loc19_21: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   br !or.result.loc19(%.loc19_21)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.result.loc19:
// CHECK:STDOUT:   %.loc19_18.3: bool = block_arg !or.result.loc19 [template = constants.%.2]
// CHECK:STDOUT:   if %.loc19_18.3 br !if.expr.then.loc19 else br !if.expr.else.loc19
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc19:
// CHECK:STDOUT:   %bool.make_type.loc19: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc19_31.1: type = value_of_initializer %bool.make_type.loc19 [template = bool]
// CHECK:STDOUT:   %.loc19_31.2: type = converted %bool.make_type.loc19, %.loc19_31.1 [template = bool]
// CHECK:STDOUT:   br !if.expr.result.loc19(%.loc19_31.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc19:
// CHECK:STDOUT:   %.loc19_42: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc19_36: type = converted %.loc19_42, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   br !if.expr.result.loc19(%.loc19_36)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc19:
// CHECK:STDOUT:   %.loc19_10: type = block_arg !if.expr.result.loc19 [template = bool]
// CHECK:STDOUT:   %a.var: ref bool = var a
// CHECK:STDOUT:   %a: ref bool = bind_name a, %a.var
// CHECK:STDOUT:   %.loc19_46: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   assign %a.var, %.loc19_46
// CHECK:STDOUT:   %.loc20_13: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   %.loc20_18.1: bool = not %.loc20_13 [template = constants.%.3]
// CHECK:STDOUT:   %.loc20_18.2: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   if %.loc20_18.1 br !or.rhs.loc20 else br !or.result.loc20(%.loc20_18.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.rhs.loc20:
// CHECK:STDOUT:   %.loc20_21: bool = bool_literal false [template = constants.%.3]
// CHECK:STDOUT:   br !or.result.loc20(%.loc20_21)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.result.loc20:
// CHECK:STDOUT:   %.loc20_18.3: bool = block_arg !or.result.loc20 [template = constants.%.2]
// CHECK:STDOUT:   if %.loc20_18.3 br !if.expr.then.loc20 else br !if.expr.else.loc20
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc20:
// CHECK:STDOUT:   %bool.make_type.loc20: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc20_32.1: type = value_of_initializer %bool.make_type.loc20 [template = bool]
// CHECK:STDOUT:   %.loc20_32.2: type = converted %bool.make_type.loc20, %.loc20_32.1 [template = bool]
// CHECK:STDOUT:   br !if.expr.result.loc20(%.loc20_32.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc20:
// CHECK:STDOUT:   %.loc20_43: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc20_37: type = converted %.loc20_43, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   br !if.expr.result.loc20(%.loc20_37)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc20:
// CHECK:STDOUT:   %.loc20_10: type = block_arg !if.expr.result.loc20 [template = bool]
// CHECK:STDOUT:   %b.var: ref bool = var b
// CHECK:STDOUT:   %b: ref bool = bind_name b, %b.var
// CHECK:STDOUT:   %.loc20_47: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   assign %b.var, %.loc20_47
// CHECK:STDOUT:   %.loc21_13: bool = bool_literal false [template = constants.%.3]
// CHECK:STDOUT:   %.loc21_19.1: bool = not %.loc21_13 [template = constants.%.2]
// CHECK:STDOUT:   %.loc21_19.2: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   if %.loc21_19.1 br !or.rhs.loc21 else br !or.result.loc21(%.loc21_19.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.rhs.loc21:
// CHECK:STDOUT:   %.loc21_22: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   br !or.result.loc21(%.loc21_22)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.result.loc21:
// CHECK:STDOUT:   %.loc21_19.3: bool = block_arg !or.result.loc21 [template = constants.%.2]
// CHECK:STDOUT:   if %.loc21_19.3 br !if.expr.then.loc21 else br !if.expr.else.loc21
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc21:
// CHECK:STDOUT:   %bool.make_type.loc21: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc21_32.1: type = value_of_initializer %bool.make_type.loc21 [template = bool]
// CHECK:STDOUT:   %.loc21_32.2: type = converted %bool.make_type.loc21, %.loc21_32.1 [template = bool]
// CHECK:STDOUT:   br !if.expr.result.loc21(%.loc21_32.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc21:
// CHECK:STDOUT:   %.loc21_43: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc21_37: type = converted %.loc21_43, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   br !if.expr.result.loc21(%.loc21_37)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc21:
// CHECK:STDOUT:   %.loc21_10: type = block_arg !if.expr.result.loc21 [template = bool]
// CHECK:STDOUT:   %c.var: ref bool = var c
// CHECK:STDOUT:   %c: ref bool = bind_name c, %c.var
// CHECK:STDOUT:   %.loc21_47: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   assign %c.var, %.loc21_47
// CHECK:STDOUT:   %.loc22_13: bool = bool_literal false [template = constants.%.3]
// CHECK:STDOUT:   %.loc22_19.1: bool = not %.loc22_13 [template = constants.%.2]
// CHECK:STDOUT:   %.loc22_19.2: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   if %.loc22_19.1 br !or.rhs.loc22 else br !or.result.loc22(%.loc22_19.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.rhs.loc22:
// CHECK:STDOUT:   %.loc22_22: bool = bool_literal false [template = constants.%.3]
// CHECK:STDOUT:   br !or.result.loc22(%.loc22_22)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.result.loc22:
// CHECK:STDOUT:   %.loc22_19.3: bool = block_arg !or.result.loc22 [template = constants.%.3]
// CHECK:STDOUT:   if %.loc22_19.3 br !if.expr.then.loc22 else br !if.expr.else.loc22
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc22:
// CHECK:STDOUT:   %bool.make_type.loc22: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc22_33.1: type = value_of_initializer %bool.make_type.loc22 [template = bool]
// CHECK:STDOUT:   %.loc22_33.2: type = converted %bool.make_type.loc22, %.loc22_33.1 [template = bool]
// CHECK:STDOUT:   br !if.expr.result.loc22(%.loc22_33.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc22:
// CHECK:STDOUT:   %.loc22_44: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc22_38: type = converted %.loc22_44, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   br !if.expr.result.loc22(%.loc22_38)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc22:
// CHECK:STDOUT:   %.loc22_10: type = block_arg !if.expr.result.loc22 [template = constants.%.1]
// CHECK:STDOUT:   %d.var: ref %.1 = var d
// CHECK:STDOUT:   %d: ref %.1 = bind_name d, %d.var
// CHECK:STDOUT:   %.loc22_49.1: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc22_49.2: init %.1 = tuple_init () to %d.var [template = constants.%tuple]
// CHECK:STDOUT:   %.loc22_50: init %.1 = converted %.loc22_49.1, %.loc22_49.2 [template = constants.%tuple]
// CHECK:STDOUT:   assign %d.var, %.loc22_50
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @PartialConstant(%x: bool) {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc26_13: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   %.loc26_18.1: bool = not %.loc26_13 [template = constants.%.3]
// CHECK:STDOUT:   %.loc26_18.2: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   if %.loc26_18.1 br !or.rhs else br !or.result(%.loc26_18.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.rhs:
// CHECK:STDOUT:   %x.ref: bool = name_ref x, %x
// CHECK:STDOUT:   br !or.result(%x.ref)
// CHECK:STDOUT:
// CHECK:STDOUT: !or.result:
// CHECK:STDOUT:   %.loc26_18.3: bool = block_arg !or.result [template = constants.%.2]
// CHECK:STDOUT:   if %.loc26_18.3 br !if.expr.then else br !if.expr.else
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then:
// CHECK:STDOUT:   %bool.make_type: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:   %.loc26_28.1: type = value_of_initializer %bool.make_type [template = bool]
// CHECK:STDOUT:   %.loc26_28.2: type = converted %bool.make_type, %.loc26_28.1 [template = bool]
// CHECK:STDOUT:   br !if.expr.result(%.loc26_28.2)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else:
// CHECK:STDOUT:   %.loc26_39: %.1 = tuple_literal ()
// CHECK:STDOUT:   %.loc26_33: type = converted %.loc26_39, constants.%.1 [template = constants.%.1]
// CHECK:STDOUT:   br !if.expr.result(%.loc26_33)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result:
// CHECK:STDOUT:   %.loc26_10: type = block_arg !if.expr.result [template = bool]
// CHECK:STDOUT:   %a.var: ref bool = var a
// CHECK:STDOUT:   %a: ref bool = bind_name a, %a.var
// CHECK:STDOUT:   %.loc26_43: bool = bool_literal true [template = constants.%.2]
// CHECK:STDOUT:   assign %a.var, %.loc26_43
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
