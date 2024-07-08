## 不知道对不对

add_mlir_conversion_library(MLIRQuayConversion
        LowerToAffine.cpp
        LowerToLLVM.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/Quay

        DEPENDS
        MLIRQuay
        )