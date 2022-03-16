#!/bin/bash

git clone  https://github.com/coolsnowwolf/lede
git clone  https://github.com/coolsnowwolf/packages
git clone  https://github.com/coolsnowwolf/luci
git clone  https://github.com/fw876/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall passwall
git clone https://github.com/xiaorouji/openwrt-passwall passwall/luci-app-passwall -b luci

# 生成完整目录清单
cat >> Update.md <<EOF
lede
packages
luci
helloworld
passwall
EOF

# 获取所有更新目录并显示
ls | grep -v 'Update.md' | grep -v 'UpdateList.md' | grep -v 'main.sh' | grep -v '18.06.sh' | grep -v '19.07.sh' | grep -v 'package.sh' | grep -v 'Lean-openwrt.sh' | grep -v 'Lienol-openwrt.sh' >> UpdateList.md

# 对比Update.md文件里没有的内容，并生成变量
echo 缺失包列表
FOLDERS=`grep -Fxvf UpdateList.md Update.md`
FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 判断变量值，如果有效发送通知
#企业微信通知
if [ -n "$FOLDERS" ]; then  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫源码同步失败，分支：$matrix_target，失败列表：$FOLDERSX......"; fi
# if [ -n "$FOLDERS" ]; then  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫源码同步失败，分支：$matrix_target，失败列表：$FOLDERSX......"; else curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🎉源码同步成功，分支：$matrix_target......"; fi
#TG通知
if [ -n "$FOLDERS" ]; then  curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🚫源码同步失败,分支:$matrix_target，失败列表:$FOLDERSX......"; else curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🎉源码同步成功,分支:$matrix_target......"; fi   >/dev/null 2>&1 && echo "ok..."

# 删除对比更新目录列表
rm -rf Update.md
rm -rf UpdateList.md

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