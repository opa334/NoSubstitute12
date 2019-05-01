include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NoSubstitute12Prefs
NoSubstitute12Prefs_FILES = NSPRootListController.m
NoSubstitute12Prefs_INSTALL_PATH = /Library/PreferenceBundles
NoSubstitute12Prefs_FRAMEWORKS = UIKit
NoSubstitute12Prefs_PRIVATE_FRAMEWORKS = Preferences
NoSubstitute12Prefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoSubstitute12Prefs.plist$(ECHO_END)
