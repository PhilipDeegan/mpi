#!/usr/bin/env bash
set -ex

MPICH_VER="3.3.1"

[ ! -d mpich ]  && git clone https://github.com/pmodels/mpich -b v${MPICH_VER} mpich

cd mpich && git submodule update --init
./autogen.sh --without-izem --without-ucx --without-libfabric
./configure --prefix=$PWD --enable-g=all --disable-fast
make -j && make install && make clean

