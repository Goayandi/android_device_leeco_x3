$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Language
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

include device/vanzo/$(MTK_TARGET_PROJECT)/ProjectConfig.mk

# PRODUCT_COPY_FILES overwrite
# Please add flavor project's PRODUCT_COPY_FILES here.
# It will overwrite base project's PRODUCT_COPY_FILES.

# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += device/LeEco/X3/overlay

ifeq ($(TARGET_BUILD_VARIANT),user)
WITH_DEXPREOPT := true
DONT_DEXPREOPT_PREBUILTS := true
endif

#######################################################

# PRODUCT_COPY_FILES += device/LeEco/X3/egl.cfg:system/lib/egl/egl.cfg
# PRODUCT_COPY_FILES += device/LeEco/X3/ueventd.mt6795.rc:root/ueventd.mt6795.rc

PRODUCT_COPY_FILES += device/LeEco/X3/factory_init.project.rc:root/factory_init.project.rc
PRODUCT_COPY_FILES += device/LeEco/X3/init.project.rc:root/init.project.rc
PRODUCT_COPY_FILES += device/LeEco/X3/meta_init.project.rc:root/meta_init.project.rc

ifeq ($(MTK_SMARTBOOK_SUPPORT),yes)
PRODUCT_COPY_FILES += device/LeEco/X3/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl \
                      device/LeEco/X3/sbk-kpd.kcm:system/usr/keychars/sbk-kpd.kcm
endif

# thermal policy
ifneq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_COPY_FILES += device/LeEco/X3/thermal.wfd.6795.conf:system/etc/.tp/thermal.conf
else
    PRODUCT_COPY_FILES += device/LeEco/X3/thermal.6795.conf:system/etc/.tp/thermal.conf
endif
PRODUCT_COPY_FILES += device/LeEco/X3/thermal.off.6795.conf:system/etc/.tp/thermal.off.conf
PRODUCT_COPY_FILES += device/LeEco/X3/thermal.wfd.6795.conf:system/etc/.tp/.thermal_policy_00
PRODUCT_COPY_FILES += device/LeEco/X3/thermal.pip.6795.conf:system/etc/.tp/.thermal_policy_01
PRODUCT_COPY_FILES += device/LeEco/X3/ht120.6795.mtc:system/etc/.tp/.ht120.mtc



# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/GeoCoding/geocoding.db:system/etc/geocoding.db

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk
# sensor related xml files for CTS
ifneq ($(strip $(CUSTOM_KERNEL_ACCELEROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_MAGNETOMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_ALSPS)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
else
  ifneq ($(strip $(CUSTOM_KERNEL_PS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  endif
  ifneq ($(strip $(CUSTOM_KERNEL_ALS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
  endif
endif

ifneq ($(strip $(CUSTOM_KERNEL_GYROSCOPE)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_BAROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml
endif

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
endif

# USB OTG
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += hardware/mediatek/gps/HAL/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
endif

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:system/lib/open_nfc_driver.ko

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += device/LeEco/X3/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# alps/mediatek/external/sip/
ifeq ($(MTK_SIP_SUPPORT),yes)
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
else
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
endif

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4

PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=256m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=512m

# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.version.release=$(strip $(MTK_BUILD_VERNO))
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT6795

# set Telephony property - SIM count
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0

ifeq ($(GEMINI),yes)
  ifeq ($(MTK_DT_SUPPORT),yes)
    PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsda
  else 
    PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds
  endif
else
  PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=ss
endif

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/vanzo6795_lwt_l1/factory/res/sound/testpattern1.wav:system/res/sound/testpattern1.wav
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/vanzo6795_lwt_l1/factory/res/sound/ringtone.wav:system/res/sound/ringtone.wav

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt6795/ACCDET.kl:system/usr/keylayout/ACCDET.kl
PRODUCT_COPY_FILES += device/LeEco/X3/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Microphone
PRODUCT_COPY_FILES += device/LeEco/X3/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += device/LeEco/X3/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += device/LeEco/X3/audio_policy.conf:system/etc/audio_policy.conf

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/vanzo6795_lwt_l1/factory/res/images/lcd_test_00.png:system/res/images/lcd_test_00.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/vanzo6795_lwt_l1/factory/res/images/lcd_test_01.png:system/res/images/lcd_test_01.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/vanzo6795_lwt_l1/factory/res/images/lcd_test_02.png:system/res/images/lcd_test_02.png

# USB
PRODUCT_COPY_FILES += device/LeEco/X3/init.mt6795.usb.rc:root/init.mt6795.usb.rc

# SmartPA parameters
ifeq ($(strip $(NXP_SMARTPA_SUPPORT)),yes)
PRODUCT_COPY_FILES += device/LeEco/X3/paparams/coldboot.patch:system/etc/smartpa_params/coldboot.patch
PRODUCT_COPY_FILES += device/LeEco/X3/paparams/devkit_Release.parms:system/etc/smartpa_params/devkit_Release.parms
PRODUCT_COPY_FILES += device/LeEco/X3/paparams/HQ_KS_13X18_DUMBO.eq:system/etc/smartpa_params/HQ_KS_13X18_DUMBO.eq
PRODUCT_COPY_FILES += device/LeEco/X3/paparams/HQ_KS_13X18_DUMBO.preset:system/etc/smartpa_params/HQ_KS_13X18_DUMBO.preset
PRODUCT_COPY_FILES += device/LeEco/X3/paparams/KS_13X18_DUMBO_tCoef.speaker:system/etc/smartpa_params/KS_13X18_DUMBO_tCoef.speaker
PRODUCT_COPY_FILES += device/LeEco/X3/paparams/TFA9887_N1D2_2_4_1.patch:system/etc/smartpa_params/TFA9887_N1D2_2_4_1.patch
PRODUCT_COPY_FILES += device/LeEco/X3/paparams/TFA9887_N1D2.config:system/etc/smartpa_params/TFA9887_N1D2.config
endif

# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += device/LeEco/X3/overlay
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif
ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
  ifeq (480,$(strip $(LCM_WIDTH)))
    ifeq (854,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
    endif
  endif
  ifeq (540,$(strip $(LCM_WIDTH)))
    ifeq (960,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
    endif
  endif
endif
ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
endif
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/navbar

# mt6795 specified
PRODUCT_PACKAGES += audio.primary.mt6795
PRODUCT_PACKAGES += audio_policy.mt6795
PRODUCT_PACKAGES += sensors.mt6795
PRODUCT_PACKAGES += camera.mt6795
PRODUCT_PACKAGES += gralloc.mt6795
PRODUCT_PACKAGES += hwcomposer.mt6795

ifeq ($(strip $(MTK_FAT_ON_NAND)),yes)
PRODUCT_COPY_FILES += device/mediatek/mt6795/init.fon.rc:root/init.fon.rc
PRODUCT_COPY_FILES += device/mediatek/mt6795/fstab.mt6795.fon:root/fstab.mt6795
endif


ifeq ($(strip $(MTK_EMMC_SUPPORT)), yes)
  ifeq ($(strip $(MTK_CIP_SUPPORT)), yes)
    PRODUCT_COPY_FILES += device/mediatek/mt6795/fstab.mt6795.wwop:root/fstab.mt6795
  else
    PRODUCT_COPY_FILES += device/mediatek/mt6795/fstab.mt6795:root/fstab.mt6795
  endif
else
  PRODUCT_COPY_FILES += device/mediatek/mt6795/fstab.mt6795.nand:root/fstab.mt6795
endif

MTK_ART_OPT_ENABLE := true

# inherit 6795 platform
$(call inherit-product, device/mediatek/mt6795/device.mk)



# Vanzo:wangfei on: Tue, 07 Apr 2015 10:27:21 +0800

$(call inherit-product-if-exists, vendor/LeEco/X3/device-vendor.mk)

# End of Vanzo: wangfei
