#!/bin/bash

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == 1 && $target_platform == "osx-arm64" ]]; then
    export LDFLAGS="${LDFLAGS:-} -lquadmath"
fi

mkdir build
cd build

cmake \
    -S ${SRC_DIR} \
    -B . \
    -DDOUBLE_PRECISION=OFF \
    -DGIT_DESCRIBE=v${PKG_VERSION} \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DBUILD_FASTFARM=ON \
    -DBLA_VENDOR=OpenBLAS \
    -DBLA_STATIC=ON

cmake --build . --target install -j ${CPU_COUNT}
