#!/bin/bash

git clone https://github.com/Lienol/openwrt.git openwrt -b 19.07
git clone https://github.com/Lienol/openwrt-packages.git openwrt-packages -b 19.07
git clone https://github.com/Lienol/openwrt-luci.git openwrt-luci -b 18.06

exit 0
