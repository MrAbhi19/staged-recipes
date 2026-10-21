#!/bin/bash
set -ex

export CFLAGS="${CFLAGS} -I${PREFIX}/include -Wno-format-security"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

# Run scconfig configure script
./configure \
    --prefix="${PREFIX}"

make -j"${CPU_COUNT}"
make install
