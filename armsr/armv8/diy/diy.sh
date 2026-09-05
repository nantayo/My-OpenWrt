#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/automount.patch
patch -p1 -f < $(dirname "$0")/luci.patch

# Clone packages
git clone https://github.com/nantayo/My-Pkg clone/my-pkg
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/QiuSimons/luci-app-daed clone/daed
git clone https://github.com/sbwml/luci-app-mosdns --single-branch --depth=1 clone/mosdns
git clone https://github.com/sbwml/packages_lang_golang --single-branch --depth=1 clone/golang
git clone https://github.com/sbwml/v2ray-geodata --depth=1 clone/v2ray-geodata

# Adjust packages
rm -rf feeds/luci/applications/luci-app-daed feeds/packages/lang/golang feeds/packages/net/mosdns feeds/packages/net/v2ray-geodata
cp -rf clone/amlogic/luci-app-amlogic clone/daed/luci-app-daed clone/mosdns/luci-app-mosdns feeds/luci/applications/
cp -rf clone/golang feeds/packages/lang/
cp -rf clone/mosdns/mosdns clone/mosdns/geo2txt clone/v2ray-geodata feeds/packages/net/
cp -rf clone/my-pkg/feeds/. feeds/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone