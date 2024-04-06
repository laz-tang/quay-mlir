add_mlir_dialect_library(MLIRQuay
		QuayDialect.cpp
		QuayOps.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/Quay

        # 多此一举
        # DEPENDS
        # MLIRQuayOpsIncGen

        LINK_LIBS PUBLIC
        MLIRIR
	)
