#!/bin/bash

svn co https://github.com/coolsnowwolf/lede/trunk ./
git clone  https://github.com/coolsnowwolf/packages feeds/packages
git clone  https://github.com/coolsnowwolf/luci feeds/luci
git clone  https://github.com/fw876/helloworld feeds/helloworld

# 生成新的feeds.conf.default
rm -rf feeds.conf.default
cat >> feeds.conf.default <<EOF
#src-git packages https://github.com/coolsnowwolf/packages
#src-git luci https://github.com/coolsnowwolf/luci
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

# 检测同步是否完成
folder1=package
folder2=feeds/packages
folder3=feeds/luci
folder4=feeds/helloworld

if [ -d "$folder1" ];then  echo "$folder1 成功";  else  echo "$folder1 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder2" ];then  echo "$folder2 成功";  else  echo "$folder2 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder3" ];then  echo "$folder3 成功";  else  echo "$folder3 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder4" ];then  echo "$folder4 成功";  else  echo "$folder4 失败"; fi | tee -a FOLDERS.md

echo 缺失包列表
FOLDERS=`grep 失败 FOLDERS.md`
FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 判断变量值，如果有效发送微信通知
if [ -n "$a" ]; then  curl https://sc.ftqq.com/${{ secrets.SCKEY }}.send?text=插件同步失败-lean-$FOLDERSX; fi
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