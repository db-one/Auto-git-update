#!/bin/bash

# 2333
# 新建目录
mkdir passwall
# 插件包
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages passwall/packages
# luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall
mv -f openwrt-passwall/luci-app-passwall ./passwall/luci-app-passwall
rm -rf openwrt-passwall
# luci-app-passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2
mv -f openwrt-passwall2/luci-app-passwall2 ./passwall/luci-app-passwall2
rm -rf openwrt-passwall2
# helloworld
git clone https://github.com/fw876/helloworld
# luci-app-openclash
git clone -b master --depth 1 https://github.com/vernesong/OpenClash && mv -f OpenClash/luci-app-openclash ./ && rm -rf OpenClash


# 恢复缺失passwall
if [ ! -d "passwall/luci-app-passwall" ];then
  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫Passwall缺失,从历史记录恢复......"
  curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🚫Passwall缺失,从历史记录恢复......"
  git clone https://github.com/db-one/dbone-packages -b 18.06
  cd dbone-packages && git reset --hard 4b2927affb0e178e166b0280634be23453a1cc9d
  cd ../ && mkdir passwall
  mv -f dbone-packages/passwall/luci-app-passwall ./passwall/luci-app-passwall
  rm -rf dbone-packages
fi
# 恢复缺失passwall2
if [ ! -d "passwall/luci-app-passwall2" ];then
  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫Passwall2缺失,从历史记录恢复......"
  curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🚫Passwall2缺失,从历史记录恢复......"
  git clone https://github.com/db-one/dbone-packages -b 18.06
  cd dbone-packages && git reset --hard 4b2927affb0e178e166b0280634be23453a1cc9d
  cd ../ && mkdir passwall
  mv -f dbone-packages/passwall/luci-app-passwall2 ./passwall/luci-app-passwall2
  rm -rf dbone-packages
fi
# 恢复缺失luci-app-openclash
if [ ! -d "luci-app-openclash" ];then
  curl "http://$WECHAT_WORK_URL/push?token=$WECHAT_WORK_TOKEN&message=🚫OpenClash缺失,从历史记录恢复......"
  curl "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=🚫OpenClash缺失,从历史记录恢复......"
  git clone https://github.com/db-one/dbone-packages -b 18.06
  cd dbone-packages && git reset --hard 4b2927affb0e178e166b0280634be23453a1cc9d
  cd ../ && mkdir passwall
  mv -f dbone-packages/luci-app-openclash ./luci-app-openclash
  rm -rf dbone-packages
fi

# 主题
# 
git clone --depth 1 https://github.com/kenzok8/openwrt-packages
mv -f openwrt-packages/luci-theme-atmaterial_new ./luci-theme-atmaterial_new
rm -rf openwrt-packages

git clone --depth 1 https://github.com/Lienol/openwrt-luci
mv -f openwrt-luci/themes/luci-theme-material ./luci-theme-material
rm -rf openwrt-luci

# ####
git clone https://github.com/jerrykuku/luci-app-argon-config
git clone https://github.com/rosywrt/luci-theme-rosy
git clone https://github.com/thinktip/luci-theme-neobird
git clone https://github.com/db-one/luci-theme-design
git clone https://github.com/db-one/luci-app-design-config


# 插件
git clone --depth 1 https://github.com/kenzok8/openwrt-packages
mv -f openwrt-packages/luci-app-eqos ./luci-app-eqos
mv -f openwrt-packages/luci-app-istorex ./luci-app-istorex
mv -f openwrt-packages/luci-app-quickstart ./luci-app-quickstart
mv -f openwrt-packages/quickstart ./quickstart
mv -f openwrt-packages/luci-app-store ./luci-app-store
mv -f openwrt-packages/luci-lib-taskd ./luci-lib-taskd
mv -f openwrt-packages/luci-lib-xterm ./luci-lib-xterm
mv -f openwrt-packages/taskd ./taskd
rm -rf openwrt-packages

git clone --depth 1 https://github.com/firker/diy-ziyong
mv -f diy-ziyong/luci-app-wrtbwmon-zh ./luci-app-wrtbwmon
mv -f diy-ziyong/wrtbwmon ./wrtbwmon
rm -rf diy-ziyong

