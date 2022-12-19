mkdir build
cd build

cmake -G "Ninja" ^
    -S %SRC_DIR% ^
    -B . ^
    -DCMAKE_C_COMPILER=clang ^
    -DCMAKE_CXX_COMPILER=clang++ ^
    -DCMAKE_Fortran_COMPILER=flang ^
    -DDOUBLE_PRECISION=OFF ^
    -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=lib ^
    -DBUILD_FASTFARM=ON ^
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    
if errorlevel 1 exit 1

cmake --build . --target install

if errorlevel 1 exit 1