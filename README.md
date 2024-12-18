# 使用说明

本着“能省则省”的原则（主要还是因为路由器配置不行），就用 OpenWrt 自带的 Dnsmasq 来屏蔽广告，效果也还行。

使用的是[秋风](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)的去广告规则，规则数量少但是命中率高，平时也够用了。如果想用其他的也可以自己替换。

## 自动安装
很简单，在终端中运行下面的命令即可：
```bash
curl https://cdn.jsdelivr.net/gh/noviachen/Dnsmasq-Adblock@main/install.sh -sSLo /tmp/install.sh && sh /tmp/install.sh
```
可能由于网络问题会失败，多试几次吧，或者换个加速。

## 手动安装

下载 hosts 文件和仓库中的 `update_host.sh`，上传到到路由器。在 `Dnsmasq 设置` ->  `Resolv 和 Hosts 文件` -> `额外的 HOSTS 文件` 中添加已下载的hosts 文件，再添加定时任务。

## 如何删除

同手动安装的方法，将下载的文件和设置删除即可。自动下载的文件均在 `/etc/dnsmasq.d` 目录。

