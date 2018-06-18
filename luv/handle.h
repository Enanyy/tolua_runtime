//
//  handle.h
//  tolua
//
//  Created by HMC on 2018/6/18.
//  Copyright © 2018年 topameng. All rights reserved.
//

#ifndef LUV_HANDLE_H
#define LUV_HANDLE_H

#include "luv.h"

static void* luv_checkudata(lua_State* L, int ud, const char* tname);
static void* luv_newuserdata(lua_State* L, size_t sz);
static uv_handle_t* luv_check_handle(lua_State* L, int index);
static int luv_handle_tostring(lua_State* L);
static int luv_is_active(lua_State* L);

#endif /* handle_h */
