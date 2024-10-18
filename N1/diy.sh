#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.10.202/g' package/base-files/files/bin/config_generate

# Remove packages
rm -rf feeds/luci/applications/luci-app-passwall feeds/packages/net/mosdns feeds/packages/net/v2ray-geodata

# Add packages
git clone https://github.com/nantayo/My-Pkg package/my-pkg
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic