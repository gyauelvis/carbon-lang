// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/parse/testdata/if_expr/fail_then_expr_missing.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/parse/testdata/if_expr/fail_then_expr_missing.carbon

fn F() {
  // CHECK:STDERR: fail_then_expr_missing.carbon:[[@LINE+3]]:28: ERROR: Expected expression.
  // CHECK:STDERR:   var n: i32 = if true then;
  // CHECK:STDERR:                            ^
  var n: i32 = if true then;
}

// CHECK:STDOUT: - filename: fail_then_expr_missing.carbon
// CHECK:STDOUT:   parse_tree: [
// CHECK:STDOUT:     {kind: 'FileStart', text: ''},
// CHECK:STDOUT:         {kind: 'FunctionIntroducer', text: 'fn'},
// CHECK:STDOUT:         {kind: 'IdentifierName', text: 'F'},
// CHECK:STDOUT:           {kind: 'TuplePatternStart', text: '('},
// CHECK:STDOUT:         {kind: 'TuplePattern', text: ')', subtree_size: 2},
// CHECK:STDOUT:       {kind: 'FunctionDefinitionStart', text: '{', subtree_size: 5},
// CHECK:STDOUT:         {kind: 'VariableIntroducer', text: 'var'},
// CHECK:STDOUT:           {kind: 'IdentifierName', text: 'n'},
// CHECK:STDOUT:           {kind: 'IntTypeLiteral', text: 'i32'},
// CHECK:STDOUT:         {kind: 'BindingPattern', text: ':', subtree_size: 3},
// CHECK:STDOUT:         {kind: 'VariableInitializer', text: '='},
// CHECK:STDOUT:             {kind: 'BoolLiteralTrue', text: 'true'},
// CHECK:STDOUT:           {kind: 'IfExprIf', text: 'if', subtree_size: 2},
// CHECK:STDOUT:             {kind: 'InvalidParse', text: ';', has_error: yes},
// CHECK:STDOUT:           {kind: 'IfExprThen', text: 'then', has_error: yes, subtree_size: 2},
// CHECK:STDOUT:           {kind: 'InvalidParse', text: ';', has_error: yes},
// CHECK:STDOUT:         {kind: 'IfExprElse', text: 'if', has_error: yes, subtree_size: 6},
// CHECK:STDOUT:       {kind: 'VariableDecl', text: ';', subtree_size: 12},
// CHECK:STDOUT:     {kind: 'FunctionDefinition', text: '}', subtree_size: 18},
// CHECK:STDOUT:     {kind: 'FileEnd', text: ''},
// CHECK:STDOUT:   ]
