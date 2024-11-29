#!/bin/bash

git clone https://github.com/coolsnowwolf/lede
git clone https://github.com/coolsnowwolf/packages
git clone https://github.com/coolsnowwolf/luci
git clone https://github.com/coolsnowwolf/routing
git clone https://github.com/fw876/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall-packages passwall/packages

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


# 生成完整目录清单
cat >> Update.md <<EOF
lede
packages
luci
routing
helloworld
passwall
luci-app-passwall
luci-app-passwall2
EOF

# 获取二级目录并显示
ls passwall | grep -E 'packages|luci-app-passwall*' >> UpdateList.md

cat >> README.md <<EOF
# [ Lean 和 immortalwrt 的源码定时备份]


[Lean](https://github.com/coolsnowwolf/lede)
[ immortalwrt](https://github.com/immortalwrt/immortalwrt )




## 感谢各位大神的源码，openwrt有各位大神而精彩，感谢！感谢！

EOF

# 调用通知
/bin/bash ../wxtg.sh



exit 0