PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# default sounds
PRODUCT_PROPERTY_OVERRIDES := \
    ro.config.alarm_alert=Argon.ogg \
    ro.config.ringtone=Orion.ogg \
    ro.config.notification_sound=pixiedust.ogg

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Allow override of system DUN settings
# 2 = not set, 0 = DUN not required, 1 = DUN required
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/hazy/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/hazy/prebuilt/common/bin/50-hazy.sh:system/addon.d/50-hazy.sh \
    vendor/hazy/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/hazy/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# Init file
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/etc/init.local.rc:root/init.hazy.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Hazy apps
PRODUCT_COPY_FILES += \
    vendor/hazy/proprietary/system/app/HazyCenter.apk:system/app/HazyCenter/HazyCenter.apk \
    vendor/hazy/proprietary/system/app/HazyWalls.apk:system/app/HazyWalls/HazyWalls.apk \
    vendor/hazy/proprietary/system/app/HManager.apk:system/app/HManager/HManager.apk

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/hazy/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/hazy/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/hazy/prebuilt/common/bin/sysinit:system/bin/sysinit

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    PhaseBeam

ifeq ($(FLOUNDER_NO_DSP),)
# DSPManager
PRODUCT_PACKAGES += \
else
PRODUCT_PACKAGES += \
   DSPManager \
   libcyanogen-dsp \
   audio_effects.conf
endif

# Extra Optional packages
PRODUCT_PACKAGES += \
    Apollo \
    LatinIME \
    BluetoothExt \
    CalendarWidget

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/hazy/overlay/common

# Add hazy bootanimation based on device resolution
ifneq ($(filter hazy_titan hazy_i9300 hazy_i9100 hazy_mako hazy_maguro hazy_p3100 hazy_manta hazy_d802 full_toroplus full_grouper full_tilapia,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/hazy/prebuilt/common/media/1280x720.zip:system/media/bootanimation.zip
endif
ifneq ($(filter hazy_find7 hazy_thea hazy_tomato hazy_n7100 hazy_armani hazy_shamu hazy_hammerhead hazy_bacon hazy_falcon hazy_m8,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/hazy/prebuilt/common/media/1920x1080.zip:system/media/bootanimation.zip
endif
 ifneq ($(filter hazy_deb hazy_flo,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/hazy/prebuilt/common/media/1920x1200.zip:system/media/bootanimation.zip
 endif
# ifeq (hazy_manta,$(TARGET_PRODUCT))
#    PRODUCT_COPY_FILES += \
#        vendor/hazy/prebuilt/common/media/2560x1600.zip:system/media/bootanimation.zip
# endif

# HFM Files
PRODUCT_COPY_FILES += \
        vendor/hazy/prebuilt/etc/hosts.alt:system/etc/hosts.alt \
        vendor/hazy/prebuilt/etc/hosts.og:system/etc/hosts.og

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/hazy/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Versioning System
ANDROID_VERSION = 5.1.1
HAZY_VERSION = 4.1
ifndef HAZY_BUILD_TYPE
    HAZY_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
endif

# Set all versions
HAZY_VERSION := HAZY_$(HAZY_BUILD)_$(ANDROID_VERSION)_$(shell date -u +%Y%m%d-%H%M).$(HAZY_VERSION)-$(HAZY_BUILD_TYPE)
HAZY_MOD_VERSION := HAZY_$(HAZY_BUILD)_$(ANDROID_VERSION)_$(shell date -u +%Y%m%d-%H%M).$(HAZY_VERSION)-$(HAZY_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.hazy.version=$(HAZY_VERSION) \
    ro.mod.version=$(HAZY_BUILD_TYPE)-4.1