git clone --depth 1 https://github.com/281677160/openwrt-package
mv -f openwrt-package/luci-app-adguardhome ./luci-app-adguardhome
mv -f openwrt-package/luci-app-control-timewol ./luci-app-control-timewol
mv -f openwrt-package/luci-app-control-weburl ./luci-app-control-weburl
mv -f openwrt-package/luci-app-control-webrestriction ./luci-app-control-webrestriction
rm -rf openwrt-package

git clone --depth 1 https://github.com/linkease/nas-packages-luci
mv -f nas-packages-luci/luci/luci-app-ddnsto ./luci-app-ddnsto
rm -rf nas-packages-luci

git clone --depth 1 https://github.com/linkease/ddnsto-openwrt
mv -f ddnsto-openwrt/ddnsto ./ddnsto
rm -rf ddnsto-openwrt


# ####
git clone https://github.com/tty228/luci-app-serverchan
git clone https://github.com/zzsj0928/luci-app-pushbot
git clone https://github.com/pymumu/luci-app-smartdns -b lede
git clone https://github.com/db-one/luci-app-poweroff
git clone https://github.com/xylz0928/luci-app-shutdown
git clone https://github.com/destan19/OpenAppFilter luci-app-oaf
git clone https://github.com/iamaluckyguy/luci-app-smartinfo
git clone https://github.com/sirpdboy/luci-app-wizard
git clone https://github.com/sirpdboy/luci-app-autotimeset

sed -i -e 's/stats refresh 30s/stats refresh 3s/g' passwall/luci-app-passwall/root/usr/share/passwall/app.sh #haproxy控制台刷新时间设置为3秒
sed -i 's@.*stats admin if TRUE*@#&@g' passwall/luci-app-passwall/root/usr/share/passwall/app.sh #去除haproxy控制台管理

sed -i 's/"Argon 主题设置"/"Argon设置"/g' luci-app-argon-config/po/zh-cn/argon-config.po
sed -i '1226,1229d' luci-theme-atmaterial_new/htdocs/luci-static/atmaterial/css/style.css #Atmaterial主题输入框调大
sed -i '1226,1229d' luci-theme-atmaterial_new/htdocs/luci-static/atmaterial_red/css/style.css #Atmaterial主题输入框调大
sed -i '1241,1244d' luci-theme-atmaterial_new/htdocs/luci-static/atmaterial_Brown/css/style.css #Atmaterial主题输入框调大

# Neobird主题微调
sed -i -e 's/shadowsocksr/openclash/g' -e 's/admin">/flashops">/g' luci-theme-neobird/luasrc/view/themes/neobird/header.htm #Neobird主题链接地址
Neobird="luci-theme-neobird/htdocs/luci-static/neobird/css/style.css"
sed -i '/padding: 13px 10px 5px 3px/a\    text-align: right;' $Neobird #Neobird主题子标题居右
sed -i '/margin-bottom: .25rem/a\        text-align: left;' $Neobird #Neobird主题移动版子标题居左
num=`sed -n -e '/padding: 13px 10px 5px 3px/=' $Neobird` && num=`expr $num - 2` && sed -i "${num}s/35/20/g" $Neobird #Neobird主题数据框左移
num=`sed -n -e '/.main > .main-left > .nav > li a {/=' $Neobird` && num=`expr $num + 5` && sed -i "${num}d" $Neobird #Neobird主题左侧分类取消加粗
num=`sed -n -e '/background-color: var(--badgebgColor);/=' $Neobird` && num=`expr $num - 15` && sed -i "${num}s/center/right/g" $Neobird #Neobird主题保存应用按钮靠右
patch -p0 luci-theme-neobird/htdocs/luci-static/neobird/js/script.js ../patch.file/luci-theme-neobird.script.js.patch #Neobird主题菜单自动缩回

# OpenClash调整
openclash="luci-app-openclash/root/etc/uci-defaults/luci-openclash"
patch -p0 luci-app-openclash/luasrc/model/cbi/openclash/settings.lua ../patch.file/luci-app-openclash.settings.lua.patch #OpenClash删除机场登录
# sed -i '/---- dlercloud/,/o.value = font_red..bold_on..translate("Account not logged in")..bold_off..font_off/{ /o.value = font_red..bold_on..translate("Account not logged in")..bold_off..font_off/!d; N; d; }' luci-app-openclash/luasrc/model/cbi/openclash/settings.lua #OpenClash删除机场登录
sed -i '/openclash.config.enable/{N;d;}' $openclash #OpenClash恢复更新系统开机自启动
sed -i '/exit/i\uci -q set openclash.config.dashboard_password=""' $openclash #禁用控制面板登录密钥
sed -i '/^#Set Authentication$/I,/^fi$/d' $openclash #关闭SOCKS5/HTTP认证信息


