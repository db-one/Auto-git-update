 #!/bin/bash

curl -fsSL https://raw.githubusercontent.com/acgotaku/BaiduExporter/master/BaiduExporter.crx > 百度网盘助手.crx

mkdir -p 风扇控制
curl -fsSL https://raw.githubusercontent.com/Rem0o/FanControl.Releases/master/FanControl.zip > 风扇控制/FanControl.zip
curl -fsSL https://raw.githubusercontent.com/Rem0o/FanControl.Releases/master/version.json > 风扇控制/版本.json

mkdir -p 微软TTS
svn co https://github.com/ag2s20150909/TTS/trunk/release 微软TTS
rm -r 微软TTS/TTS_release*.apk.idsig

# 阅读 服务器版
git clone https://github.com/hectorqin/reader

# 自建规则转换
mkdir -p sub-web
git clone https://github.com/tindy2013/subconverter sub-web/subconverter
git clone https://github.com/CareyWang/sub-web sub-web/sub-web
git clone https://github.com/281677160/agent sub-web/agent


# CloudflareST
CloudflareST=v2.0.3
# X86-64版本
mkdir -p CloudflareSpeedTest
curl -fsSL https://github.com/XIU2/CloudflareSpeedTest/releases/download/$CloudflareST/CloudflareST_linux_amd64.tar.gz > CloudflareST_linux_amd64.tar.gz
tar -zxf CloudflareST_linux_amd64.tar.gz -C ./CloudflareSpeedTest
rm -r CloudflareST_linux_amd64.tar.gz
# ARM64版本
mkdir -p CloudflareSpeedTest_ARM64
curl -fsSL https://github.com/XIU2/CloudflareSpeedTest/releases/download/$CloudflareST/CloudflareST_linux_ARM64.tar.gz > CloudflareST_linux_ARM64.tar.gz
tar -zxf CloudflareST_linux_ARM64.tar.gz -C ./CloudflareSpeedTest_ARM64
mv -f CloudflareSpeedTest_ARM64/CloudflareST ./CloudflareSpeedTest/CloudflareST_ARM64
rm -r CloudflareST_linux_ARM64.tar.gz CloudflareSpeedTest_ARM64


cat >> README.md <<EOF
# 放点备份文件


EOF


# 删除拉取插件后残留的.git和.svn,再随带删除各种README说明
find . -name 'LICENSE' | xargs -i rm -rf {}
find ./*/ -name '*.git' -o -name '*.github' | xargs -i rm -rf {}
find . -name '*.svn' -o -name '*.ipk' | xargs -i rm -rf {}
find . -name '.gitattributes' -o -name '.gitignore' | xargs -i rm -rf {}
#find . -name '*.md' | xargs -i rm -rf {}

exit 0

