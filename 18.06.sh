#!/bin/bash

# 2333
svn co https://github.com/xiaorouji/openwrt-passwall/trunk passwall
mv -f passwall/luci-app-passwall ./luci-app-passwall
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy passwall/https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/haproxy passwall/haproxy
svn co https://github.com/fw876/helloworld/trunk luci-app-ssr-plus
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash

# 主题
svn co https://github.com/garypang13/luci-theme-edge/branches/18.06 luci-theme-edge
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial
svn co https://github.com/Lienol/openwrt-luci/trunk/themes/luci-theme-material
svn co https://github.com/jerrykuku/luci-theme-argon/branches/18.06 luci-theme-argon
svn co https://github.com/jerrykuku/luci-app-argon-config/trunk luci-app-argon-config
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentomcat/trunk luci-theme-opentomcat
svn co https://github.com/sirpdboy/luci-theme-opentopd/trunk luci-theme-opentopd
svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk luci-theme-infinityfreedom
svn co https://github.com/rosywrt/luci-theme-rosy/trunk luci-theme-rosy

# 插件
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-koolddns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-gost
svn co https://github.com/kenzok8/openwrt-packages/trunk/gost
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliddns
svn co https://github.com/firker/diy-ziyong/trunk/cpulimit-ng
svn co https://github.com/firker/diy-ziyong/trunk/cpulimit
svn co https://github.com/firker/diy-ziyong/trunk/luci-app-cpulimit
svn co https://github.com/firker/diy-ziyong/trunk/luci-app-wrtbwmon-zh
svn co https://github.com/firker/diy-ziyong/trunk/wrtbwmon
svn co https://github.com/siropboy/mypackages/trunk/luci-app-advanced
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-timewol
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-weburl
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-webrestriction
svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolproxyR

svn co https://github.com/tty228/luci-app-serverchan/trunk luci-app-serverchan
svn co https://github.com/pymumu/luci-app-smartdns/trunk luci-app-smartdns
svn co https://github.com/esirplayground/luci-app-poweroff/trunk luci-app-poweroff
svn co https://github.com/destan19/OpenAppFilter/trunk luci-app-oaf
svn co https://github.com/garypang13/luci-app-eqos/trunk luci-app-eqos
svn co https://github.com/jerrykuku/luci-app-jd-dailybonus/trunk luci-app-jd-dailybonus
svn co https://github.com/jerrykuku/node-request/trunk node-request


sed -i 's/"Argon 主题设置"/"Argon设置"/g' luci-app-argon-config/po/zh-cn/argon-config.po

rm -rf .svn
rm -rf ./*/.svn
rm -rf ./*/.git
rm -rf ./*/LICENSE
rm -rf ./*/readme.txt
rm -f .gitattributes .gitignore
# rm -rf ./*/README.md
exit 0
