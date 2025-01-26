#!/bin/sh

# 定义下载 URL 和保存路径
DNSMASQ_DIR="/etc/dnsmasq.d"
HOSTS_FILE="/etc/dnsmasq.d/AWAvenue-Ads-Rule-hosts.txt"
URL="https://gcore.jsdelivr.net/gh/TG-Twilight/AWAvenue-Ads-Rule@main/Filters/AWAvenue-Ads-Rule-hosts.txt"

# 创建 hosts 文件存储目录
mkdir -p "$DNSMASQ_DIR"

# 下载 hosts 文件
echo "正在下载 hosts 文件..."
curl -sSLo "$HOSTS_FILE" "$URL"

# 检查下载是否成功
if [ $? -eq 0 ]; then
    echo "hosts 文件下载成功"
else
    echo "hosts 文件下载失败，请重试！"
    exit 1
fi

# 使用 UCI 添加配置
echo "正在修改 dnsmasq 配置..."
uci add_list dhcp.cfg01411c.addnhosts="$HOSTS_FILE"

# 提交修改并应用
uci commit dhcp
/etc/init.d/dnsmasq restart

echo "配置已更新，dnsmasq 已重启"

# 自动更新 hosts 文件
# 定义下载 URL 和保存路径
UPDATE_SCRIPT="/etc/dnsmasq.d/update_hosts.sh"
SCRIPT_URL="https://fastly.jsdelivr.net/gh/noviachen/Dnsmasq-Adblock@main/update_hosts.sh"

# 下载自动更新脚本
curl -sSLo "$UPDATE_SCRIPT" "$SCRIPT_URL"
chmod +x "$UPDATE_SCRIPT"

# 定义定时任务（例如：每周一凌晨3点执行）
CRON_JOB="0 3 * * 1 $UPDATE_SCRIPT"

# 检查 crontab 中是否已存在该任务
(crontab -l | grep -v "$UPDATE_SCRIPT"; echo "$CRON_JOB") | crontab -
echo "定时任务已添加到 crontab"
