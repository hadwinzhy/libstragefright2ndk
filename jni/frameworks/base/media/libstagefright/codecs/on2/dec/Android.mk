LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles)

include $(CLEAR_VARS)


LOCAL_SRC_FILES := \
        ../VPXDecoder.cpp

LOCAL_MODULE := libstagefright_vpxdec

LOCAL_C_INCLUDES := \
        $(TOP)/frameworks/base/media/libstagefright/include \
        $(TOP)/frameworks/base/include/media/stagefright/openmax \
        $(TOP)/external/libvpx \
        $(TOP)/external/libvpx/vpx_codec \
        $(TOP)/external/libvpx/vpx_ports

LOCAL_STATIC_LIBRARIES := vpx

include $(BUILD_STATIC_LIBRARY)
