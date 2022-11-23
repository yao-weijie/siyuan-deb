#!/usr/bash

[[ -d ./pack/opt ]] && rm -rf ./pack/opt/
mkdir -p ./pack/opt/apps

ver_tag="2.5.1"
wget https://github.com/siyuan-note/siyuan/releases/download/v$ver_tag/siyuan-$ver_tag-linux.tar.gz
tar -xvf siyuan-$ver_tag-linux.tar.gz
mv siyuan-$ver_tag-linux ./pack/opt/apps/org.b3log.siyuan

sed -i "s/^Version.*/Version: $ver_tag/g" ./pack/DEBIAN/control
sed -i "s/^Version.*/Version=$ver_tag/g" ./pack/usr/share/applications/org.b3log.siyuan.desktop
dpkg -b ./pack org.b3log.siyuan-$ver_tag.deb
