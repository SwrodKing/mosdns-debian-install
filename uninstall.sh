#!/bin/bash
#set -u
clear
echo "~~~~~~~~~~~~~~~~"
echo "卸载mosdns………………"
echo "~~~~~~~~~~~~~~~~"
systemctl stop mosdns.service
systemctl disable mosdns.service > /dev/null 2>&1
rm /etc/systemd/system/mosdns.service
systemctl daemon-reload
systemctl reset-failed
rm -rf /opt/mosdns 
echo "重置DNS………………"
rm -rf /etc/resolv.conf
cat << EOF >/etc/resolv.conf
domain local
nameserver 233.5.5.5
nameserver 8.8.8.8
EOF

systemctl enable systemd-resolved.service > /dev/null 2>&1
systemctl restart systemd-resolved.service
cd ~
echo "~~~~~~~~"
echo "卸载完成!"
echo "~~~~~~~~"
