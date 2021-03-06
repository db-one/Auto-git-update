#!/bin/bash

# 主题
git clone https://github.com/garypang13/luci-theme-edge
git clone https://github.com/jerrykuku/luci-theme-argon

# 插件

sed -i 's@e5effd@f8fbfe@g' luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
sed -i 's#223, 56, 18, 0.04#223, 56, 18, 0.02#g' luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调

# 生成完整目录清单
cat >> Update.md <<EOF
luci-theme-edge
luci-theme-argon
EOF

# 获取所有更新目录并显示
ls | grep -v 'Update.md' | grep -v 'UpdateList.md' | grep -v '18.06.sh' >> UpdateList.md

# 对比Update.md文件里没有的内容，并生成变量
echo 缺失包列表
FOLDERS=`grep -Fxvf UpdateList.md Update.md`
FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 判断变量值，如果有效发送微信通知
if [ -n "$FOLDERS" ]; then  curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🎉 源码同步失败-19.07-$FOLDERSX...... 😋"; else curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🎉 源码同步成功-19.07...... 😋"; fi
# 删除对比更新目录列表
rm -rf Update.md
rm -rf UpdateList.md

cat >> README.md <<EOF
# [个人专用软件包]内部插件包可能不全，仅添加了自己需要的

#
#### 分支[18.06]的为lede源码专用，分支[19.07]的为lienol源码专用
#

##### 添加以下插件
#

###### luci-theme-edge    #主题-edge
###### luci-theme-argon    #新的argon主题
#
#
EOF

# 拉取共用包
../package.sh


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
