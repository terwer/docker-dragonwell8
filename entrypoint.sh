#!/usr/bin/env bash
cd /home
pwd

# 更新仓库为国内源
cp /etc/apt/sources.list /etc/apt/sources.list.bak #备份
cp /sources.list /etc/apt/sources.list
# cat /etc/apt/sources.list
apt-get update

# 安装git
apt-get install git -y
git --version

# 如果不存在源码，重新拉取源码
# git clone https://github.com/terwer/dragonwell8.git

/bin/bash
