#include "mlir/IR/Builders.h"
#include "mlir/IR/OpImplementation.h"

#include "Quay/QuayDialect.h"
#include "Quay/QuayOps.h"

using namespace mlir;
using namespace quay;

#include "Quay/QuayOpsDialect.cpp.inc"

void QuayDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "Quay/QuayOps.cpp.inc"
      >();
}

void quay::ConstantOp::build(mlir::OpBuilder &builder,
                              mlir::OperationState &state, double value) {
  auto dataType = RankedTensorType::get({}, builder.getF64Type());
  auto dataAttribute = DenseElementsAttr::get(dataType, value);
  quay::ConstantOp::build(builder, state, dataType, dataAttribute);
}

mlir::Operation *QuayDialect::materializeConstant(mlir::OpBuilder &builder,
                                                   mlir::Attribute value,
                                                   mlir::Type type,
                                                   mlir::Location loc) {
  return builder.create<quay::ConstantOp>(
      loc, type, value.cast<mlir::DenseElementsAttr>());
}