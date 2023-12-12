#!/bin/bash

server_path="%home_path%"
fastdl_path="%home_path%/fastdl"
fastdl_link="http://%ip%:8080/%port%/"

cd $server_folder
mkdir -p fastdl
cp -rf $server_path/cstrike/gfx $server_path/cstrike/maps $server_path/cstrike/models $server_path/cstrike/overviews $server_path/cstrike/resource $server_path/cstrike/sound $server_path/cstrike/sprites $server_path/cstrike/*.wad $fastdl_folder
sed -i '/sv_downloadurl/c sv_downloadurl "$fastdl_link"' $server_path/cstrike/server.cfg
sed -i '/sv_allowupload/c sv_allowupload 1' $server_path/cstrike/server.cfg
sed -i '/sv_allowdownload/c sv_allowdownload 1' $server_path/cstrike/server.cfg
sed -i -e '$a' $server_path/cstrike/server.cfg
grep -qF -- 'sv_downloadurl "$fastdl_link"' '$server_path/cstrike/server.cfg' || echo 'sv_downloadurl "$fastdl_link"' >> '$server_path/cstrike/server.cfg'
sed -i -e '$a' $server_path/cstrike/server.cfg
grep -qF -- 'sv_allowupload 1' '$server_path/cstrike/server.cfg' || echo 'sv_allowupload 1' >> '$server_path/cstrike/server.cfg'
sed -i -e '$a' %home_path%/cstrike/server.cfg
grep -qF -- 'sv_allowdownload 1' '$server_path/cstrike/server.cfg' || echo 'sv_allowdownload 1' >> '$server_path/cstrike/server.cfg'
rm -rf $server_path/cstrike/server.cfg.bak
