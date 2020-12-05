#!/bin/bash

svn co https://github.com/Lienol/openwrt/trunk ./
git clone https://github.com/Lienol/openwrt-packages feeds/packages -b 19.07
git clone https://github.com/Lienol/openwrt-luci feeds/luci -b 18.06
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall

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
