#!/bin/bash
set -ex

mkdir build
cd build

# Use standard Conda-forge CMake arguments to handle prefixing and isolated environments
cmake ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CXX_STANDARD=20 \
  -DCMAKE_CXX_FLAGS="-O3 -ffast-math -flto -DNDEBUG" \
  -DCMAKE_EXE_LINKER_FLAGS="-flto" \
  ..

# Build using all available CPU cores on the CI runner
make -j${CPU_COUNT}

# Manually place the compiled binary into the Conda environment's bin folder
mkdir -p ${PREFIX}/bin
cp src/bin/kepler-formal ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/kepler-formal
