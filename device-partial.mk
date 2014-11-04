# Hazy vendor dependencies
PRODUCT_COPY_FILES += \
    vendor/hazy/prebuilt/apk/Superuser.apk:system/app/Superuser.apk:google \
    vendor/hazy/prebuilt/bin/su:system/xbin/daemonsu:google \
    vendor/hazy/prebuilt/bin/su:system/xbin/su:google \
    vendor/hazy/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon:google \
    vendor/hazy/prebuilt/etc/install-recovery.sh:system/etc/install-recovery.sh:google \
    vendor/hazy/proprietary/system/app/HazyCenter.apk:system/app/HazyCenter.apk:google \
    vendor/hazy/proprietary/system/app/HazyLight.apk:system/app/HazyLight.apk:google \
    vendor/hazy/proprietary/system/app/HazyWalls.apk:system/app/HazyWalls.apk:google \
    vendor/hazy/proprietary/system/app/HazyVoice.apk:system/app/HazyVoice.apk:google \

PRODUCT_PACKAGES += \
	Superuser \
    HazyCenter \
    HazyLight \
    HazyWalls \
    HazyVoice \

$(call inherit-product, vendor/hazy/configs/aosp_fixes.mk)