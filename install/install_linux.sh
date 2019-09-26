#!/usr/bin/env bash

echo "安装rvm...";
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.5

echo "安装zip...";
yum install zip

echo "安装fastlane..."
gem install fastlane

echo "安装isign...";
git clone https://github.com/apperian/isign
cd isign
sh version.sh
python setup.py build
python setup.py install
rm -rf isign
echo "安装完成";
