#!/bin/bash

mkdir build

if [ "$(uname)" == "Darwin" ]; then

    if [ -n "${FFLAGS}" ] ; then
	export FFLAGS="-O2 ${FFLAGS} -O2"
    else
	export FFLAGS="-O2"
    fi
    
    if [ -n "${CFLAGS}" ] ; then
	export CFLAGS="-O2 ${CFLAGS} -O2"
    else
	export CFLAGS="-O2"
    fi
    
    if [ -n "${CXXFLAGS}" ] ; then
	export CXXFLAGS="-O2 ${CXXFLAGS} -O2"
    else
	export CXXFLAGS="-O2"
    fi
fi

btype="Release"

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
    -DBUILD_FASTFARM=ON


cmake --build build --target install -j ${CPU_COUNT}
