#!/bin/bash

svn co  https://github.com/coolsnowwolf/lede/trunk openwrt
svn co  https://github.com/coolsnowwolf/packages/trunk openwrt-packages
svn co  https://github.com/coolsnowwolf/luci/trunk openwrt-luci
svn co  https://github.com/fw876/helloworld/trunk helloworld


# rm -rf ./.github
# rm -rf ./*/.git
# rm -rf ./*/.svn
# rm -rf ./*/README.md
# rm -rf ./*/LICENSE
# rm -rf .svn
# rm -rf ./*/readme.txt
# rm -f .gitattributes .gitignore
exit 0
