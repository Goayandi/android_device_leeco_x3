ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
KERNEL_DEFCONFIG := x500-debug_defconfig
else
KERNEL_DEFCONFIG := x500_defconfig
endif
KERNEL_DIR := kernel/LeEco/X3
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

include $(TOP)/$(KERNEL_DIR)/Android.mk

# device.mk doesn't know about us, and we can't PRODUCT_COPY_FILES here.
# So cp will do.
.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel
