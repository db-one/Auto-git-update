#!/bin/bash

svn co  https://github.com/coolsnowwolf/lede/trunk openwrt
svn co  https://github.com/coolsnowwolf/packages/trunk openwrt-packages
svn co  https://github.com/coolsnowwolf/luci/trunk openwrt-luci
svn co  https://github.com/fw876/helloworld/trunk helloworld

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