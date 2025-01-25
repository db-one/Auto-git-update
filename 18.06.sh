#!/bin/bash

# 主题
git clone https://github.com/garypang13/luci-theme-edge -b 18.06
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06

# 插件
git clone --depth 1 https://github.com/coolsnowwolf/luci
mv -f luci/applications/luci-app-v2ray-server ./luci-app-v2ray-server
mv -f luci/applications/luci-app-vlmcsd ./luci-app-vlmcsd
mv -f luci/applications/luci-app-filetransfer ./luci-app-filetransfer
rm -rf luci

git clone --depth 1 https://github.com/coolsnowwolf/packages
mv -f packages/net/vlmcsd ./vlmcsd
rm -rf packages

# 一些依赖包
git clone https://github.com/db-one/myautocore


sed -i 's@e5effd@f8fbfe@g' luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
sed -i 's#223, 56, 18, 0.04#223, 56, 18, 0.02#g' luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调

# 生成完整目录清单
cat >> Update.md <<EOF
luci-theme-edge
luci-theme-argon
luci-app-v2ray-server
luci-app-vlmcsd
vlmcsd
myautocore
luci-app-filetransfer
EOF


cat >> README.md <<EOF
# [个人专用软件包]内部插件包可能不全，仅添加了自己需要的

#
#### 分支[18.06]的为lede源码18.06.luci专用，分支[23.05]的为lede源码23.05.luci专用
#

##### 添加以下插件
#

###### luci-theme-edge    #主题-edge
###### luci-theme-argon    #新的argon主题
#
###### luci-app-v2ray-server   #V2ray服务端
###### luci-app-vlmcsd          #KMS激活服务器
###### luci-app-filetransfer   #文件传输
#
###  依赖
myautocore    #加强版的预览信息autocore，可显示温度，网卡MAC，时间等详细信息，需删除原版autocore

EOF

# 调用通知
/bin/bash ../wxtg.sh
# 拉取共用包
/bin/bash ../package.sh


exit 0
