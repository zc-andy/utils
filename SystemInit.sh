#!/bin/bash

# 一键安装常用工具脚本
# 安装wget、vim、git、svn、gcc、gcc-c++、gdb、automake、perf、libtool
yum install -y wget
yum install -y vim
yum install -y git
yum install -y svn
yum install -y gcc 
yum install -y gcc-c++
yum install -y gdb
yum install -y automake
yum install -y perf
yum install -y libtool

# 安装python3环境、pip3
yum install -y epel-release
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y python36u
yum install -y python36u-pip
ln -s /usr/bin/python3.6 /usr/bin/python3; ln -s /usr/bin/pip3.6 /usr/bin/pip3

# 切换到/opt目录下，建立环境目录
cd /opt; mkdir env; 

# 下载cmake最新源码包，解压、安装、删除压缩包
cd /opt/env
wget https://github.com/Kitware/CMake/releases/download/v3.14.7/cmake-3.14.7.tar.gz
tar -zxvf cmake-3.14.7.tar.gz
cd cmake-3.14.7; ./bootstrap; gmake; make install
cd ..; rm -rf cmake-3.14.7.tar.gz

# 下载yajl最新源码，安装
cd /opt/env
git clone git://github.com/lloyd/yajl 
cd yajl; ./configure; make; make install

# 下载gtest最新源码，安装
cd /opt/env
git clone https://github.com/google/googletest
cd googletest; mkdir build; cd build; cmake ..; make
cd lib; cp -r libgtest.a /usr/lib
cd ../../; cd googletest/include; cp -r gtest/ /usr/include

# 下载ragel源码包，解压、安装、删除压缩包
cd /opt/env
wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz
tar -zxvf ragel-6.10.tar.gz
cd ragel-6.10; ./configure; make; make install
cd ..; rm -rf ragel-6.10.tar.gz

# 下载valgrind源码包，解压、安装、删除压缩包
cd /opt/env
git clone git://sourceware.org/git/valgrind.git
cd valgrind; ./autogen.sh; ./configure; make; make install

# 下载php源码包，解压、安装、删除压缩包(先安装libxml2)
yum install -y libxml2-devel
cd /opt/env
wget https://www.php.net/distributions/php-7.3.10.tar.gz
tar -zxvf php-7.3.10.tar.gz
cd php-7.3.10; ./configure ;make; make install
cd ..; rm -rf php-7.3.10.tar.gz

# 安装httping、ab
yum install -y httping
yum install -y httpd-tools
