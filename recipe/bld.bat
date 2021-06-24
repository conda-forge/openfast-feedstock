
mkdir build
cd build

cmake -G "MinGW Makefiles" ^
    -DDOUBLE_PRECISION=OFF ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    ..
if errorlevel 1 exit 1

REM -DBLAS_LIBRARIES=$BLASLIB
REM -DLAPACK_LIBRARIES=$BLASLIB
REM cmake .. -G "MinGW Makefiles" -D CMAKE_Fortran_FLAGS="-ffree-line-length-0"
REM if errorlevel 1 exit 1

cmake --build . --config Debug --target install
if errorlevel 1 exit 1
