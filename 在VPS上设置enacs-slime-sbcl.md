# 步骤
and
1. 购买VPS
2. 在VPS上安装系统
3. 启用BBR
4. 安装sbcl, rlwrap, emacs, slime

## 购买VPS

我是用[Vultr.com](https://www.vultr.com/?ref=7177671)的Cloud Compute: 1CPU, 512MB, 20GB SSD, 500GB BandWidth.每月$2.5.

## 在VPS上安装系统

很简单，在deploy new server时选择Debian 9x64,就好了。

为SSH设置port: 在\etc\ssh\sshd_config中，增加或修改“Port 29000”(29000代换成自己的端口号).SSH默认port是22,一般不要用。

## 启用BBR



## 安装sbcl, rlwrap, emacs, slime




