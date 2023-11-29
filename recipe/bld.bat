@echo on

set LDFLAGS="-static"

mkdir build
cd build

cmake ^
    -S %SRC_DIR% ^
    -B . ^
    -G "MinGW Makefiles" ^
    -DCMAKE_FIND_LIBRARY_SUFFIXES=".a" ^
    -DCMAKE_BUILD_TYPE="Debug" ^
    -DCMAKE_C_FLAGS="-static" ^
    -DCMAKE_CXX_FLAGS="-static" ^
    -DCMAKE_Fortran_FLAGS="-static" ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DDOUBLE_PRECISION=OFF ^
    -DBLA_VENDOR=OpenBLAS ^
    -DBLA_STATIC=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=lib ^
    -DBUILD_FASTFARM=ON ^
    -DCMAKE_C_COMPILER=gcc.exe ^
    -DCMAKE_CXX_COMPILER=g++.exe ^
    -DCMAKE_Fortran_COMPILER=gfortran.exe

if errorlevel 1 exit /b 1
	
cmake --build . -j 2
if errorlevel 1 exit /b 1

cmake --install .
if errorlevel 1 exit /b 1
