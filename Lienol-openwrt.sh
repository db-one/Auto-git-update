#!/bin/bash

git clone https://github.com/Lienol/openwrt.git ./openwrt -b 19.07
git clone https://github.com/Lienol/openwrt-packages.git ./openwrt-packages -b 19.07
git clone https://github.com/Lienol/openwrt-luci.git ./openwrt-luci -b 19.07

rm -rf ./.github
rm -rf ./*/.git
rm -rf ./*/.svn
rm -rf ./*/README.md
rm -rf ./*/LICENSE
rm -rf .svn
rm -rf ./*/readme.txt
rm -f .gitattributes .gitignore
exit 0
