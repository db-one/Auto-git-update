#!/bin/bash

git clone  https://github.com/coolsnowwolf/lede
git clone  https://github.com/coolsnowwolf/packages
git clone  https://github.com/coolsnowwolf/luci
git clone  https://github.com/fw876/helloworld


# 检测同步是否完成
folder1=lede
folder2=packages
folder3=luci
folder4=helloworld

if [ -d "$folder1" ];then  echo "$folder1 成功";  else  echo "$folder1 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder2" ];then  echo "$folder2 成功";  else  echo "$folder2 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder3" ];then  echo "$folder3 成功";  else  echo "$folder3 失败"; fi | tee -a FOLDERS.md
if [ -d "$folder4" ];then  echo "$folder4 成功";  else  echo "$folder4 失败"; fi | tee -a FOLDERS.md

echo 缺失包列表
FOLDERS=`grep 失败 FOLDERS.md`
FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 判断变量值，如果有效发送通知
#企业微信通知
if [ -n "$FOLDERS" ]; then  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫源码同步失败，分支：$matrix_target，失败列表：$FOLDERSX......"; fi
# if [ -n "$FOLDERS" ]; then  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫源码同步失败，分支：$matrix_target，失败列表：$FOLDERSX......"; else curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🎉源码同步成功，分支：$matrix_target......"; fi
#TG通知
if [ -n "$FOLDERS" ]; then  curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🚫源码同步失败,分支:$matrix_target，失败列表:$FOLDERSX......"; else curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🎉源码同步成功,分支:$matrix_target......"; fi   >/dev/null 2>&1 && echo "ok..."
rm -rf FOLDERS.md


cat >> README.md <<EOF
# [Lean和lienol的源码定时备份]


[Lean](https://github.com/coolsnowwolf/lede)
[ Lienol](https://github.com/Lienol/openwrt )
[ xiaorouji package](https://github.com/xiaorouji/openwrt-passwall)




## 感谢各位大神的源码，openwrt有各位大神而精彩，感谢！感谢！

EOF


# 删除拉取插件后残留的.git和.svn,再随带删除各种README说明
find . -name 'LICENSE' | xargs -i rm -rf {}
find ./*/ -name '*.git' -o -name '*.github' | xargs -i rm -rf {}
find . -name '*.svn' -o -name '*.ipk' | xargs -i rm -rf {}
find . -name '.gitattributes' -o -name '.gitignore' | xargs -i rm -rf {}
#find . -name '*.md' | xargs -i rm -rf {}

exit 0