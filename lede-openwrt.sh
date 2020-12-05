#!/bin/bash

svn co https://github.com/coolsnowwolf/lede/trunk ./
git clone  https://github.com/coolsnowwolf/packages feeds/packages
git clone  https://github.com/coolsnowwolf/luci feeds/luci
git clone  https://github.com/fw876/helloworld package/helloworld

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