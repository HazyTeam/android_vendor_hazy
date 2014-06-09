# GApps and TwixKat vendor dependencies
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/apk/Superuser.apk:system/app/Superuser.apk:google \
    vendor/twixkat/prebuilt/bin/su:system/xbin/daemonsu:google \
    vendor/twixkat/prebuilt/bin/su:system/xbin/su:google \
    vendor/twixkat/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon:google \
    vendor/twixkat/prebuilt/etc/install-recovery.sh:system/etc/install-recovery.sh:google \
    vendor/twixkat/proprietary/system/app/HazyApp.apk:system/app/HazyApp.apk:google \
    vendor/twixkat/proprietary/system/app/HazyLight.apk:system/app/HazyLight.apk:google \
    vendor/twixkat/proprietary/system/app/HazyWalls.apk:system/app/HazyWalls.apk:google \
    vendor/twixkat/proprietary/system/app/HazyVoice.apk:system/app/HazyVoice.apk:google \

PRODUCT_PACKAGES += \
	Superuser \
    HazyApp \
    HazyLight \
    HazyWalls \
    HazyVoice \

$(call inherit-product, vendor/twixkat/configs/aosp_fixes.mk)