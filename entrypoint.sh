#!/usr/bin/env bash
cd /home
pwd

if [[ -d /home/dragonwell8/build ]]; then
  echo "already build"
else
  # 更新仓库为国内源
  cp /etc/apt/sources.list /etc/apt/sources.list.bak #备份
  cp /sources.list /etc/apt/sources.list
  # cat /etc/apt/sources.list
  apt-get update

  # 安装依赖
  apt-get install libx11-dev libxext-dev libxrender-dev libxtst-dev libxt-dev libcups2-dev libfreetype6-dev libasound2-dev -y
  apt-get install build-essential -y
  apt-get install zip unzip -y

  # 安装ccache高速编译工具
  apt install ccache -y

   # 如果不存在源码，重新拉取源码
  if [[ -d dragonwell8 ]]; then
    echo "directory dragonwell8 already exist"
  else
    # 安装git
    apt-get install git -y
    git --version
    git clone https://github.com/terwer/dragonwell8.git
    # 获取子模块
    chmod +x /home/dragonwell8/get_source_dragonwell.sh
    /bin/bash /home/dragonwell8/get_source_dragonwell.sh -s github
  fi

  # 编译配置
  cd /home/dragonwell8
  chmod +x ./configure
  ./configure --with-boot-jdk=/opt/java/jdk1.7.0_80 --with-freetype-include=/usr/include/freetype2 --with-freetype-lib=/usr/lib/x86_64-linux-gnu --with-debug-level=slowdebug --with-jvm-variants=server --with-target-bits=64 --enable-ccache --with-num-cores=4 --with-memory-size=3000

  # 编译源码
  sudo make images
  echo "build finished"
fi

# 验证编译结果
/bin/bash /home/dragonwell8/build/linux-x86_64-normal-server-slowdebug/jdk/bin/java -version
/bin/bash
