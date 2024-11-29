#!/bin/bash

git clone https://github.com/immortalwrt/immortalwrt -b openwrt-23.05
git clone https://github.com/immortalwrt/luci -b openwrt-23.05
git clone https://github.com/immortalwrt/packages -b openwrt-23.05

# 生成完整目录清单
cat >> Update.md <<EOF
immortalwrt
luci
packages
EOF


cat >> README.md <<EOF
# [ Lean 和 immortalwrt 的源码定时备份]


[Lean](https://github.com/coolsnowwolf/lede)
[ immortalwrt](https://github.com/immortalwrt/immortalwrt )




## 感谢各位大神的源码，openwrt有各位大神而精彩，感谢！感谢！

EOF

# 调用通知
/bin/bash ../wxtg.sh



exit 0
