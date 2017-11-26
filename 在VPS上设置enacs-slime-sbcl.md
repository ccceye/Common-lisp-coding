# 步骤

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





