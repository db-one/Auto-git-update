 #!/bin/bash
 
mkdir -p BaiDu-Exporter
curl -fsSL https://raw.githubusercontent.com/acgotaku/BaiduExporter/master/BaiduExporter.crx > BaiDu-Exporter/BaiduExporter.crx

svn co https://github.com/tgbot-collection/YYeTsBot/trunk #人人影视bot

exit 0
