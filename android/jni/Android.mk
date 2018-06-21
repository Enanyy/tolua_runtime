LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libluajit
LOCAL_SRC_FILES := libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := tolua
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../luajit-2.1/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../uuid
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../uuid/libuuid-1.0.3
LOCAL_CPPFLAGS := -O2
LOCAL_CFLAGS :=  -O2 -std=gnu99 -g -DNDEBUG -DHAVE_USLEEP
LOCAL_SRC_FILES :=	../../tolua.c \
					../../int64.c \
					../../uint64.c \
					../../pb.c \
					../../lpeg.c \
					../../struct.c \
					../../cjson/strbuf.c \
					../../cjson/lua_cjson.c \
					../../cjson/fpconv.c \
					../../luasocket/auxiliar.c \
 					../../luasocket/buffer.c \
 					../../luasocket/except.c \
 					../../luasocket/inet.c \
 					../../luasocket/io.c \
 					../../luasocket/luasocket.c \
 					../../luasocket/mime.c \
 					../../luasocket/options.c \
 					../../luasocket/select.c \
 					../../luasocket/tcp.c \
 					../../luasocket/timeout.c \
 					../../luasocket/udp.c \
 					../../luasocket/usocket.c \
					../../pack/lpack.c \
					../../uuid/luuid.c \
					../../uuid/libuuid-1.0.3/clear.c \
					../../uuid/libuuid-1.0.3/compare.c \
					../../uuid/libuuid-1.0.3/copy.c \
					../../uuid/libuuid-1.0.3/gen_uuid.c \
					../../uuid/libuuid-1.0.3/isnull.c \
					../../uuid/libuuid-1.0.3/pack.c \
					../../uuid/libuuid-1.0.3/parse.c \
					../../uuid/libuuid-1.0.3/unpack.c \
					../../uuid/libuuid-1.0.3/unparse.c \
					../../uuid/libuuid-1.0.3/uuid_time.c \
					../../uuid/libuuid-1.0.3/randutils.c \
				
 					
LOCAL_WHOLE_STATIC_LIBRARIES += libluajit
include $(BUILD_SHARED_LIBRARY)