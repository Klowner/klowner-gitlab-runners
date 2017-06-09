#!/bin/sh
export PATH="/usr/lib/colorgcc/bin:$PATH"
export CCACHE_PATH="/usr/bin"
export CCACHE_DIR="/mnt/cache"
export CGCC_FORCE_COLOR=true
sed -e 's/\/usr\//\/usr\/lib\/ccache\//' -i /etc/colorgcc/colorgccrc
sed -e 's/^#\([^:]*\)\: /\1: /' -i /etc/colorgcc/colorgccrc
