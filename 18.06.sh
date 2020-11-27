#!/bin/bash

git clone https://github.com/vernesong/OpenClash.git
mv -f OpenClash/luci-app-openclash ./luci-app-openclash
rm -rf OpenClash

rm -rf ./*/.git
rm -rf ./*/.svn
rm -rf ./*/README.md
rm -rf ./*/LICENSE
rm -rf .svn
rm -rf ./*/readme.txt
rm -f .gitattributes .gitignore
exit 0
