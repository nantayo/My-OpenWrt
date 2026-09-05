#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Clone packages
git clone https://github.com/Openwrt-Passwall/openwrt-passwall --depth=1 clone/passwall
git clone https://github.com/sbwml/luci-app-mosdns --single-branch --depth=1 clone/mosdns
git clone https://github.com/sbwml/packages_lang_golang --single-branch --depth=1 clone/golang
git clone https://github.com/sbwml/v2ray-geodata --depth=1 clone/v2ray-geodata

# Adjust packages
rm -rf feeds/luci/applications/luci-app-passwall feeds/packages/lang/golang feeds/packages/net/mosdns feeds/packages/net/v2ray-geodata
cp -rf clone/mosdns/luci-app-mosdns clone/passwall/luci-app-passwall feeds/luci/applications/
cp -rf clone/golang feeds/packages/lang/
cp -rf clone/mosdns/mosdns clone/mosdns/geo2txt clone/v2ray-geodata feeds/packages/net/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile
sed -i 's/+chinadns-ng \|+dns2socks \|+microsocks \|+resolveip //g' feeds/luci/applications/luci-app-passwall/Makefile

# Clean packages
rm -rf clone