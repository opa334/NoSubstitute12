include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:12.1.2:12.0
export ARCHS = arm64 arm64e

TWEAK_NAME = NoSubstitute12
NoSubstitute12_FILES = Tweak.xm
NoSubstitute12_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += nosubstitute12prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
