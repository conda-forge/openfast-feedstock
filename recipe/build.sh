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
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_FASTFARM=ON \
    -DBLA_VENDOR=OpenBLAS \
    -DBLA_STATIC=ON

make -j"${CPU_COUNT}" install
