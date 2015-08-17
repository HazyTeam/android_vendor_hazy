# Inherit common Hazy stuff
$(call inherit-product, vendor/hazy/configs/common.mk)

# Optional CM packages
PRODUCT_PACKAGES += \
Galaxy4 \
HoloSpiralWallpaper \
LiveWallpapers \
LiveWallpapersPicker \
MagicSmokeWallpapers \
NoiseField \
PhaseBeam \
VisualizationWallpapers \
PhotoTable \
SoundRecorder \
PhotoPhase
PRODUCT_PACKAGES += \
VideoEditor \
libvideoeditor_jni \
libvideoeditor_core \
libvideoeditor_osal \
libvideoeditor_videofilters \
libvideoeditorplayer

# Extra tools in CM
PRODUCT_PACKAGES += \
vim \
zip \
unrar
