# Hazy vendor dependencies
PRODUCT_COPY_FILES += \
    vendor/hazy/proprietary/system/app/Superuser.apk:system/app/SuperSU/SuperSU.apk:google \
    vendor/hazy/proprietary/system/bin/su:system/xbin/daemonsu:google \
    vendor/hazy/proprietary/system/bin/su:system/xbin/su:google \
    vendor/hazy/proprietary/system/bin/su:system/xbin/sugate:google \
    vendor/hazy/proprietary/system/bin/su:system/xbin/su:google \
    vendor/hazy/proprietary/system/bin/supolicy:system/xbin/supolicy:google \
    vendor/hazy/proprietary/system/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon:google \
    vendor/hazy/proprietary/system/etc/install-recovery.sh:system/etc/install-recovery.sh:google \
    vendor/hazy/proprietary/system/etc/install-recovery.sh:system/bin/install-recovery.sh:google \
    vendor/hazy/proprietary/system/lib/libsupol.so:system/lib/libsupol.so:google \
    vendor/hazy/proprietary/system/app/HazyCenter.apk:system/app/HazyCenter/HazyCenter.apk:google \
#    vendor/hazy/proprietary/system/app/HazyLight.apk:system/app/HazyLight.apk:google \
    vendor/hazy/proprietary/system/app/HazyWalls.apk:system/app/HazyWalls/HazyWalls.apk:google \
#    vendor/hazy/proprietary/system/app/HazyVoice.apk:system/app/HazyVoice.apk:google \

PRODUCT_PACKAGES += \
    SuperSU \
    HazyCenter \
#    HazyLight \
    HazyWalls \
#    HazyVoice \

$(call inherit-product, vendor/hazy/configs/aosp_fixes.mk)
