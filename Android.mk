# Copyright 2009 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
# Need the include/version.h file or build step here
VERSION := "\"1.5.1 (github.com/RealDigitalMedia/mtd-utils/tree/android)\""

# mkfs.ubifs host command
#
ifneq ($(findstring x5.0,x$(PLATFORM_VERSION)), x5.0)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	mkfs.ubifs/mkfs.ubifs.c \
	mkfs.ubifs/crc16.c \
	mkfs.ubifs/lpt.c \
	mkfs.ubifs/compr.c \
	mkfs.ubifs/devtable.c \
	mkfs.ubifs/hashtable/hashtable.c \
	mkfs.ubifs/hashtable/hashtable_itr.c
# libubi
LOCAL_SRC_FILES += ubi-utils/libubi.c
# libmtd
LOCAL_SRC_FILES += \
	lib/libmtd.c \
	lib/libmtd_legacy.c \
	lib/libcrc32.c \
	lib/libfec.c
LOCAL_CC := /usr/bin/gcc
LOCAL_CXX := /usr/bin/g++
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_CFLAGS += -m64 -D_LARGEFILE64_SOURCE
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_C_INCLUDES += /usr/include/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/mkfs.ubifs/hashtable
LOCAL_LDFLAGS += -L/usr/lib/x86_64-linux-gnu
LOCAL_LDLIBS := -lz -llzo2 -lm -luuid -m64
LOCAL_STATIC_LIBRARIES := libselinux
LOCAL_MODULE := mkfs.ubifs
LOCAL_MODULE_STEM := $(LOCAL_MODULE)_
LOCAL_INSTALLED_MODULE_STEM := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
include $(BUILD_HOST_EXECUTABLE)

endif

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

# libubi (static)
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/libubi.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ubi-utils/include
LOCAL_MODULE := libubi
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)


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


####
#### Static versions
####

# libmtd (static)
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
include $(BUILD_STATIC_LIBRARY)

# flash_erase
include $(CLEAR_VARS)
LOCAL_SRC_FILES := flash_erase.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_STATIC_LIBRARIES := libmtd libc
LOCAL_MODULE := flash_erase.static
LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

# nandwrite
include $(CLEAR_VARS)
LOCAL_SRC_FILES := nandwrite.c
LOCAL_CFLAGS = -O2 -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DVERSION=$(VERSION)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_STATIC_LIBRARIES := libmtd libc
LOCAL_MODULE := nandwrite.static
LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

