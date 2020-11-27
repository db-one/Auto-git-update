#!/bin/bash

svn co  https://github.com/coolsnowwolf/lede/trunk openwrt
svn co  https://github.com/coolsnowwolf/packages/trunk openwrt-packages
svn co  https://github.com/coolsnowwolf/luci/trunk openwrt-luci
svn co  https://github.com/fw876/helloworld/trunk helloworld

exit 0
