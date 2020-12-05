#!/bin/bash

git clone https://github.com/Lienol/openwrt/ ./

# 生成新的feeds.conf.default
rm -rf feeds.conf.default
cat >> feeds.conf.default <<EOF
src-git packages https://github.com/db-one/dbone-update.git;Lienol-openwrt-packages
src-git routing https://git.openwrt.org/feed/routing.git;openwrt-19.07
src-git telephony https://git.openwrt.org/feed/telephony.git;openwrt-19.07
src-git luci https://github.com/db-one/dbone-update.git;Lienol-openwrt-luci
src-git lienol https://github.com/Lienol/openwrt-package.git;main
#src-git diy1 https://github.com/xiaorouji/openwrt-passwall.git;main
src-git freifunk https://github.com/freifunk/openwrt-packages.git;openwrt-19.07
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
