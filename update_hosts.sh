#!/bin/sh

# 定义下载 URL 和保存路径
HOSTS_FILE="/etc/dnsmasq.d/AWAvenue-Ads-Rule-hosts.txt"
URL="https://gcore.jsdelivr.net/gh/TG-Twilight/AWAvenue-Ads-Rule@main/Filters/AWAvenue-Ads-Rule-hosts.txt"

# 下载新的 hosts 文件
echo "正在下载 hosts 文件..."
curl -sSLo "$HOSTS_FILE" "$URL"

# 检查下载是否成功
if [ $? -eq 0 ]; then
    echo "hosts 文件下载成功"
    # 重启 dnsmasq 
    /etc/init.d/dnsmasq restart
    echo "dnsmasq 已重启"
else
    echo "hosts 文件下载失败，请重试！"
fi
