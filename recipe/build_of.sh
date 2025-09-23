#!/bin/bash

mkdir build

#if [ "$(uname)" == "Darwin" ]; then
#    btype="RelWithDebInfo"
vtrack=0
#else
btype="Release"
#    vtrack=1
#fi

cmake \
    -S ${SRC_DIR} \
    -B build \
    -G "Ninja" \
    -DCMAKE_BUILD_TYPE=${btype} \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DGIT_DESCRIBE=v${PKG_VERSION} \
    -DDOUBLE_PRECISION=OFF \
    -DBLA_VENDOR=OpenBLAS \
    -DBLA_STATIC=ON \
    -DBUILD_FASTFARM=ON \
    -DVARIABLE_TRACKING=${vtrack}

cmake --build build --target install -j ${CPU_COUNT}
