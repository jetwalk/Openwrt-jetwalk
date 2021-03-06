#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt by jet '/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrt-jet'/g" ./package/base-files/files/bin/config_generate
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.config > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.config
# curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.init > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.init
# wget https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.config -O ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.config
# wget https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.init -O ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.init
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# Modify default IP
sed -i 's/192.168.1.1/192.168.50.69/g' package/base-files/files/bin/config_generate
# rm -rf ./package/lean/dnsforwarder
rm -rf ./package/lean/luci-theme-argon
# rm -rf ./package/lean/shadowsocksr-libev
rm -rf ./feeds/packages/net/https-dns-proxy
# rm -rf ./feeds/packages/net/smartdns
# rm -rf ./feeds/passwall/luci-app-passwall
# rm -rf ./feeds/helloworld/luci-app-ssr-plus
# rm -rf ./package/lean/v2ray
# rm -rf ./package/lean/v2ray-plugin
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray package/lean/xray
# svn co https://github.com/garypang13/openwrt-packages/trunk/shadowsocksr-libev package/lean/shadowsocksr-libev
# svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-passwall feeds/passwall/luci-app-passwall
# svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-ssr-plus feeds/helloworld/luci-app-ssr-plus
# svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns feeds/packages/net/smartdns
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
# svn co https://github.com/project-openwrt/openwrt/trunk/package/lean/dnsforwarder package/lean/dnsforwarder
