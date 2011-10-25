LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := vpx

LOCAL_SRC_FILES := libvpx.a

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libvpx 


include $(PREBUILT_STATIC_LIBRARY)
