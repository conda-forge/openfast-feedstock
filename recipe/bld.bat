@echo on

set "CC=%BUILD_PREFIX%\Library\bin\x86_64-w64-mingw32-gcc.exe"
set "CXX=%BUILD_PREFIX%\Library\bin\x86_64-w64-mingw32-g++.exe"
set "FC=%BUILD_PREFIX%\Library\bin\x86_64-w64-mingw32-gfortran.exe"

mkdir build

cmake ^
    -S %SRC_DIR% ^
    -B build ^
    -G "Ninja" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_Fortran_COMPILER=%FC% ^
    -DCMAKE_C_COMPILER=%CC% ^
    -DCMAKE_CXX_COMPILER=%CXX% ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded ^
    -DGIT_DESCRIBE=v%PKG_VERSION% ^
    -DBLA_STATIC=ON ^
    -DDOUBLE_PRECISION=OFF ^
    -DBUILD_FASTFARM=ON
if errorlevel 1 exit /b 1
	
cmake --build build  --target install -j %CPU_COUNT%
if errorlevel 1 exit /b 1