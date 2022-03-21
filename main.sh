 #!/bin/bash

curl -fsSL https://raw.githubusercontent.com/acgotaku/BaiduExporter/master/BaiduExporter.crx > 百度网盘助手.crx

mkdir -p 风扇控制
curl -fsSL https://raw.githubusercontent.com/Rem0o/FanControl.Releases/master/FanControl.zip > 风扇控制/FanControl.zip
curl -fsSL https://raw.githubusercontent.com/Rem0o/FanControl.Releases/master/version.json > 风扇控制/版本.json

mkdir -p 微软TTS
svn co https://github.com/ag2s20150909/TTS/trunk/release 微软TTS
rm -r 微软TTS/TTS_release*.apk.idsig

mkdir -p CloudflareSpeedTest
curl -fsSL https://github.com/XIU2/CloudflareSpeedTest/releases/download/v2.0.3/CloudflareST_linux_amd64.tar.gz > CloudflareST_linux_amd64.tar.gz
tar -zxf CloudflareST_linux_amd64.tar.gz -C ./CloudflareSpeedTest
rm -r CloudflareST_linux_amd64.tar.gz
chmod +x CloudflareSpeedTest/CloudflareST


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

