#!/usr/bin/env bash

echo "安装rvm...";
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.5

echo "安装fastlane..."
sudo gem install fastlane

echo "安装isign...";
git clone https://github.com/apperian/isign
cd isign
sh version.sh
python setup.py build
python setup.py install
rm -rf isign
echo "安装完成";
