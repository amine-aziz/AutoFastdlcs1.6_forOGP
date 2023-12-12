#!/bin/bash
cd %home_path%
mkdir -p fastdl
cp -rf %home_path%/cstrike/gfx %home_path%/cstrike/maps %home_path%/cstrike/models %home_path%/cstrike/overviews %home_path%/cstrike/resource %home_path%/cstrike/sound %home_path%/cstrike/sprites %home_path%/cstrike/*.wad %home_path%/fastdl
sed -i '/sv_downloadurl/c sv_downloadurl "http://%ip%:8080/%port%/"' %home_path%/cstrike/server.cfg
sed -i '/sv_allowupload/c sv_allowupload 1' %home_path%/cstrike/server.cfg
sed -i '/sv_allowdownload/c sv_allowdownload 1' %home_path%/cstrike/server.cfg
sed -i -e '$a' %home_path%/cstrike/server.cfg
grep -qF -- 'sv_downloadurl "http://%ip%:8080/%port%/"' '%home_path%/cstrike/server.cfg' || echo 'sv_downloadurl $fastdl_link' >> '%home_path%/cstrike/server.cfg'
sed -i -e '$a' %home_path%/cstrike/server.cfg
grep -qF -- 'sv_allowupload 1' '%home_path%/cstrike/server.cfg' || echo 'sv_allowupload 1' >> '%home_path%/cstrike/server.cfg'
sed -i -e '$a' %home_path%/cstrike/server.cfg
grep -qF -- 'sv_allowdownload 1' '%home_path%/cstrike/server.cfg' || echo 'sv_allowdownload 1' >> '%home_path%/cstrike/server.cfg'
rm -rf %home_path%/cstrike/server.cfg.bak
