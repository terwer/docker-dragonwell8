#!/usr/bin/env bash
cd /home
pwd

# 更新仓库为国内源
cp /etc/apt/sources.list /etc/apt/sources.list.bak #备份
cp /sources.list /etc/apt/sources.list
# cat /etc/apt/sources.list
apt-get update

# 如果不存在源码，重新拉取源码
if [[ -d dragonwell8 ]]; then
  error "directory dragonwell8 already exist"
else
  # 安装git
  apt-get install git -y
  git --version
  git clone https://github.com/terwer/dragonwell8.git
  # 获取子模块
  chmod +x ./get_source_dragonwell.sh
  bash ./get_source_dragonwell.sh -s github
fi

tree
cat ./a.txt

# 编译配置
# chmod +x ./configure

# 编译源码

/bin/bash
