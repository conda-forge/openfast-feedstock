#!/bin/bash

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == 1 && $target_platform == "osx-arm64" ]]; then
    export FFLAGS="${FFLAGS:-} -Wl,--as-needed"
    export LDLAGS="${FFLAGS:-} -Wl,--as-needed"
fi

mkdir build
cd build

cmake \
    -S ${SRC_DIR} \
    -B . \
    -DDOUBLE_PRECISION=OFF \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_FASTFARM=ON
    # -DBUILD_OPENFAST_CPP_API=ON

make -j"${CPU_COUNT}" install
