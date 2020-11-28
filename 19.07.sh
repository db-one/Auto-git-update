#!/bin/bash

# 2333
git clone https://github.com/fw876/helloworld luci-app-ssr-plus
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt ssr-plus/pdnsd-alt
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks ssr-plus/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks ssr-plus/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs ssr-plus/simple-obfs
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 ssr-plus/redsocks2
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/kcptun ssr-plus/kcptun
git clone https://github.com/vernesong/OpenClash.git
mv -f OpenClash/luci-app-openclash ./luci-app-openclash
rm -rf OpenClash

# 主题
git clone https://github.com/garypang13/luci-theme-edge -b 18.06
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial
svn co https://github.com/Lienol/openwrt-luci/trunk/themes/luci-theme-material
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06
git clone https://github.com/jerrykuku/luci-app-argon-config
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentomcat
git clone https://github.com/sirpdboy/luci-theme-opentopd
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom
git clone https://github.com/rosywrt/luci-theme-rosy

# 插件
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
svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolproxyR
git clone https://github.com/tty228/luci-app-serverchan
git clone https://github.com/esirplayground/luci-app-poweroff
git clone https://github.com/garypang13/luci-app-eqos
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/node-request


sed -i 's/"Argon 主题设置"/"Argon设置"/g' luci-app-argon-config/po/zh-cn/argon-config.po

rm -rf .svn
rm -rf ./*/.svn
rm -rf ./*/.git
rm -rf ./*/LICENSE
rm -rf ./*/readme.txt
rm -f .gitattributes .gitignore
# rm -rf ./*/README.md
exit 0
