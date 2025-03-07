// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/builtins/float/less_eq.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/builtins/float/less_eq.carbon

// --- float_less_eq.carbon

fn LessEq(a: f64, b: f64) -> bool = "float.less_eq";
fn Negate(a: f64) -> f64 = "float.negate";

class True {}
class False {}

fn F(true_: True, false_: False) {
  true_ as (if LessEq(1.0, 2.0) then True else False);
  true_ as (if LessEq(1.0, 1.0) then True else False);
  false_ as (if LessEq(1.0, 0.0) then True else False);
  true_ as (if LessEq(Negate(1.0), 0.0) then True else False);
  false_ as (if LessEq(0.0, Negate(1.0)) then True else False);
}

fn RuntimeCall(a: f64, b: f64) -> bool {
  return LessEq(a, b);
}

// CHECK:STDOUT: --- float_less_eq.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %.1: i32 = int_literal 64 [template]
// CHECK:STDOUT:   %Float.type: type = fn_type @Float [template]
// CHECK:STDOUT:   %.2: type = tuple_type () [template]
// CHECK:STDOUT:   %Float: %Float.type = struct_value () [template]
// CHECK:STDOUT:   %Bool.type: type = fn_type @Bool [template]
// CHECK:STDOUT:   %Bool: %Bool.type = struct_value () [template]
// CHECK:STDOUT:   %LessEq.type: type = fn_type @LessEq [template]
// CHECK:STDOUT:   %LessEq: %LessEq.type = struct_value () [template]
// CHECK:STDOUT:   %Negate.type: type = fn_type @Negate [template]
// CHECK:STDOUT:   %Negate: %Negate.type = struct_value () [template]
// CHECK:STDOUT:   %True: type = class_type @True [template]
// CHECK:STDOUT:   %.3: type = struct_type {} [template]
// CHECK:STDOUT:   %False: type = class_type @False [template]
// CHECK:STDOUT:   %F.type: type = fn_type @F [template]
// CHECK:STDOUT:   %F: %F.type = struct_value () [template]
// CHECK:STDOUT:   %.4: type = ptr_type %.3 [template]
// CHECK:STDOUT:   %.5: f64 = float_literal 1 [template]
// CHECK:STDOUT:   %.6: f64 = float_literal 2 [template]
// CHECK:STDOUT:   %.7: bool = bool_literal true [template]
// CHECK:STDOUT:   %.8: f64 = float_literal 0 [template]
// CHECK:STDOUT:   %.9: bool = bool_literal false [template]
// CHECK:STDOUT:   %.10: f64 = float_literal -1 [template]
// CHECK:STDOUT:   %RuntimeCall.type: type = fn_type @RuntimeCall [template]
// CHECK:STDOUT:   %RuntimeCall: %RuntimeCall.type = struct_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     .Float = %import_ref.1
// CHECK:STDOUT:     .Bool = %import_ref.2
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/operators
// CHECK:STDOUT:     import Core//prelude/types
// CHECK:STDOUT:     import Core//prelude/operators/arithmetic
// CHECK:STDOUT:     import Core//prelude/operators/bitwise
// CHECK:STDOUT:     import Core//prelude/operators/comparison
// CHECK:STDOUT:     import Core//prelude/types/bool
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref.1: %Float.type = import_ref Core//prelude/types, inst+32, loaded [template = constants.%Float]
// CHECK:STDOUT:   %import_ref.2: %Bool.type = import_ref Core//prelude/types/bool, inst+2, loaded [template = constants.%Bool]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .LessEq = %LessEq.decl
// CHECK:STDOUT:     .Negate = %Negate.decl
// CHECK:STDOUT:     .True = %True.decl
// CHECK:STDOUT:     .False = %False.decl
// CHECK:STDOUT:     .F = %F.decl
// CHECK:STDOUT:     .RuntimeCall = %RuntimeCall.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %LessEq.decl: %LessEq.type = fn_decl @LessEq [template = constants.%LessEq] {
// CHECK:STDOUT:     %.loc2_14.1: i32 = int_literal 64 [template = constants.%.1]
// CHECK:STDOUT:     %float.make_type.loc2_14: init type = call constants.%Float(%.loc2_14.1) [template = f64]
// CHECK:STDOUT:     %.loc2_14.2: type = value_of_initializer %float.make_type.loc2_14 [template = f64]
// CHECK:STDOUT:     %.loc2_14.3: type = converted %float.make_type.loc2_14, %.loc2_14.2 [template = f64]
// CHECK:STDOUT:     %a.loc2_11.1: f64 = param a
// CHECK:STDOUT:     @LessEq.%a: f64 = bind_name a, %a.loc2_11.1
// CHECK:STDOUT:     %.loc2_22.1: i32 = int_literal 64 [template = constants.%.1]
// CHECK:STDOUT:     %float.make_type.loc2_22: init type = call constants.%Float(%.loc2_22.1) [template = f64]
// CHECK:STDOUT:     %.loc2_22.2: type = value_of_initializer %float.make_type.loc2_22 [template = f64]
// CHECK:STDOUT:     %.loc2_22.3: type = converted %float.make_type.loc2_22, %.loc2_22.2 [template = f64]
// CHECK:STDOUT:     %b.loc2_19.1: f64 = param b
// CHECK:STDOUT:     @LessEq.%b: f64 = bind_name b, %b.loc2_19.1
// CHECK:STDOUT:     %bool.make_type.loc2: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc2_30.1: type = value_of_initializer %bool.make_type.loc2 [template = bool]
// CHECK:STDOUT:     %.loc2_30.2: type = converted %bool.make_type.loc2, %.loc2_30.1 [template = bool]
// CHECK:STDOUT:     @LessEq.%return: ref bool = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Negate.decl: %Negate.type = fn_decl @Negate [template = constants.%Negate] {
// CHECK:STDOUT:     %.loc3_14.1: i32 = int_literal 64 [template = constants.%.1]
// CHECK:STDOUT:     %float.make_type.loc3_14: init type = call constants.%Float(%.loc3_14.1) [template = f64]
// CHECK:STDOUT:     %.loc3_14.2: type = value_of_initializer %float.make_type.loc3_14 [template = f64]
// CHECK:STDOUT:     %.loc3_14.3: type = converted %float.make_type.loc3_14, %.loc3_14.2 [template = f64]
// CHECK:STDOUT:     %a.loc3_11.1: f64 = param a
// CHECK:STDOUT:     @Negate.%a: f64 = bind_name a, %a.loc3_11.1
// CHECK:STDOUT:     %.loc3_22.1: i32 = int_literal 64 [template = constants.%.1]
// CHECK:STDOUT:     %float.make_type.loc3_22: init type = call constants.%Float(%.loc3_22.1) [template = f64]
// CHECK:STDOUT:     %.loc3_22.2: type = value_of_initializer %float.make_type.loc3_22 [template = f64]
// CHECK:STDOUT:     %.loc3_22.3: type = converted %float.make_type.loc3_22, %.loc3_22.2 [template = f64]
// CHECK:STDOUT:     @Negate.%return: ref f64 = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %True.decl: type = class_decl @True [template = constants.%True] {}
// CHECK:STDOUT:   %False.decl: type = class_decl @False [template = constants.%False] {}
// CHECK:STDOUT:   %F.decl: %F.type = fn_decl @F [template = constants.%F] {
// CHECK:STDOUT:     %True.ref: type = name_ref True, %True.decl [template = constants.%True]
// CHECK:STDOUT:     %true_.loc8_6.1: %True = param true_
// CHECK:STDOUT:     @F.%true_: %True = bind_name true_, %true_.loc8_6.1
// CHECK:STDOUT:     %False.ref: type = name_ref False, %False.decl [template = constants.%False]
// CHECK:STDOUT:     %false_.loc8_19.1: %False = param false_
// CHECK:STDOUT:     @F.%false_: %False = bind_name false_, %false_.loc8_19.1
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %RuntimeCall.decl: %RuntimeCall.type = fn_decl @RuntimeCall [template = constants.%RuntimeCall] {
// CHECK:STDOUT:     %.loc16_19.1: i32 = int_literal 64 [template = constants.%.1]
// CHECK:STDOUT:     %float.make_type.loc16_19: init type = call constants.%Float(%.loc16_19.1) [template = f64]
// CHECK:STDOUT:     %.loc16_19.2: type = value_of_initializer %float.make_type.loc16_19 [template = f64]
// CHECK:STDOUT:     %.loc16_19.3: type = converted %float.make_type.loc16_19, %.loc16_19.2 [template = f64]
// CHECK:STDOUT:     %a.loc16_16.1: f64 = param a
// CHECK:STDOUT:     @RuntimeCall.%a: f64 = bind_name a, %a.loc16_16.1
// CHECK:STDOUT:     %.loc16_27.1: i32 = int_literal 64 [template = constants.%.1]
// CHECK:STDOUT:     %float.make_type.loc16_27: init type = call constants.%Float(%.loc16_27.1) [template = f64]
// CHECK:STDOUT:     %.loc16_27.2: type = value_of_initializer %float.make_type.loc16_27 [template = f64]
// CHECK:STDOUT:     %.loc16_27.3: type = converted %float.make_type.loc16_27, %.loc16_27.2 [template = f64]
// CHECK:STDOUT:     %b.loc16_24.1: f64 = param b
// CHECK:STDOUT:     @RuntimeCall.%b: f64 = bind_name b, %b.loc16_24.1
// CHECK:STDOUT:     %bool.make_type.loc16: init type = call constants.%Bool() [template = bool]
// CHECK:STDOUT:     %.loc16_35.1: type = value_of_initializer %bool.make_type.loc16 [template = bool]
// CHECK:STDOUT:     %.loc16_35.2: type = converted %bool.make_type.loc16, %.loc16_35.1 [template = bool]
// CHECK:STDOUT:     @RuntimeCall.%return: ref bool = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @True {
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%True
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @False {
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%False
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Float(%size: i32) -> type = "float.make_type";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Bool() -> type = "bool.make_type";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @LessEq(%a: f64, %b: f64) -> bool = "float.less_eq";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Negate(%a: f64) -> f64 = "float.negate";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @F(%true_: %True, %false_: %False) {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %true_.ref.loc9: %True = name_ref true_, %true_
// CHECK:STDOUT:   %LessEq.ref.loc9: %LessEq.type = name_ref LessEq, file.%LessEq.decl [template = constants.%LessEq]
// CHECK:STDOUT:   %.loc9_23: f64 = float_literal 1 [template = constants.%.5]
// CHECK:STDOUT:   %.loc9_28: f64 = float_literal 2 [template = constants.%.6]
// CHECK:STDOUT:   %float.less_eq.loc9: init bool = call %LessEq.ref.loc9(%.loc9_23, %.loc9_28) [template = constants.%.7]
// CHECK:STDOUT:   %.loc9_13.1: bool = value_of_initializer %float.less_eq.loc9 [template = constants.%.7]
// CHECK:STDOUT:   %.loc9_13.2: bool = converted %float.less_eq.loc9, %.loc9_13.1 [template = constants.%.7]
// CHECK:STDOUT:   if %.loc9_13.2 br !if.expr.then.loc9 else br !if.expr.else.loc9
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc9:
// CHECK:STDOUT:   %True.ref.loc9: type = name_ref True, file.%True.decl [template = constants.%True]
// CHECK:STDOUT:   br !if.expr.result.loc9(%True.ref.loc9)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc9:
// CHECK:STDOUT:   %False.ref.loc9: type = name_ref False, file.%False.decl [template = constants.%False]
// CHECK:STDOUT:   br !if.expr.result.loc9(%False.ref.loc9)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc9:
// CHECK:STDOUT:   %.loc9_13.3: type = block_arg !if.expr.result.loc9 [template = constants.%True]
// CHECK:STDOUT:   %true_.ref.loc10: %True = name_ref true_, %true_
// CHECK:STDOUT:   %LessEq.ref.loc10: %LessEq.type = name_ref LessEq, file.%LessEq.decl [template = constants.%LessEq]
// CHECK:STDOUT:   %.loc10_23: f64 = float_literal 1 [template = constants.%.5]
// CHECK:STDOUT:   %.loc10_28: f64 = float_literal 1 [template = constants.%.5]
// CHECK:STDOUT:   %float.less_eq.loc10: init bool = call %LessEq.ref.loc10(%.loc10_23, %.loc10_28) [template = constants.%.7]
// CHECK:STDOUT:   %.loc10_13.1: bool = value_of_initializer %float.less_eq.loc10 [template = constants.%.7]
// CHECK:STDOUT:   %.loc10_13.2: bool = converted %float.less_eq.loc10, %.loc10_13.1 [template = constants.%.7]
// CHECK:STDOUT:   if %.loc10_13.2 br !if.expr.then.loc10 else br !if.expr.else.loc10
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc10:
// CHECK:STDOUT:   %True.ref.loc10: type = name_ref True, file.%True.decl [template = constants.%True]
// CHECK:STDOUT:   br !if.expr.result.loc10(%True.ref.loc10)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc10:
// CHECK:STDOUT:   %False.ref.loc10: type = name_ref False, file.%False.decl [template = constants.%False]
// CHECK:STDOUT:   br !if.expr.result.loc10(%False.ref.loc10)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc10:
// CHECK:STDOUT:   %.loc10_13.3: type = block_arg !if.expr.result.loc10 [template = constants.%True]
// CHECK:STDOUT:   %false_.ref.loc11: %False = name_ref false_, %false_
// CHECK:STDOUT:   %LessEq.ref.loc11: %LessEq.type = name_ref LessEq, file.%LessEq.decl [template = constants.%LessEq]
// CHECK:STDOUT:   %.loc11_24: f64 = float_literal 1 [template = constants.%.5]
// CHECK:STDOUT:   %.loc11_29: f64 = float_literal 0 [template = constants.%.8]
// CHECK:STDOUT:   %float.less_eq.loc11: init bool = call %LessEq.ref.loc11(%.loc11_24, %.loc11_29) [template = constants.%.9]
// CHECK:STDOUT:   %.loc11_14.1: bool = value_of_initializer %float.less_eq.loc11 [template = constants.%.9]
// CHECK:STDOUT:   %.loc11_14.2: bool = converted %float.less_eq.loc11, %.loc11_14.1 [template = constants.%.9]
// CHECK:STDOUT:   if %.loc11_14.2 br !if.expr.then.loc11 else br !if.expr.else.loc11
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc11:
// CHECK:STDOUT:   %True.ref.loc11: type = name_ref True, file.%True.decl [template = constants.%True]
// CHECK:STDOUT:   br !if.expr.result.loc11(%True.ref.loc11)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc11:
// CHECK:STDOUT:   %False.ref.loc11: type = name_ref False, file.%False.decl [template = constants.%False]
// CHECK:STDOUT:   br !if.expr.result.loc11(%False.ref.loc11)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc11:
// CHECK:STDOUT:   %.loc11_14.3: type = block_arg !if.expr.result.loc11 [template = constants.%False]
// CHECK:STDOUT:   %true_.ref.loc12: %True = name_ref true_, %true_
// CHECK:STDOUT:   %LessEq.ref.loc12: %LessEq.type = name_ref LessEq, file.%LessEq.decl [template = constants.%LessEq]
// CHECK:STDOUT:   %Negate.ref.loc12: %Negate.type = name_ref Negate, file.%Negate.decl [template = constants.%Negate]
// CHECK:STDOUT:   %.loc12_30: f64 = float_literal 1 [template = constants.%.5]
// CHECK:STDOUT:   %float.negate.loc12: init f64 = call %Negate.ref.loc12(%.loc12_30) [template = constants.%.10]
// CHECK:STDOUT:   %.loc12_36: f64 = float_literal 0 [template = constants.%.8]
// CHECK:STDOUT:   %.loc12_22.1: f64 = value_of_initializer %float.negate.loc12 [template = constants.%.10]
// CHECK:STDOUT:   %.loc12_22.2: f64 = converted %float.negate.loc12, %.loc12_22.1 [template = constants.%.10]
// CHECK:STDOUT:   %float.less_eq.loc12: init bool = call %LessEq.ref.loc12(%.loc12_22.2, %.loc12_36) [template = constants.%.7]
// CHECK:STDOUT:   %.loc12_13.1: bool = value_of_initializer %float.less_eq.loc12 [template = constants.%.7]
// CHECK:STDOUT:   %.loc12_13.2: bool = converted %float.less_eq.loc12, %.loc12_13.1 [template = constants.%.7]
// CHECK:STDOUT:   if %.loc12_13.2 br !if.expr.then.loc12 else br !if.expr.else.loc12
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc12:
// CHECK:STDOUT:   %True.ref.loc12: type = name_ref True, file.%True.decl [template = constants.%True]
// CHECK:STDOUT:   br !if.expr.result.loc12(%True.ref.loc12)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc12:
// CHECK:STDOUT:   %False.ref.loc12: type = name_ref False, file.%False.decl [template = constants.%False]
// CHECK:STDOUT:   br !if.expr.result.loc12(%False.ref.loc12)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc12:
// CHECK:STDOUT:   %.loc12_13.3: type = block_arg !if.expr.result.loc12 [template = constants.%True]
// CHECK:STDOUT:   %false_.ref.loc13: %False = name_ref false_, %false_
// CHECK:STDOUT:   %LessEq.ref.loc13: %LessEq.type = name_ref LessEq, file.%LessEq.decl [template = constants.%LessEq]
// CHECK:STDOUT:   %.loc13_24: f64 = float_literal 0 [template = constants.%.8]
// CHECK:STDOUT:   %Negate.ref.loc13: %Negate.type = name_ref Negate, file.%Negate.decl [template = constants.%Negate]
// CHECK:STDOUT:   %.loc13_36: f64 = float_literal 1 [template = constants.%.5]
// CHECK:STDOUT:   %float.negate.loc13: init f64 = call %Negate.ref.loc13(%.loc13_36) [template = constants.%.10]
// CHECK:STDOUT:   %.loc13_23.1: f64 = value_of_initializer %float.negate.loc13 [template = constants.%.10]
// CHECK:STDOUT:   %.loc13_23.2: f64 = converted %float.negate.loc13, %.loc13_23.1 [template = constants.%.10]
// CHECK:STDOUT:   %float.less_eq.loc13: init bool = call %LessEq.ref.loc13(%.loc13_24, %.loc13_23.2) [template = constants.%.9]
// CHECK:STDOUT:   %.loc13_14.1: bool = value_of_initializer %float.less_eq.loc13 [template = constants.%.9]
// CHECK:STDOUT:   %.loc13_14.2: bool = converted %float.less_eq.loc13, %.loc13_14.1 [template = constants.%.9]
// CHECK:STDOUT:   if %.loc13_14.2 br !if.expr.then.loc13 else br !if.expr.else.loc13
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.then.loc13:
// CHECK:STDOUT:   %True.ref.loc13: type = name_ref True, file.%True.decl [template = constants.%True]
// CHECK:STDOUT:   br !if.expr.result.loc13(%True.ref.loc13)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.else.loc13:
// CHECK:STDOUT:   %False.ref.loc13: type = name_ref False, file.%False.decl [template = constants.%False]
// CHECK:STDOUT:   br !if.expr.result.loc13(%False.ref.loc13)
// CHECK:STDOUT:
// CHECK:STDOUT: !if.expr.result.loc13:
// CHECK:STDOUT:   %.loc13_14.3: type = block_arg !if.expr.result.loc13 [template = constants.%False]
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @RuntimeCall(%a: f64, %b: f64) -> bool {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %LessEq.ref: %LessEq.type = name_ref LessEq, file.%LessEq.decl [template = constants.%LessEq]
// CHECK:STDOUT:   %a.ref: f64 = name_ref a, %a
// CHECK:STDOUT:   %b.ref: f64 = name_ref b, %b
// CHECK:STDOUT:   %float.less_eq: init bool = call %LessEq.ref(%a.ref, %b.ref)
// CHECK:STDOUT:   %.loc17_22.1: bool = value_of_initializer %float.less_eq
// CHECK:STDOUT:   %.loc17_22.2: bool = converted %float.less_eq, %.loc17_22.1
// CHECK:STDOUT:   return %.loc17_22.2
// CHECK:STDOUT: }
// CHECK:STDOUT:
