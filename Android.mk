# Copyright 2009 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
VERSION := "\"1.5.1 (github.com/RealDigitalMedia/mtd-utils/tree/android)\""

## Need the include/version.h file or build step here

# ubinize host command
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	ubi-utils/ubinize.c \
	ubi-utils/libubigen.c \
	ubi-utils/libiniparser.c \
	ubi-utils/dictionary.c \
	ubi-utils/libubi.c \
	ubi-utils/ubiutils-common.c \
	lib/libmtd.c \
	lib/libmtd_legacy.c \
	lib/libcrc32.c \
	lib/libfec.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_MODULE := ubinize
LOCAL_MODULE_TAGS := eng
include $(BUILD_HOST_EXECUTABLE)

# libubi (shared)
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/libubi.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_MODULE := libubi
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# libubigen (shared)
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/libubigen.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libmtd
LOCAL_MODULE := libubigen
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# libscan (shared)
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/libscan.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libmtd
LOCAL_MODULE := libscan
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# libmtd (shared)
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	lib/libmtd.c \
	lib/libmtd_legacy.c \
	lib/libcrc32.c \
	lib/libfec.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_MODULE := libmtd
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# ubinfo util
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	ubi-utils/ubinfo.c \
	ubi-utils/ubiutils-common.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libubi libmtd
LOCAL_MODULE := ubinfo
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

# ubiformat util
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	ubi-utils/ubiformat.c \
	ubi-utils/ubiutils-common.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libubigen libscan libubi libmtd
LOCAL_MODULE := ubiformat
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

# ubimkvol util
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	ubi-utils/ubimkvol.c \
	ubi-utils/ubiutils-common.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libubi libmtd
LOCAL_MODULE := ubimkvol
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

# ubiattach util
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	ubi-utils/ubiattach.c \
	ubi-utils/ubiutils-common.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libubi libmtd
LOCAL_MODULE := ubiattach
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

# ubidetach util
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	ubi-utils/ubidetach.c \
	ubi-utils/ubiutils-common.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libubi libmtd
LOCAL_MODULE := ubidetach
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

# ubiupdatevol util
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	ubi-utils/ubiupdatevol.c \
	ubi-utils/ubiutils-common.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_SHARED_LIBRARIES := libubi libmtd
LOCAL_MODULE := ubiupdatevol
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

# flash_erase
include $(CLEAR_VARS)
LOCAL_SRC_FILES := flash_erase.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES := libmtd
LOCAL_MODULE := flash_erase
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

# nandwrite
include $(CLEAR_VARS)
LOCAL_SRC_FILES := nandwrite.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES := libmtd
LOCAL_MODULE := nandwrite
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)
