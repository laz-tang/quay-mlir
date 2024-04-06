LLVM_REPO=./llvm-project

if [ -d "build" ]; then
    rm -rf build
fi

mkdir build && cd build
cmake -G Ninja .. \
  -DLLVM_DIR=$LLVM_REPO/build/lib/cmake/llvm \
  -DMLIR_DIR=$LLVM_REPO/build/lib/cmake/mlir \
  
cmake --build . --target quay-opt