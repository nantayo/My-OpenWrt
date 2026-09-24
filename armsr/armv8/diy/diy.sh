#!/bin/bash

# Clone packages
git clone https://github.com/nantayo/My-Pkg clone/my-pkg
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/sbwml/luci-app-mosdns --single-branch --depth=1 clone/mosdns
git clone https://github.com/sbwml/v2ray-geodata --depth=1 clone/v2ray-geodata

# Adjust packages
rm -rf feeds/packages/net/mosdns feeds/packages/net/v2ray-geodata
cp -rf clone/amlogic/luci-app-amlogic clone/mosdns/luci-app-mosdns feeds/luci/applications/
cp -rf clone/mosdns/mosdns clone/mosdns/geo2txt clone/v2ray-geodata feeds/packages/net/
cp -rf clone/my-pkg/feeds/. feeds/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile
sed -i 's/GO_ARM64:=v8\.0$/GO_ARM64:=v8.0,crypto/' feeds/packages/lang/golang/golang-values.mk

# Clean packages
rm -rf clone