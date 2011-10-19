LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    AAtomizer.cpp               \
    ABitReader.cpp              \
    ABuffer.cpp                 \
    AHandler.cpp                \
    ALooper.cpp                 \
    ALooperRoster.cpp           \
    AMessage.cpp                \
    AString.cpp                 \
    base64.cpp                  \
    hexdump.cpp

LOCAL_C_INCLUDES:= \
    $(TOP_INCLUDE)/frameworks/base/include/media/stagefright/foundation

LOCAL_SHARED_LIBRARIES := \
        libbinder         \
        libmedia          \
        libutils          \
        libcutils         \
        libui             \
        libsonivox        \
        libvorbisidec     \
        libcamera_client

LOCAL_CFLAGS += -Wno-multichar

LOCAL_LDFLAGS +=-L$(TOP)/lib 	\
	-llog			\
	-lutils 		\
#	-lbinder		\
#	-lcutils 		\
#	-lsonivox		\
#	-lvorbisidec		\
#	-lsurfaceflinger_client \
#	-lcamera_client


LOCAL_MODULE:= libstagefright_foundation

LOCAL_PRELINK_MODULE:= false

include $(BUILD_SHARED_LIBRARY)
