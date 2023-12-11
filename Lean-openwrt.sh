#!/bin/bash

git clone https://github.com/coolsnowwolf/lede
git clone https://github.com/coolsnowwolf/packages
git clone https://github.com/coolsnowwolf/luci
git clone https://github.com/coolsnowwolf/routing
git clone https://github.com/fw876/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall-packages passwall/packages
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall passwall/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 passwall/luci-app-passwall2

# 生成完整目录清单
cat >> Update.md <<EOF
lede
packages
luci
routing
helloworld
passwall
EOF


cat >> README.md <<EOF
# [Lean和lienol的源码定时备份]


[Lean](https://github.com/coolsnowwolf/lede)
[ Lienol](https://github.com/Lienol/openwrt )
[ xiaorouji package](https://github.com/xiaorouji/openwrt-passwall)




## 感谢各位大神的源码，openwrt有各位大神而精彩，感谢！感谢！

EOF

# 调用通知
/bin/bash ../wxtg.sh



exit 0