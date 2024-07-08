func @main() {
  %const = quay.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>
  quay.print %const : tensor<2x3xf64>
  %transposed = quay.transpose %const : tensor<2x3xf64> -> tensor<3x2xf64>
  quay.print %transposed : tensor<3x2xf64>
  return
}