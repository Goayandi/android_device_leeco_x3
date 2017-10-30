# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 1920

# Inherit device configuration
$(call inherit-product, device/LeEco/X3/full_X3.mk)

# Inherit some common cm stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit mtk configuration
include device/LeEco/X3/ProjectConfig.mk
#include vendor/mediatek/Android.mk

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X3
PRODUCT_NAME := lineage_X3
PRODUCT_BRAND := LeEco
PRODUCT_MODEL := LeEco Le 1s
PRODUCT_MANUFACTURER := LeEco

#Don't Ship SuperSU
WITH_SUPERSU := false

#Maintainer Name
PRODUCT_PROPERTY_OVERRIDES += ro.cm.maintainer="vishalk17"

# Release name
PRODUCT_RELEASE_NAME := X3

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Letv/Le1s_CN/X3:6.0/DBXCNOP5902302082S/1486532099:user/release-keys






