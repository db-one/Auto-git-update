#!/bin/bash

svn co https://github.com/Lienol/openwrt/trunk openwrt
svn co https://github.com/Lienol/openwrt-packages/trunk openwrt-packages
svn co https://github.com/Lienol/openwrt-luci/trunk openwrt-luci
svn co https://github.com/xiaorouji/openwrt-package/trunk openwrt-package

exit 0
