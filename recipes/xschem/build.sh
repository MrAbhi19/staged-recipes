#!/bin/bash
set -ex

# Pass the Conda paths to the build system without breaking the CC variable
export CFLAGS="${CFLAGS} -I${PREFIX}/include -Wno-format-security"
export CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib"

./configure \
    --prefix="${PREFIX}"

make -j"${CPU_COUNT}"
make install
