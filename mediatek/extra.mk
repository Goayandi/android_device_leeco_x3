#Let me define some modifications
MTK_TARGET_PROJECT := X3
MTK_PLATFORM := MT6795
MTK_BASE_PROJECT := $(MTK_TARGET_PROJECT)
MTK_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_BASE_PROJECT))
MTK_TARGET_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_TARGET_PROJECT))

# Use the 6795 common part
include device/mediatek/mt6795/BoardConfig.mk

#Project_configuration , This file may contain all configurations which we want.
include device/LeEco/X3/ProjectConfig.mk




