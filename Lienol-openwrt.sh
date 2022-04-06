#!/bin/bash

git clone https://github.com/Lienol/openwrt
git clone https://github.com/Lienol/openwrt-package package
git clone https://github.com/Lienol/openwrt-packages packages -b 19.07
git clone https://github.com/Lienol/openwrt-luci luci -b 18.06

# 生成完整目录清单
cat >> Update.md <<EOF
openwrt
package
packages
luci
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
