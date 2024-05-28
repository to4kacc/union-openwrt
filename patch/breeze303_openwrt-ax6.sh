#!/bin/bash
cd openwrt
sudo chmod +x $GITHUB_WORKSPACE/patch/ax6/*.sh
sudo chmod -Rf 755 $GITHUB_WORKSPACE/patch/ax6/*

sudo mv $GITHUB_WORKSPACE/patch/ax6/01_leds target/linux/qualcommax/ipq807x/base-files/etc/board.d/01_leds
sudo mv $GITHUB_WORKSPACE/patch/ax6/02_network target/linux/qualcommax/ipq807x/base-files/etc/board.d/02_network
sudo mv $GITHUB_WORKSPACE/patch/ax6/11-ath10k-caldata target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath10k-caldata
sudo mv $GITHUB_WORKSPACE/patch/ax6/11-ath11k-caldata target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata
sudo mv $GITHUB_WORKSPACE/patch/ax6/bootcount target/linux/qualcommax/ipq807x/base-files/etc/init.d/bootcount
sudo mv $GITHUB_WORKSPACE/patch/ax6/platform.sh target/linux/qualcommax/ipq807x/base-files/lib/upgrade/platform.sh
sudo mv $GITHUB_WORKSPACE/patch/breeze303/breeze303_ipq807x.mk target/linux/qualcommax/image/ipq807x.mk 
sudo mv $GITHUB_WORKSPACE/patch/ax6/qualcommax_ipq807x package/boot/uboot-envtools/files/qualcommax_ipq807x
sudo mv $GITHUB_WORKSPACE/patch/ax6/ipq8071-ax6-stock.dts target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax6-stock.dts
sudo mv $GITHUB_WORKSPACE/patch/ax6/ipq8071-ax3600-stock.dts target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax3600-stock.dts

#luci补丁
git config --global user.name "OpenWrt Builder"
git config --global user.email "buster-openwrt@ovvo.uk"
cp $GITHUB_WORKSPACE/patch/breeze303/0001-show-soc-status-on-luci.patch feeds/luci
cd feeds/luci
git am 0001-show-soc-status-on-luci.patch