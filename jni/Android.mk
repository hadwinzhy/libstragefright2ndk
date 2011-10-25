#my variable start by Hadwin

TOP:=$(call my-dir)

TOP_INCLUDE:= $(TOP)/include

LOCAL_PATH:= $(call my-dir)/frameworks/base/media/libstagefright

include $(CLEAR_VARS)
#used in ./build/core/main.mk:286
BUILD_WITHOUT_PV := true

####
#1. external/tremolo used in  OggExtractor.cpp:36
#
#2. out/target/product/crespo/obj/include/ used in StagefrightMediaScanner.cpp:27
##
SYS_INCLUDE := \
	$(TOP_INCLUDE)/frameworks/base/include/					\
	$(TOP_INCLUDE)/frameworks/base/include/media/stagefright/openmax	\
	$(TOP_INCLUDE)/frameworks/base/include/media/stagefright/foundation	\
	$(TOP_INCLUDE)/system/core/include/					\
	$(TOP_INCLUDE)/hardware/libhardware/include/				\
	$(TOP_INCLUDE)/external/libvpx						\
	$(TOP_INCLUDE)/external/openssl/include					\
	$(TOP_INCLUDE)/

3RD_PARTY_INCLUDE := \
	$(TOP)/3rd_party/tremolo


APP_INCLUDE := \
	$(LOCAL_PATH)/include				\
	$(TOP)/frameworks/base/media/libstagefright/codecs/common/include \

TARGET_C_INCLUDES += 	\
	$(SYS_INCLUDE)	\
	$(APP_INCLUDE)	\
	$(3RD_PARTY_INCLUDE)

TARGET_CFLAGS += -Wno-multichar  -DHAVE_PTHREADS

#my variable end by Hadwin


include $(TOP)/frameworks/base/media/libstagefright/codecs/common/Config.mk

LOCAL_SRC_FILES:=                         \
        AMRExtractor.cpp                  \
        AMRWriter.cpp                     \
        DataSource.cpp                    \
        ESDS.cpp                          \
        FileSource.cpp                    \
        HTTPStream.cpp                    \
        JPEGSource.cpp                    \
        MP3Extractor.cpp                  \
        MPEG2TSWriter.cpp                 \
        MPEG4Extractor.cpp                \
        MPEG4Writer.cpp                   \
        MediaBuffer.cpp                   \
        MediaBufferGroup.cpp              \
        MediaDefs.cpp                     \
        MediaExtractor.cpp                \
        MediaSource.cpp                   \
        MetaData.cpp                      \
        NuCachedSource2.cpp               \
        NuHTTPDataSource.cpp              \
        OggExtractor.cpp                  \
        SampleIterator.cpp                \
        SampleTable.cpp                   \
        ShoutcastSource.cpp               \
        ThreadedSource.cpp                \
        ThrottledSource.cpp               \
        TimeSource.cpp                    \
        TimedEventQueue.cpp               \
        Utils.cpp                         \
        WAVExtractor.cpp                  \
        avc_utils.cpp                     \
        string.cpp			  \
#	CameraSource.cpp                  \	
#	StagefrightMediaScanner.cpp       \
#	AudioPlayer.cpp                   \
#       AudioSource.cpp                   \
#	AwesomePlayer.cpp                 \
#	OMXClient.cpp                     \
#       OMXCodec.cpp                      \
#	StagefrightMetadataRetriever.cpp  \


LOCAL_C_INCLUDES:= \
        $(TOP_INCLUDE)/frameworks/base/include/media/stagefright/openmax \
        $(TOP_INCLUDE)/external/tremolo \
        $(TOP)/frameworks/base/media/libstagefright/rtsp

LOCAL_SHARED_LIBRARIES := \
        libbinder         \
        libmedia          \
        libutils          \
        libcutils         \
        libui             \
        libsonivox        \
        libvorbisidec     \
        libsurfaceflinger_client \
        libcamera_client

LOCAL_LDFLAGS +=-llog 	\
	-L$(TOP)/lib 	\
	-lutils		\
	-lcutils	\
#	-lmedia		\
#	-lbinder	\
#	-lvorbisidec    \	

LOCAL_STATIC_LIBRARIES := \
        libstagefright_aacdec \
        libstagefright_aacenc \
        libstagefright_amrnbdec \
        libstagefright_amrnbenc \
        libstagefright_amrwbdec \
        libstagefright_amrwbenc \
        libstagefright_avcdec \
        libstagefright_avcenc \
        libstagefright_m4vh263dec \
        libstagefright_m4vh263enc \
        libstagefright_mp3dec \
        libstagefright_vorbisdec \
        libstagefright_matroska \
        libstagefright_vpxdec \
        libvpx \
        libstagefright_mpeg2ts \
        libstagefright_httplive \
        libstagefright_rtsp \
        libstagefright_id3 \
        libstagefright_g711dec \

LOCAL_SHARED_LIBRARIES += \
        libstagefright_amrnb_common \
        libstagefright_enc_common \
        libstagefright_avc_common \
        libstagefright_foundation \
        libstagefright_color_conversion \
	libvorbisidec

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
        LOCAL_LDLIBS += -lpthread -ldl
        LOCAL_SHARED_LIBRARIES += libdvm
        LOCAL_CPPFLAGS += -DANDROID_SIMULATOR
endif

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
        LOCAL_LDLIBS += -lpthread
endif


LOCAL_MODULE:= libstagefright

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))

#which for libvorbisidec.so
include $(TOP)/3rd_party/tremolo/Android.mk
