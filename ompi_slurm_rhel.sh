#!/usr/bin/env bash

yum -y update
dnf install -y autoconf make m4 flex bison gawk libtool pmix-devel
git clone https://github.com/open-mpi/ompi --depth 1 --recursive --shallow-submodules
(
    cd ompi
    git submodule update --init --recursive
    ./autogen.pl
    ./configure --with-slurm --with-pmix --with-hwloc
    make -j11
    make install
)
