PRODUCT_BRAND ?= hazy

# Add hazy bootanimation based on device resolution
ifneq ($(filter hazy_titan hazy_i9300 hazy_i9100 hazy_mako hazy_maguro hazy_p3100 hazy_manta hazy_d802 full_toroplus full_grouper full_tilapia,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/hazy/prebuilt/bootanimation/1280x720.zip:system/media/bootanimation.zip
endif
ifneq ($(filter hazy_find7 hazy_thea hazy_tomato hazy_n7100 hazy_armani hazy_shamu hazy_hammerhead hazy_bacon hazy_falcon hazy_m8,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/hazy/prebuilt/bootanimation/1920x1080.zip:system/media/bootanimation.zip
endif
 ifneq ($(filter hazy_deb hazy_flo,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/hazy/prebuilt/bootanimation/1920x1200.zip:system/media/bootanimation.zip
 endif
# ifeq (hazy_manta,$(TARGET_PRODUCT))
#    PRODUCT_COPY_FILES += \
#        vendor/hazy/prebuilt/bootanimation/2560x1600.zip:system/media/bootanimation.zip
# endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=1

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Extra packages
PRODUCT_PACKAGES += \
    BluetoothExt

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/hazy/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/hazy/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/hazy/prebuilt/bin/blacklist:system/addon.d/blacklist

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/hazy/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with hazy extras
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/init.local.rc:root/init.hazy.rc

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# World APN list
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/spn-conf.xml:system/etc/spn-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Additional packages
-include vendor/hazy/configs/packages.mk

# Add Hazy packages
PRODUCT_COPY_FILES += \
    vendor/hazy/proprietary/system/app/HazyCenter.apk:system/app/HazyCenter/HazyCenter.apk \
    vendor/hazy/proprietary/system/app/HazyWalls.apk:system/app/HazyWalls/HazyWalls.apk \
    vendor/hazy/proprietary/system/app/HManager.apk:system/app/HManager/HManager.apk \
    vendor/hazy/proprietary/system/app/Superuser.apk:system/app/SuperSU/SuperSU.apk \
    vendor/hazy/proprietary/system/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \
    vendor/hazy/proprietary/system/etc/install-recovery.sh:system/etc/install-recovery.sh \
    vendor/hazy/proprietary/system/etc/install-recovery.sh:system/bin/install-recovery.sh \
    vendor/hazy/proprietary/system/bin/supolicy:system/xbin/supolicy \
    vendor/hazy/proprietary/system/bin/su:system/xbin/su \
    vendor/hazy/proprietary/system/bin/su:system/xbin/sugote \
    vendor/hazy/proprietary/system/bin/su:system/xbin/deamonsu \
    vendor/hazy/proprietary/system/bin/sh:system/xbin/sugote-mksh \
    vendor/hazy/proprietary/system/lib/libsupol.so:system/lib/libsupol.so \
    vendor/hazy/proprietary/system/media:system/media

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# This device supports CM enhanced NFC
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/permissions/com.cyanogenmod.nfc.enhanced.xml:system/etc/permissions/com.cyanogenmod.nfc.enhanced.xml

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/etc/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Versioning
-include vendor/hazy/configs/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/hazy/overlay/common

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
ro.config.ringtone=Sedna.ogg

# Default notification
PRODUCT_PROPERTY_OVERRIDES += \
ro.config.notification_sound=Salacia.ogg
