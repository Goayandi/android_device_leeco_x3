# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/LeEco/X3/full_X3.mk)

# Device display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X3
PRODUCT_NAME := lineage_X3
PRODUCT_BRAND := LeEco
PRODUCT_MANUFACTURER := LeEco
PRODUCT_RELEASE_NAME := X3
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_MODEL := Le 1S

#Maintainer Name
PRODUCT_PROPERTY_OVERRIDES += ro.lineage.maintainer="vishalk17"

#Don't Ship SuperSU
WITH_SUPERSU := false

# SDcard
PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Letv/Le1s_CN/X3:6.0/DBXCNOP5902302082S/1486532099:user/release-keys 