#sed -i 's#114.114.115.115#114.114.115.115,223.5.5.5,223.6.6.6,180.76.76.76,119.29.29.29,119.28.28.28,1.2.4.8,210.2.4.8#g' luci-app-sfe/root/etc/config/sfe #Turbo ACC (SFE) 默认DNS服务器
#sed -i 's#114.114.115.115#114.114.115.115,223.5.5.5,223.6.6.6,180.76.76.76,119.29.29.29,119.28.28.28,1.2.4.8,210.2.4.8#g' luci-app-sfe/luasrc/model/cbi/sfe.lua #Turbo ACC (SFE) 默认DNS服务器

#替换https-dns-proxy.config默认配置文件,解决用LEDE源码加入passwall编译固件后DNS转发127.0.0.1#5053和12.0.0.1#5054问题
#curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.config > https-dns-proxy/files/https-dns-proxy.config

# 生成完整目录清单
cat >> Update.md <<EOF
passwall
packages
luci-app-passwall
luci-app-passwall2
helloworld
luci-app-openclash
luci-theme-atmaterial_new
luci-theme-material
luci-app-argon-config
luci-theme-rosy
luci-theme-neobird
luci-theme-design
luci-app-design-config
luci-app-adguardhome
luci-app-eqos
luci-app-istorex
luci-app-quickstart
quickstart
luci-app-wrtbwmon
wrtbwmon
luci-app-control-timewol
luci-app-control-weburl
luci-app-control-webrestriction
luci-app-ddnsto
ddnsto
luci-app-serverchan
luci-app-pushbot
luci-app-smartdns
luci-app-poweroff
luci-app-shutdown
luci-app-wizard
luci-app-oaf
luci-app-smartinfo
luci-app-autotimeset
EOF

# 获取二级目录并显示
ls passwall | grep -E 'packages|luci-app-passwall*' >> UpdateList.md


cat >> README.md <<EOF
### 2333
###### helloworld
###### luci-app-passwall
###### luci-app-openclash
#
### 主题
###### luci-theme-atmaterial_new   #atmaterial-三合一主题
###### luci-theme-material   #material-主题
###### luci-app-argon-config    #argon主题设置（编译时候选上,在固件的‘系统’里面）
###### luci-theme-rosy    #主题-rosy
###### luci-theme-neobird    #主题-小清新 Neobird
###### luci-theme-design    #主题-design 基于Neobird修改
###### luci-app-design-config    #design 主题设置
#
###  插件
###### luci-app-adguardhome    #adguardhome
###### luci-app-eqos    #内网控速 内网IP限速工具
###### luci-app-istorex    #istorex商店
###### luci-app-quickstart    #istore quickstart首页
###### luci-app-wrtbwmon    #流量统计，替代luci-app-wrtbwmon，在固件状态栏显示
###### luci-app-control-timewol    #定时唤醒
###### luci-app-control-weburl    #网址过滤
###### luci-app-control-webrestriction    #访问限制
###### luci-app-ddnsto    #小宝开发的DDNS.to内网穿透
###### luci-app-serverchan    #微信推送
###### luci-app-pushbot    #基于原版微信推送修改，支持更多协议
###### luci-app-smartdns    #smartdns DNS加速
###### luci-app-poweroff    #关机（增加关机功能）
###### luci-app-shutdown    #关机重启（增加关机重启功能）
###### luci-app-wizard    #设置向导
###### luci-app-oaf （OpenAppFilter）    #应用过滤 ，该模块只工作在路由模式， 旁路模式、桥模式不生效，还有和Turbo ACC 网络加速有冲突
###### luci-app-smartinfo    #磁盘监控 ，该工具帮助您通过S.M.A.R.T技术来监控您硬盘的健康状况
###### luci-app-autotimeset    #定时设置，替代luci-app-autoreboot
#


#
#
## 感谢各位大神的源码，openwrt有各位大神而精彩，感谢！感谢！

#


EOF

# 设置变量
package='Package_' && export package
# 调用通知
/bin/bash ../wxtg.sh



exit 0

