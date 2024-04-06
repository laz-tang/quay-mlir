#ifndef H_QUAYDIALECT_TD
#define H_QUAYDIALECT_TD

include "mlir/IR/OpBase.td"

def Quay_Dialect : Dialect {
  let name = "quay";
  let summary = "A quay out-of-tree MLIR dialect.";
  let description = [{
    This dialect is used to optimize the operator 'transpose'
  }];

  let cppNamespace = "quay";
  let hasConstantMaterializer = 1;
}

class Quay_Op<string mnemonic, list<Trait> traits = []> :
    Op<Quay_Dialect, mnemonic, traits>;

#endif // H_QUAYDIALECT_TD

