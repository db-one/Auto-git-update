 #!/bin/bash

# 获取所有更新目录并显示
ls | grep -v 'Update.md' | grep -v 'UpdateList.md' | grep -v 'main.sh' | grep -v '18.06.sh' | grep -v '23.05.sh' | grep -v 'package.sh' | grep -v 'wxtg.sh' | grep -v 'Lean-openwrt.sh' | grep -v 'immortalwrt-openwrt.sh' >> UpdateList.md

# 对比Update.md文件里没有的内容，并生成变量
echo 缺失包列表
FOLDERS=`grep -Fxvf UpdateList.md Update.md`
FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 判断变量值，如果有效发送通知
# 企业微信通知
# 仅失败时候发送通知
if [ -n "$FOLDERS" ]; then  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫源码同步失败，分支：$package$matrix_target，失败列表：$FOLDERSX......"; fi
# 无论成功还是失败皆发送通知
# if [ -n "$FOLDERS" ]; then  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫源码同步失败，分支：$package$matrix_target，失败列表：$FOLDERSX......"; else curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🎉源码同步成功，分支：$package$matrix_target......"; fi
# TG通知
if [ -n "$FOLDERS" ]; then  curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🚫源码同步失败,分支:$package$matrix_target，失败列表:$FOLDERSX......"; else curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🎉源码同步成功,分支:$package$matrix_target......"; fi   >/dev/null 2>&1 && echo "ok..."


# 搜索补丁 .rej 文件并将结果存储在变量中
REJ_FILES=$(find . -type f -name "*.rej" | xargs | sed 's/ /,/g')
# 判断变量值，如果有效发送通知
if [ -n "$REJ_FILES" ]; then
    # 推送信息
    MESSAGE="发现被拒绝的补丁文件，需要手动处理：$REJ_FILES"
    curl -s "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=$MESSAGE"
    curl -s "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=$MESSAGE"
fi

# 删除对比更新目录列表
rm -rf Update.md
rm -rf UpdateList.md


# 删除拉取插件后残留的.git和.svn,再随带删除各种README说明
find . -name 'LICENSE' | xargs -i rm -rf {}
find ./*/ -name '*.git' -o -name '*.github' | xargs -i rm -rf {}
find . -name '*.svn' -o -name '*.ipk' | xargs -i rm -rf {}
find . -name '.gitattributes' -o -name '.gitignore' | xargs -i rm -rf {}
#find . -name '*.md' | xargs -i rm -rf {}


