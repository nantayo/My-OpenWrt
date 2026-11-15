#!/bin/bash

# Clone packages
git clone https://github.com/sbwml/luci-app-mosdns --single-branch --depth=1 clone/mosdns
git clone https://github.com/sbwml/v2ray-geodata --depth=1 clone/v2ray-geodata

# Adjust packages
rm -rf feeds/packages/net/mosdns feeds/packages/net/v2ray-geodata
cp -rf clone/mosdns/luci-app-mosdns feeds/luci/applications/
cp -rf clone/mosdns/mosdns clone/mosdns/geo2txt clone/v2ray-geodata feeds/packages/net/

# Clean packages
rm -rf clone
