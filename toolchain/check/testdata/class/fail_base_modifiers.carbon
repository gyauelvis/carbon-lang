// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/class/fail_base_modifiers.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/class/fail_base_modifiers.carbon

base class B {}

class C1 {
  // CHECK:STDERR: fail_base_modifiers.carbon:[[@LINE+4]]:3: ERROR: `private` not allowed on `base` declaration.
  // CHECK:STDERR:   private extend base: B;
  // CHECK:STDERR:   ^~~~~~~
  // CHECK:STDERR:
  private extend base: B;
}

class C2 {
  // CHECK:STDERR: fail_base_modifiers.carbon:[[@LINE+8]]:3: ERROR: `abstract` not allowed on `base` declaration.
  // CHECK:STDERR:   abstract base: B;
  // CHECK:STDERR:   ^~~~~~~~
  // CHECK:STDERR:
  // CHECK:STDERR: fail_base_modifiers.carbon:[[@LINE+4]]:3: ERROR: Missing `extend` before `base` declaration in class.
  // CHECK:STDERR:   abstract base: B;
  // CHECK:STDERR:   ^~~~~~~~~~~~~~~~~
  // CHECK:STDERR:
  abstract base: B;
}

class C3 {
  // CHECK:STDERR: fail_base_modifiers.carbon:[[@LINE+7]]:10: ERROR: `default` not allowed on declaration with `extend`.
  // CHECK:STDERR:   extend default base: B;
  // CHECK:STDERR:          ^~~~~~~
  // CHECK:STDERR: fail_base_modifiers.carbon:[[@LINE+4]]:3: `extend` previously appeared here.
  // CHECK:STDERR:   extend default base: B;
  // CHECK:STDERR:   ^~~~~~
  // CHECK:STDERR:
  extend default base: B;
}

class C4 {
  // CHECK:STDERR: fail_base_modifiers.carbon:[[@LINE+6]]:10: ERROR: `extend` repeated on declaration.
  // CHECK:STDERR:   extend extend base: B;
  // CHECK:STDERR:          ^~~~~~
  // CHECK:STDERR: fail_base_modifiers.carbon:[[@LINE+3]]:3: `extend` previously appeared here.
  // CHECK:STDERR:   extend extend base: B;
  // CHECK:STDERR:   ^~~~~~
  extend extend base: B;
}

// CHECK:STDOUT: --- fail_base_modifiers.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %B: type = class_type @B [template]
// CHECK:STDOUT:   %.1: type = struct_type {} [template]
// CHECK:STDOUT:   %C1: type = class_type @C1 [template]
// CHECK:STDOUT:   %.2: type = tuple_type () [template]
// CHECK:STDOUT:   %.3: type = ptr_type %.1 [template]
// CHECK:STDOUT:   %.4: type = unbound_element_type %C1, %B [template]
// CHECK:STDOUT:   %.5: type = struct_type {.base: %B} [template]
// CHECK:STDOUT:   %C2: type = class_type @C2 [template]
// CHECK:STDOUT:   %.6: type = unbound_element_type %C2, %B [template]
// CHECK:STDOUT:   %C3: type = class_type @C3 [template]
// CHECK:STDOUT:   %.7: type = unbound_element_type %C3, %B [template]
// CHECK:STDOUT:   %C4: type = class_type @C4 [template]
// CHECK:STDOUT:   %.8: type = unbound_element_type %C4, %B [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/operators
// CHECK:STDOUT:     import Core//prelude/types
// CHECK:STDOUT:     import Core//prelude/operators/arithmetic
// CHECK:STDOUT:     import Core//prelude/operators/bitwise
// CHECK:STDOUT:     import Core//prelude/operators/comparison
// CHECK:STDOUT:     import Core//prelude/types/bool
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .B = %B.decl
// CHECK:STDOUT:     .C1 = %C1.decl
// CHECK:STDOUT:     .C2 = %C2.decl
// CHECK:STDOUT:     .C3 = %C3.decl
// CHECK:STDOUT:     .C4 = %C4.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %B.decl: type = class_decl @B [template = constants.%B] {}
// CHECK:STDOUT:   %C1.decl: type = class_decl @C1 [template = constants.%C1] {}
// CHECK:STDOUT:   %C2.decl: type = class_decl @C2 [template = constants.%C2] {}
// CHECK:STDOUT:   %C3.decl: type = class_decl @C3 [template = constants.%C3] {}
// CHECK:STDOUT:   %C4.decl: type = class_decl @C4 [template = constants.%C4] {}
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @B {
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%B
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @C1 {
// CHECK:STDOUT:   %B.ref: type = name_ref B, file.%B.decl [template = constants.%B]
// CHECK:STDOUT:   %.loc18: %.4 = base_decl %B, element0 [template]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%C1
// CHECK:STDOUT:   .base = %.loc18
// CHECK:STDOUT:   extend name_scope2
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @C2 {
// CHECK:STDOUT:   %B.ref: type = name_ref B, file.%B.decl [template = constants.%B]
// CHECK:STDOUT:   %.loc30: %.6 = base_decl %B, element0 [template]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%C2
// CHECK:STDOUT:   .base = %.loc30
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @C3 {
// CHECK:STDOUT:   %B.ref: type = name_ref B, file.%B.decl [template = constants.%B]
// CHECK:STDOUT:   %.loc41: %.7 = base_decl %B, element0 [template]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%C3
// CHECK:STDOUT:   .base = %.loc41
// CHECK:STDOUT:   extend name_scope2
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @C4 {
// CHECK:STDOUT:   %B.ref: type = name_ref B, file.%B.decl [template = constants.%B]
// CHECK:STDOUT:   %.loc51: %.8 = base_decl %B, element0 [template]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%C4
// CHECK:STDOUT:   .base = %.loc51
// CHECK:STDOUT:   extend name_scope2
// CHECK:STDOUT: }
// CHECK:STDOUT:
