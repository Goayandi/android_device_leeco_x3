#!/bin/bash
cd ../../../..
cd system/core
git apply -v ../../device/LeEco/X3/patches_vk/system/core/system_core.patch
cd ../..
cd bionic
git apply -v ../device/LeEco/X3/patches_vk/bionic/bionic.patch
cd ..
cd frameworks/av
git apply -v ../../device/LeEco/X3/patches_vk/frameworks/av/frameworks_av.patch
git apply -v ../../device/LeEco/X3/patches_vk/frameworks/av/frameworks_av_2.patch
cd ../..
