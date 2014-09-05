PRODUCT_BRAND ?= hazy

# Add TwixKat bootanimation based on device resolution
ifneq ($(filter hazy_i9300 hazy_mako hazy_maguro full_toro full_toroplus full_grouper full_tilapia,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/twixkat/prebuilt/bootanimation/1280x720.zip:system/media/bootanimation.zip
endif
ifneq ($(filter hazy_hammerhead hazy_bacon,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/twixkat/prebuilt/bootanimation/1920x1080.zip:system/media/bootanimation.zip
endif
 ifneq ($(filter hazy_deb hazy_flo,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/twixkat/prebuilt/bootanimation/1920x1200.zip:system/media/bootanimation.zip
 endif
# ifeq (hazy_manta,$(TARGET_PRODUCT))
#    PRODUCT_COPY_FILES += \
#        vendor/twixkat/prebuilt/bootanimation/2560x1600.zip:system/media/bootanimation.zip
# endif

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/twixkat/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/twixkat/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/twixkat/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with hazy extras
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/etc/init.local.rc:root/init.hazy.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/twixkat/configs/packages.mk

# Versioning
-include vendor/twixkat/configs/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/twixkat/overlay/common
