# 步骤

1. 购买VPS
2. 在VPS上安装系统
3. 启用BBR
4. 安装sbcl, rlwrap, emacs, slime

## 购买VPS

虛擬專用伺服器（英语：Virtual private server，縮寫為 VPS），是将一台服务器分割成多个虚拟专享服务器的服务。实现VPS的技术分为容器技术和虚拟化技术 。在容器或虚拟机中，每个VPS都可分配独立公网IP地址、独立操作系统、实现不同VPS间磁盘空间、内存、CPU资源、进程和系统配置的隔离，为用户和应用程序模拟出“独占”使用计算资源的体验。VPS可以像独立服务器一样，重装操作系统，安装程序，单独重启服务器。VPS为使用者提供了管理配置的自由，可用于企业虚拟化，也可以用于IDC资源租用。 IDC资源租用，由VPS提供商提供。不同VPS提供商所使用的硬件VPS软件的差异，及销售策略的不同，VPS的使用体验也有较大差异。尤其是VPS提供商超卖，导致实体服务器超负荷时，VPS性能将受到极大影响。相对来说，容器技术比虚拟机技术硬件使用效率更高，更易于超卖，所以一般来说容器VPS的价格都高于虚拟机VPS的价格。 这些VPS主机以最大化的效率共享硬件、软件许可证以及管理资源。每个VPS主机都可分配独立公网IP地址、独立操作系统、独立超大空间、独立内存、独立CPU资源、独立执行程序和独立系统配置等. VPS主机用户除了可以分配多个虚拟主机及无限企业邮箱外， 更具有独立主机功能, 可自行安装程序，单独重启主机。

我是用[Vultr.com](https://www.vultr.com/?ref=7177671)的Cloud Compute: 1CPU, 512MB, 20GB SSD, 500GB BandWidth.每月$2.5.

## 在VPS上安装系统

很简单，在deploy new server时选择Debian 9x64,就好了。

为SSH设置port: 在\etc\ssh\sshd_config中，增加或修改“Port 29000”(29000代换成自己的端口号).SSH默认port是22,一般不要用。

## 启用BBR

 **开启bbr**
  ```
  echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
  echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
  ```
  _执行这个保存生效更改_
  
  `sysctl -p`
  
  **关闭bbr**
  ```
  sed -i '/net\.core\.default_qdisc=fq/d' /etc/sysctl.conf && sed -i '/net\.ipv4\.tcp_congestion_control=bbr/d' /etc/sysctl.conf
  sysctl -p
  ```
  _执行完上面的代码，就使用reboot重启VPS后才能关闭bbr，重启后再用下面的查看bbr状态代码，查看是否关闭了。_
  
  `reboot`
  
  **查看bbr是否开启**
  
  执行下面命令，如果结果中有bbr，即证明你的内核已开启bbr.
    
   `sysctl net.ipv4.tcp_available_congestion_control`
    
  执行下面命令，看到有 tcp_bbr 模块，即说明bbr已启动.
    
   `lsmod | grep bbr`

## 安装sbcl, rlwrap, emacs, slime

用下面命令更新

```
apt update
apt upgrade
```

用下面命令安装sbcl， rlwrap， emacs：(sbcl = steel bank common lisp)

```
apt install sbcl
apt install rlwrap
apt install emacs
```
在~/.bashrc中增加下面语句,增强和改善sbcl行输入：

`alias sbcl='/usr/bin/rlwrap /usr/bin/sbcl'`

(可以用`which sbcl` `which rlwrap`查看其位置)

#### 进入emacs ,修改~/.emacs.d/init.el，启用Slime





