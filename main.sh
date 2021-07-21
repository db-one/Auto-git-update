 #!/bin/bash
 
mkdir -p BaiDu-Exporter
curl -fsSL https://raw.githubusercontent.com/acgotaku/BaiduExporter/master/BaiduExporter.crx > BaiDu-Exporter/BaiduExporter.crx

svn co https://github.com/tgbot-collection/YYeTsBot/trunk YYeTsBot #人人影视bot

svn co https://github.com/ag2s20150909/TTS/trunk/release Microsoft_TTS #微软TTS



cat >> README.md <<EOF
# 放点备份文件


EOF

rm -rf .svn
rm -rf ./*/.git
rm -rf ./*/.svn
rm -rf ./*/*/.svn
rm -rf ./*/*/.git
rm -rf ./*/LICENSE
rm -rf ./*/readme.txt
rm -f .gitattributes .gitignore
# rm -rf ./*/README.md
exit 0

