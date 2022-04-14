#!/bin/bash

echo "Cloning Trees For Specific Tress"
telegram -N -M "Cloning Tress For ${device}"

if [ "${device}" == "mojito" ]; then
    git clone https://github.com/ancient-devices/device_xiaomi_mojito device/xiaomi/mojito
    git clone https://github.com/ancient-devices/device_xiaomi_sm6150-common device/xiaomi/sm6150-common
    git clone --depth=1 https://gitlab.com/xiaomi-sdm678/android_vendor_xiaomi_mojito.git -b 12 vendor/xiaomi/mojito
    git clone --depth=1 https://gitlab.com/xiaomi-sdm678/android_vendor_xiaomi_sm6150-common.git -b 12 vendor/xiaomi/sm6150-common
    git clone --depth=1 https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf -b 12.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
    git clone --depth=1 https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi
    git clone https://github.com/BulletFlux/vendor_PixelMod vendor/PixelMod
    git clone https://github.com/Neternels/android_kernel_xiaomi_mojito -b staging-test kernel/xiaomi/mojito
    git clone https://gitlab.com/ArhamDharewa/vendor_xiaomi_miuicamera.git vendor/xiaomi/miuicamera
    
elif [ "${device}" == "mido" ]; then
    rm -rf hardware/qcom-caf/msm8996/audio
    rm -rf hardware/qcom-caf/msm8996/display
    rm -rf hardware/qcom-caf/msm8996/media
    git clone https://github.com/PixelExperience/hardware_qcom-caf_msm8996_audio hardware/qcom-caf/msm8996/audio
    git clone https://github.com/PixelExperience/hardware_qcom-caf_msm8996_display  hardware/qcom-caf/msm8996/display
    git clone https://github.com/PixelExperience/hardware_qcom-caf_msm8996_media hardware/qcom-caf/msm8996/media
    git clone https://github.com/BulletFlux/dt_mido device/xiaomi/mido 
    git clone https://github.com/Alone0316/kernel_mido -b oc kernel/xiaomi/mido
    git clone https://github.com/Alone0316/vendor_xiaomi_mido vendor/xiaomi
    git clone https://github.com/BulletFlux/vendor_PixelMod vendor/PixelMod
    git clone https://github.com/PixelExperience/external_ant-wireless_antradio-library external/ant-wireless/antradio-library
    git clone --depth=1 https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf -b 12.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
    git clone --depth=1 https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi 
else
    rm "${outdir}"/*$(date +%Y)*.zip*
fi

echo "Cloning completed for ${device} successfully"
telegram -N -M "Sync completed successfully"
source "${my_dir}/build.sh"