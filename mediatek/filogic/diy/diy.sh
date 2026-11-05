#!/bin/bash

# Clone packages
git clone https://github.com/daeuniverse/openwrt-packages --single-branch --depth=1 clone/daepkg
git clone https://github.com/nantayo/My-Pkg clone/my-pkg
git clone https://github.com/sbwml/luci-app-mosdns --single-branch --depth=1 clone/mosdns
git clone https://github.com/sbwml/v2ray-geodata --depth=1 clone/v2ray-geodata

# Adjust packages
rm -rf feeds/packages/net/mosdns feeds/packages/net/v2ray-geodata
cp -rf clone/mosdns/luci-app-mosdns feeds/luci/applications/
cp -rf clone/daepkg/vmlinux-btf-builtin clone/mosdns/geo2txt clone/mosdns/mosdns clone/v2ray-geodata feeds/packages/net/
bash clone/my-pkg/tools/dae-diy.sh || exit 1
cp -rf clone/my-pkg/feeds/. feeds/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone