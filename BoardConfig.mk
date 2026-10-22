#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/renoir

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Inherit MiuiCamera Makefile
-include vendor/xiaomi/miuicamera-renoir/BoardConfig.mk

# Board
TARGET_BOOTLOADER_BOARD_NAME := renoir

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/hidl/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG += vendor/renoir_QGKI.config

# Kernel modules
BOOT_KERNEL_MODULES := \
    adsp_loader_dlkm.ko \
    apr_dlkm.ko \
    focaltech_touch.ko \
    goodix_core.ko \
    hwid.ko \
    mmhardware_sysfs_dlkm.ko \
    msm_drm.ko \
    q6_notifier_dlkm.ko \
    q6_pdr_dlkm.ko \
    qti_battery_charger_main.ko \
    snd_event_dlkm.ko \
    xiaomi_touch.ko
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Match the product's explicit Dolby selection. false keeps stock audio.
TARGET_ENABLE_XIAOMI_DOLBY ?= true
ifeq ($(TARGET_ENABLE_XIAOMI_DOLBY),true)
BOARD_VENDOR_SEPOLICY_DIRS += vendor/xiaomi/dolby-renoir/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += vendor/xiaomi/dolby-renoir/sepolicy/public
# Declares vendor.dolby.hardware.dms@2.0::IDms/default, which the DMS manifest
# fragment adds. Without it checkvintf rejects the device manifest.
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/xiaomi/dolby-renoir/configs/vintf/dolby_framework_compatibility_matrix.xml
endif

# Include proprietary files
include vendor/xiaomi/renoir/BoardConfigVendor.mk
