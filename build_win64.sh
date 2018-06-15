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
 luv/luv.c \
 -o Plugins/x86_64/tolua.dll \
 -I./ \
 -Iluajit-2.1/src \
 -Ilibuv-v1.19.2/include \
 -Iluv \
 -L./window/x86_64 -luv \
 -lws2_32 -lpsapi -luserenv -lkernel32 -luser32 -liphlpapi -lgdi32 -lwinspool -lcomdlg32 -ladvapi32  \
 -Wl,--whole-archive window/x86_64/libluajit.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++
 
echo 按任意键继续
read -n 1
echo 继续运行