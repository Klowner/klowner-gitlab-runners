#!/usr/bin/env bash
set -eu -o pipefail

mkdir -p /3rdparty

# LuaJIT
cd /3rdparty
git clone http://luajit.org/git/luajit-2.0.git
rm -rf luajit-2.0/.git
cd luajit-2.0
make HOST_CC='gcc -m64' CROSS=x86_64-w64-mingw32- TARGET_SYS=Windows BUILDMODE=static
find . -iname *.o -exec rm {} \;

# OpenAL
OPENAL_VERSION=1.17.2
cd /3rdparty
curl http://kcat.strangesoft.net/openal-binaries/openal-soft-${OPENAL_VERSION}-bin.zip > openal-soft.zip
unzip openal-soft.zip
rm openal-soft.zip

# PhysFS
cd /3rdparty
hg clone https://hg.icculus.org/icculus/physfs/
rm -rf physfs/.hg*
