#!/bin/bash
set -e

# pre-build
sed -i 's/STRIP=-s/STRIP=/' Makefile

# build
make CROSS_COMPILE=${BLUEOS_TARGET}- HOST=${BLUEOS_TARGET} PREFIX=/usr SHAREDIR=/usr/share/misc MANDIR=/usr/share/man SHARED=yes ZLIB=no all

# install
make DESTDIR=${BLUEOS_SYSTEM} CROSS_COMPILE=${BLUEOS_TARGET}- HOST=${BLUEOS_TARGET} PREFIX=/usr SHAREDIR=/usr/share/misc MANDIR=/usr/share/man SHARED=yes ZLIB=no install install-lib
chmod -v 755 ${BLUEOS_SYSTEM}/usr/lib/libpci.so.3.2.0

# post-install
rm -f ${BLUEOS_SYSTEM}/usr/lib/*.la