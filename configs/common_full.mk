# Inherit additional stuff
$(call inherit-product, vendor/hazy/configs/common.mk)

# Optional packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    PhaseBeam

