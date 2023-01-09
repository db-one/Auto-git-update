 #!/bin/bash

#一键DD系统
mkdir -p Linux
curl -fsSL https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh > Linux/InstallNET.sh

curl -fsSL https://raw.githubusercontent.com/acgotaku/BaiduExporter/master/BaiduExporter.crx > 百度网盘助手.crx

mkdir -p 风扇控制
curl -fsSL https://raw.githubusercontent.com/Rem0o/FanControl.Releases/master/FanControl.zip > 风扇控制/FanControl.zip
curl -fsSL https://raw.githubusercontent.com/Rem0o/FanControl.Releases/master/version.json > 风扇控制/版本.json

mkdir -p 微软TTS
svn co https://github.com/ag2s20150909/TTS/trunk/release 微软TTS
rm -r 微软TTS/TTS_release*.apk.idsig

# 阅读 服务器版
git clone https://github.com/hectorqin/reader

# Fail2ban SSH Docker
git clone https://github.com/crazy-max/docker-fail2ban Fail2ban-SSH-Docker

# 一些高清图标
git clone https://github.com/xushier/HD-Icons

# 自建规则转换
mkdir -p sub-web
git clone https://github.com/tindy2013/subconverter sub-web/subconverter
git clone https://github.com/CareyWang/sub-web sub-web/sub-web
git clone https://github.com/281677160/agent sub-web/agent



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

