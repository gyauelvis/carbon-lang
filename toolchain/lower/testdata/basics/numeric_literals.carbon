// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/lower/testdata/basics/numeric_literals.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/lower/testdata/basics/numeric_literals.carbon

fn F() {
  // 8 and 9 trigger special behavior in APInt when mishandling signed versus
  // unsigned, so we pay extra attention to those.
  var ints: [i32; 4] = (
    8,
    9,
    0x8,
    0b1000,
  );
  var floats: [f64; 6] = (
    0.9,
    8.0,
    80.0,
    1.0e7,
    1.0e8,
    1.0e-8,
  );
}

// CHECK:STDOUT: ; ModuleID = 'numeric_literals.carbon'
// CHECK:STDOUT: source_filename = "numeric_literals.carbon"
// CHECK:STDOUT:
// CHECK:STDOUT: @array.1.loc19_4 = internal constant [4 x i32] [i32 8, i32 9, i32 8, i32 8]
// CHECK:STDOUT: @array.2.loc27_4 = internal constant [6 x double] [double 9.000000e-01, double 8.000000e+00, double 8.000000e+01, double 1.000000e+07, double 1.000000e+08, double 1.000000e-08]
// CHECK:STDOUT:
// CHECK:STDOUT: define void @F() !dbg !4 {
// CHECK:STDOUT: entry:
// CHECK:STDOUT:   %ints.var = alloca [4 x i32], align 4, !dbg !7
// CHECK:STDOUT:   %.loc19_3.3.array.index = getelementptr inbounds [4 x i32], ptr %ints.var, i32 0, i32 0, !dbg !8
// CHECK:STDOUT:   %.loc19_3.6.array.index = getelementptr inbounds [4 x i32], ptr %ints.var, i32 0, i32 1, !dbg !8
// CHECK:STDOUT:   %.loc19_3.9.array.index = getelementptr inbounds [4 x i32], ptr %ints.var, i32 0, i32 2, !dbg !8
// CHECK:STDOUT:   %.loc19_3.12.array.index = getelementptr inbounds [4 x i32], ptr %ints.var, i32 0, i32 3, !dbg !8
// CHECK:STDOUT:   call void @llvm.memcpy.p0.p0.i64(ptr align 4 %ints.var, ptr align 4 @array.1.loc19_4, i64 16, i1 false), !dbg !9
// CHECK:STDOUT:   %floats.var = alloca [6 x double], align 8, !dbg !10
// CHECK:STDOUT:   %.loc27_3.3.array.index = getelementptr inbounds [6 x double], ptr %floats.var, i32 0, i32 0, !dbg !11
// CHECK:STDOUT:   %.loc27_3.6.array.index = getelementptr inbounds [6 x double], ptr %floats.var, i32 0, i32 1, !dbg !11
// CHECK:STDOUT:   %.loc27_3.9.array.index = getelementptr inbounds [6 x double], ptr %floats.var, i32 0, i32 2, !dbg !11
// CHECK:STDOUT:   %.loc27_3.12.array.index = getelementptr inbounds [6 x double], ptr %floats.var, i32 0, i32 3, !dbg !11
// CHECK:STDOUT:   %.loc27_3.15.array.index = getelementptr inbounds [6 x double], ptr %floats.var, i32 0, i32 4, !dbg !11
// CHECK:STDOUT:   %.loc27_3.18.array.index = getelementptr inbounds [6 x double], ptr %floats.var, i32 0, i32 5, !dbg !11
// CHECK:STDOUT:   call void @llvm.memcpy.p0.p0.i64(ptr align 8 %floats.var, ptr align 8 @array.2.loc27_4, i64 48, i1 false), !dbg !12
// CHECK:STDOUT:   ret void, !dbg !13
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: ; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
// CHECK:STDOUT: declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0
// CHECK:STDOUT:
// CHECK:STDOUT: ; uselistorder directives
// CHECK:STDOUT: uselistorder ptr @llvm.memcpy.p0.p0.i64, { 1, 0 }
// CHECK:STDOUT:
// CHECK:STDOUT: attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
// CHECK:STDOUT:
// CHECK:STDOUT: !llvm.module.flags = !{!0, !1}
// CHECK:STDOUT: !llvm.dbg.cu = !{!2}
// CHECK:STDOUT:
// CHECK:STDOUT: !0 = !{i32 7, !"Dwarf Version", i32 5}
// CHECK:STDOUT: !1 = !{i32 2, !"Debug Info Version", i32 3}
// CHECK:STDOUT: !2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "carbon", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
// CHECK:STDOUT: !3 = !DIFile(filename: "numeric_literals.carbon", directory: "")
// CHECK:STDOUT: !4 = distinct !DISubprogram(name: "F", linkageName: "F", scope: null, file: !3, line: 11, type: !5, spFlags: DISPFlagDefinition, unit: !2)
// CHECK:STDOUT: !5 = !DISubroutineType(types: !6)
// CHECK:STDOUT: !6 = !{}
// CHECK:STDOUT: !7 = !DILocation(line: 14, column: 7, scope: !4)
// CHECK:STDOUT: !8 = !DILocation(line: 14, column: 24, scope: !4)
// CHECK:STDOUT: !9 = !DILocation(line: 14, column: 3, scope: !4)
// CHECK:STDOUT: !10 = !DILocation(line: 20, column: 7, scope: !4)
// CHECK:STDOUT: !11 = !DILocation(line: 20, column: 26, scope: !4)
// CHECK:STDOUT: !12 = !DILocation(line: 20, column: 3, scope: !4)
// CHECK:STDOUT: !13 = !DILocation(line: 11, column: 1, scope: !4)
