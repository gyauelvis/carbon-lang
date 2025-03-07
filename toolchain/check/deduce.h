// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#ifndef CARBON_TOOLCHAIN_CHECK_DEDUCE_H_
#define CARBON_TOOLCHAIN_CHECK_DEDUCE_H_

#include "toolchain/check/context.h"
#include "toolchain/sem_ir/ids.h"

namespace Carbon::Check {

// Deduces the generic arguments to use in a call to a generic.
auto DeduceGenericCallArguments(Context& context, Parse::NodeId node_id,
                                SemIR::GenericId generic_id,
                                SemIR::SpecificId enclosing_specific_id,
                                SemIR::InstBlockId implicit_params_id,
                                SemIR::InstBlockId params_id,
                                SemIR::InstId self_id,
                                llvm::ArrayRef<SemIR::InstId> arg_ids)
    -> SemIR::SpecificId;

}  // namespace Carbon::Check

#endif  // CARBON_TOOLCHAIN_CHECK_DEDUCE_H_
