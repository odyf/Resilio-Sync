#!/bin/bash
############### 一键安装RslSync脚本 ###############
#Author:gao4.top
#Update:2020-12-15
#Help:https://www.xiaoz.me/archives/8219
####################### END #######################
wget https://gao4.coding.net/api/share/download/426663f4-692c-4675-a1d5-0fa4c81ff2d4 -O resilio-sync_x64.tar.gz
tar -xzvf resilio-sync_x64.tar.gz
mv rslsync /usr/bin
cat >/etc/systemd/system/rslsync.service <<-EOF
[Unit]
Description=resilio sync server
    
[Service]
Type=forking
User=root
Group=root
ExecStart=/usr/bin/rslsync --webui.listen 0.0.0.0:555
Restart=on-abort
    
[Install]
WantedBy=multi-user.target
EOF
systemctl start rslsync
systemctl enable rslsync
echo "############################# 安装成功 #############################"
echo "访问地址:http://ip:555"
echo "帮助中心:https://www.xiaoz.me/archives/8219"