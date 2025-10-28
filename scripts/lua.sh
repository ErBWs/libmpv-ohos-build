#!/bin/bash

set -eu

pushd $HOME/libmpv/lua

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	make clean
	exit 0
else
	exit 1
fi

# LUA_T= and LUAC_T= to disable building lua & luac
make CC="$CC" AR="$AR rcu" RANLIB="$RANLIB" PLAT=linux LUA_T= LUAC_T= -j$CORES
make INSTALL_TOP=$DEST TO_BIN=/dev/null install

make INSTALL_TOP=$DEST pc > $DEST/lib/pkgconfig/lua.pc
cat >> $DEST/lib/pkgconfig/lua.pc <<'EOF'

Name: Lua
Description:
Version: ${version}
Libs: -L${libdir} -llua
Cflags: -I${includedir}
EOF

popd