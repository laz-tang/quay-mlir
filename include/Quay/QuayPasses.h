#ifndef H_QUAYPASSES_H
#define H_QUAYPASSES_H

#include <memory>

#include "mlir/Pass/Pass.h"

namespace quay {
std::unique_ptr<mlir::Pass> createLowerToAffinePass();
std::unique_ptr<mlir::Pass> createLowerToLLVMPass();
} // namespace quay

#endif // H_QUAYPASSES_H