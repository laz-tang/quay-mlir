#ifndef H_QUAYOPS_TD
#define H_QUAYOPS_TD

include "QuayDialect.td"

include "mlir/IR/BuiltinAttributeInterfaces.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/Interfaces/CallInterfaces.td"
include "mlir/Interfaces/CastInterfaces.td"
include "mlir/Interfaces/FunctionInterfaces.td"
include "mlir/Interfaces/InferTypeOpInterface.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def ConstantOp : Quay_Op<"constant", [Pure]> {
  let summary = "constant";
  let description = [{
    Constant operation turns a literal into an SSA value. The data is attached
    to the operation as an attribute. For example:

    ```mlir
      %0 = quay.constant dense<[[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]>
                        : tensor<2x3xf64>
    ```
  }];

  let builders = [
    OpBuilder<(ins "mlir::DenseElementsAttr":$value), [{
      build($_builder, $_state, value.getType(), value);
    }]>,
    OpBuilder<(ins "double":$value)>
  ];

  let arguments = (ins F64ElementsAttr:$value);
  let results = (outs F64Tensor);
}

def PrintOp : Quay_Op<"print", [Pure]> {
  let summary = "print operation";
  let description = [{
    The "print" builtin operation prints a given input tensor, and produces
    no results.
  }];

  let arguments = (ins AnyTypeOf<[F64Tensor, F64MemRef]>:$input);

  let assemblyFormat = [{
    $input attr-dict `:` type($input)
  }];
}

def TransposeOp : Quay_Op<"transpose", [Pure]> {
  let summary = "transpose operation";

  let arguments = (ins F64Tensor:$input);
  let results = (outs F64Tensor);

  let assemblyFormat = [{
     $input `:` type($input) attr-dict `->` type(results)
  }];

  // Allow building a TransposeOp with from the input operand.
  let builders = [
    OpBuilder<(ins "Value":$input)>
  ];

  // Invoke a static verify method to verify this transpose operation.
  let hasVerifier = 1;
}

#endif // H_QUAYOPS_TD