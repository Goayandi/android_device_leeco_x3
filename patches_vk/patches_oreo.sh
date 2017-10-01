#!/bin/bash
cd ../../../..
cd system/core
git apply -v ../../device/LeEco/X3/patches_vk/system/core/system_core.patch
git apply -v ../../device/LeEco/X3/patches_vk/system/core/0001-mtk-O-reintroduce-atomic-symbols-in-libcutils-for-ol.patch
cd ../..
cd bionic
git apply -v ../device/LeEco/X3/patches_vk/bionic/bionic.patch
cd ..
cd frameworks/av
git apply -v ../../device/LeEco/X3/patches_vk/frameworks/av/frameworks_av.patch
git apply -v ../../device/LeEco/X3/patches_vk/frameworks/av/frameworks_av_2.patch
cd ../..
cd build/soong
git apply -v ../../device/LeEco/X3/patches_vk/build/soong/0001-build-soong-add-BOARD_USES_MTK_HARDWARE.patch
cd ../..
cd build/make
git apply -v ../../device/LeEco/X3/patches_vk/build/make/0001-build-core-add-BOARD_USES_MTK_HARDWARE.patch
cd ../..
