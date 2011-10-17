LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := vpx

LOCAL_SRC_FILES := libvpx.a

LOCAL_EXPORT_C_INCLUDES := \
        $(TOP)/external/libvpx \
        $(TOP)/external/libvpx/vpx_codec \
        $(TOP)/external/libvpx/vpx_ports


include $(PREBUILT_STATIC_LIBRARY)
