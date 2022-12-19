mkdir build
cd build

cmake -G "Ninja" ^
    -S %SRC_DIR% ^
    -B . ^
    -DDOUBLE_PRECISION=OFF ^
    -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=lib ^
    -DBUILD_FASTFARM=ON ^
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    
if errorlevel 1 exit 1

cmake --build . --target install

if errorlevel 1 exit 1