#!/usr/bin/env bash
set -eu -o pipefail

mkdir -p /3rdparty

# LuaJIT
cd /3rdparty
git clone http://luajit.org/git/luajit-2.0.git
rm -rf luajit-2.0/.git
cd luajit-2.0
make BUILDMODE=STATIC && make install
find . -iname *.o -exec rm {} \;

# OpenAL
cd /3rdparty
git clone https://github.com/kcat/openal-soft.git
rm -rf openal-soft/.git
cd openal-soft
mkdir -p build && cd build
cmake .. -DLIBTYPE=STATIC -DALSOFT_UTILS=off -DALSOFT_TESTS=off -DALSOFT_INSTALL=off -DALSOFT_EXAMPLES=off
make
find . -iname *.o -exec rm {} \;

# PhysFS
cd /3rdparty
hg clone -r stable-2.0 https://hg.icculus.org/icculus/physfs/
rm -rf physfs/.hg*
cd physfs
mkdir -p build && cd build
cmake .. \
	-DPHYSFS_BUILD_STATIC=true \
	-DPHYSFS_BUILD_TEST=false \
	-DPHYSFS_ARCHIVE_ZIP=true \
	-DPHYSFS_ARCHIVE_7Z=true \
	-DPHYSFS_ARCHIVE_GRP=false \
	-DPHYSFS_ARCHIVE_WAD=false \
	-DPHYSFS_ARCHIVE_HOG=false \
	-DPHYSFS_ARCHIVE_MVL=false \
	-DPHYSFS_ARCHIVE_QPAK=false \
	-DPHYSFS_HAVE_CDROM_SUPPORT=false \
	-DPHYSFS_HAVE_THREAD_SUPPORT=true
make
find . -iname *.o -exec rm {} \;
