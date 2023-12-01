@echo on

mkdir build

set LDFLAGS="-static"

cmake ^
    -S %SRC_DIR% ^
    -B build ^
    -G "MinGW Makefiles" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DDOUBLE_PRECISION=OFF ^
    -DBLA_VENDOR=OpenBLAS ^
    -DBLA_STATIC=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DBUILD_FASTFARM=ON ^
    -DCMAKE_C_COMPILER=gcc.exe ^
    -DCMAKE_CXX_COMPILER=g++.exe ^
    -DCMAKE_Fortran_COMPILER=gfortran.exe
if errorlevel 1 exit /b 1
	
cmake --build . --target install -j ${CPU_COUNT}
if errorlevel 1 exit /b 1