 #!/bin/bash
 
mkdir -p BaiDu-Exporter
curl -fsSL https://raw.githubusercontent.com/acgotaku/BaiduExporter/master/BaiduExporter.crx > BaiDu-Exporter/BaiduExporter.crx

svn co https://github.com/tgbot-collection/YYeTsBot/trunk YYeTsBot #人人影视bot

svn co https://github.com/ag2s20150909/TTS/trunk/release Microsoft_TTS #微软TTS



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

