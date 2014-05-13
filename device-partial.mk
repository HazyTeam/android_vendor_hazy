# GApps and TwixKat vendor dependencies
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/apk/Superuser.apk:system/app/Superuser.apk:google \
    vendor/twixkat/prebuilt/bin/su:system/xbin/daemonsu:google \
    vendor/twixkat/prebuilt/bin/su:system/xbin/su:google \
    vendor/twixkat/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon:google \
    vendor/twixkat/prebuilt/etc/install-recovery.sh:system/etc/install-recovery.sh:google \
    vendor/twixkat/proprietary/system/app/TwixApp.apk:system/app/TwixApp.apk:google \
    vendor/twixkat/proprietary/system/app/TwixLight.apk:system/app/TwixLight.apk:google \
    vendor/twixkat/proprietary/system/app/TwixPaper.apk:system/app/TwixPaper.apk:google \
    vendor/twixkat/proprietary/system/app/TwixVoice.apk:system/app/TwixVoice.apk:google \
    vendor/twixkat/proprietary/system/etc/g.prop:system/etc/g.prop:google \

PRODUCT_PACKAGES += \
	Superuser \
    TwixApp \
    TwixLight \
    TwixPaper \
    TwixVoice \

$(call inherit-product, vendor/twixkat/configs/aosp_fixes.mk)