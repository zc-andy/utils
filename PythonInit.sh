#!/bin/bash

# python环境部署
PyVersion=`python --version`
if [ "$PyVersion" != "Python 3.6.8" ] ; then
	yum -y install epel-release
	yum -y install https://centos7.iuscommunity.org/ius-release.rpm
	yum -y install python36u
	yum -y install python36u-pip
	ln -s /usr/bin/python3.6 /usr/bin/python3
	ln -s /usr/bin/pip3.6 /usr/bin/pip3
fi

# numpy安装
pip3 install numpy

# matplotlib安装
yum install tk
pip3 install nose
pip3 install pillow
pip3 install matplotlib
