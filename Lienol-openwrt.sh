#!/bin/bash

svn co https://github.com/Lienol/openwrt/trunk openwrt
svn co https://github.com/Lienol/openwrt-packages/trunk openwrt-packages
svn co https://github.com/Lienol/openwrt-luci/trunk openwrt-luci
svn co https://github.com/xiaorouji/openwrt-passwall/trunk passwall

rm -rf .svn
rm -rf ./*/.git
rm -rf ./*/.svn
rm -rf ./*/*/.svn
rm -rf ./*/*/.git
rm -rf ./*/LICENSE
rm -rf ./*/readme.txt
rm -f .gitattributes .gitignore
# rm -rf ./*/README.md
exit 0
