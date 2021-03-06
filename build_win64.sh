#!/bin/bash
# 64 Bit Version
mkdir -p window/x86_64

cd luajit-2.1
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m64 -O2" XCFLAGS=-DLUAJIT_ENABLE_GC64
cp src/libluajit.a ../window/x86_64/libluajit.a
mingw32-make clean

cd ..

gcc -m64 -O2 -std=gnu99 -shared -w \
 tolua.c \
 int64.c \
 uint64.c \
 pb.c \
 lpeg.c \
 struct.c \
 cjson/strbuf.c \
 cjson/lua_cjson.c \
 cjson/fpconv.c \
 luasocket/auxiliar.c \
 luasocket/buffer.c \
 luasocket/except.c \
 luasocket/inet.c \
 luasocket/io.c \
 luasocket/luasocket.c \
 luasocket/mime.c \
 luasocket/options.c \
 luasocket/select.c \
 luasocket/tcp.c \
 luasocket/timeout.c \
 luasocket/udp.c \
 luasocket/wsocket.c \
 luv/luv.c \
 pack/lpack.c \
 uuid/wuuid.c \
 uuid/luuid.c \
 lsqlite3/sqlite3/src/shell.c \
 lsqlite3/sqlite3/src/sqlite3.c \
 lsqlite3/lsqlite3.c \
 luafilesystem/src/lfs.c \
 -o Plugins/x86_64/tolua.dll \
 -I./ \
 -Iluajit-2.1/src \
 -Iluasocket \
 -Ilibuv-v1.19.2/include \
 -Iluv \
 -Ipack \
 -Iuuid \
 -Ilsqlite3 \
 -Ilsqlite3/sqlite3/src \
 -Iluafilesystem/src \
 -L./window/x86_64 -luv \
 -lws2_32 -lpsapi -luserenv -lkernel32 -luser32 -liphlpapi -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lrpcrt4 \
 -Wl,--whole-archive window/x86_64/libluajit.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++
 