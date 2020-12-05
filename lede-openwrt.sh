#!/bin/bash

svn co https://github.com/coolsnowwolf/lede/trunk ./

# 生成新的feeds.conf.default
rm -rf feeds.conf.default
cat >> feeds.conf.default <<EOF
src-git packages https://github.com/db-one/dbone-update;lede-openwrt-packages
src-git luci https://github.com/db-one/dbone-update;lede-openwrt-luci
src-git routing https://git.openwrt.org/feed/routing.git
src-git telephony https://git.openwrt.org/feed/telephony.git
src-git freifunk https://github.com/freifunk/openwrt-packages.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git management https://github.com/openwrt-management/packages.git
#src-git oldpackages http://git.openwrt.org/packages.git
#src-link custom /usr/src/openwrt/custom-feed
#src-git helloworld https://github.com/fw876/helloworld
EOF

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