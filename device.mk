#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Inherit MiuiCamera Makefile
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera-renoir/device.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/audio_platform_info_shimaidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_shimaidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/sound_trigger_mixer_paths_shimaidp.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/sound_trigger_platform_info.xml

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint_shima.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayRenoir

PRODUCT_PACKAGES += \
    FrameworkOverlayRenoir \
    SettingsOverlayRenoir \
    SettingsProviderOverlayRenoir \
    SystemUIOverlayRenoir \
    WifiOverlayRenoir

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibrator
$(call soong_config_set,qti_vibrator,effect_lib,libqtivibratoreffect.xiaomi)
$(call soong_config_set_bool,qti_vibrator,use_effect_stream,true)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/renoir/renoir-vendor.mk)
