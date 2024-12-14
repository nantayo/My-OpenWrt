#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Add packages
git clone https://github.com/nantayo/My-Pkg package/my-pkg
git clone https://github.com/sbwml/luci-app-mosdns -b v5 --depth=1 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata --depth=1 package/v2ray-geodata

# Update packages
cp -fr package/mosdns/luci-app-mosdns package/my-pkg/luci-app-passwall feeds/luci/applications/
cp -fr package/mosdns/mosdns package/mosdns/v2dat package/my-pkg/haproxy package/v2ray-geodata feeds/packages/net/
cp -fr package/my-pkg/luci-app-mosdns feeds/luci/applications/

# Clean packages
rm -rf package/my-pkg package/mosdns