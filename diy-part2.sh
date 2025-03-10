#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.50.69/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.50.69/g' package/base-files/luci2/bin/config_generate
sed -i 's/192.168.1.1/192.168.50.69/g' package/base-files/Makefile
sed -i 's/192.168.1.1/192.168.50.69/g' package/base-files/image-config.in
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' ./feeds/luci/collections/luci/Makefile
# rm -rf ./feeds/luci/applications/luci-app-qbittorrent
rm -rf ./feeds/luci/applications/luci-app-wechatpush
rm -rf ./feeds/luci/applications/luci-app-mosdns
# rm -rf ./package/diy-ziyong/adguardhome
rm -rf ./package/diy-ziyong/smartdns
rm -rf ./feeds/packages/net/adguardhome
rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/packages/net/mosdns
# rm -rf ./package/mosdns/mosdns
rm -rf ./feeds/luci/themes/luci-theme-argon
# rm -rf ./package/openwrt-passwall/v2ray-geodata
rm -rf ./package/ssr/v2ray-geodata
# rm -rf ./feeds/packages/net/https-dns-proxy
# svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
