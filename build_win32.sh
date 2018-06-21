#!/bin/bash
# 32 Bit Version
mkdir -p window/x86

cd luajit-2.1
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m32 -O2"
cp src/libluajit.a ../window/x86/libluajit.a
mingw32-make clean

cd ..

gcc -m32 -O2 -std=gnu99 -shared -w \
	int64.c \
	uint64.c \
	tolua.c \
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
	-o Plugins/x86/tolua.dll \
	-I./ \
	-Iluajit-2.1/src \
	-Icjson \
	-Iluasocket \
	-Ilibuv-v1.19.2/include \
	-Iluv \
	-Ipack \
	-Iuuid \
	-Ilsqlite3 \
	-Ilsqlite3/sqlite3/src \
	-L./window/x86 -luv \
	-lws2_32 -lpsapi -luserenv -lkernel32 -luser32 -liphlpapi -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lrpcrt4 \
	-Wl,--whole-archive window/x86/libluajit.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++
