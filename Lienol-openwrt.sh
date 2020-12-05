#!/bin/bash

svn co https://github.com/Lienol/openwrt/trunk ./
git clone https://github.com/Lienol/openwrt-packages feeds/packages -b 19.07
git clone https://github.com/Lienol/openwrt-luci feeds/luci -b 18.06
git clone https://github.com/xiaorouji/openwrt-passwall feeds/passwall

# 生成新的feeds.conf.default
rm -rf feeds.conf.default
cat >> feeds.conf.default <<EOF
#src-git packages https://github.com/Lienol/openwrt-packages.git;19.07
src-git routing https://git.openwrt.org/feed/routing.git;openwrt-19.07
src-git telephony https://git.openwrt.org/feed/telephony.git;openwrt-19.07
#src-git luci https://github.com/Lienol/openwrt-luci.git;17.01
src-git lienol https://github.com/Lienol/openwrt-package.git;main
#src-git diy1 https://github.com/xiaorouji/openwrt-passwall.git;main
src-git freifunk https://github.com/freifunk/openwrt-packages.git;openwrt-19.07
EOF

# 检测同步是否完成
folder1=package
folder2=feeds/packages
folder3=feeds/luci
folder4=feeds/passwall

if [ -d "$folder1" ];then  echo "$folder1 成功";  else  echo "$folder1 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder2" ];then  echo "$folder2 成功";  else  echo "$folder2 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder3" ];then  echo "$folder3 成功";  else  echo "$folder3 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder4" ];then  echo "$folder4 成功";  else  echo "$folder4 失败"; fi | tee -a FOLDERS.md

echo 缺失包列表
FOLDERS=`grep 失败 FOLDERS.md`
FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 判断变量值，如果有效发送微信通知
if [ -n "$a" ]; then  curl https://sc.ftqq.com/${{ secrets.SCKEY }}.send?text=插件同步失败-Lienol-$FOLDERSX; fi
rm -rf FOLDERS.md


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
