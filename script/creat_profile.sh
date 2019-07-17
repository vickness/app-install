#!/usr/bin/env bash

# username  账号名称
# password  账号密码
# appid     应用包名
# out_path  配置文件输出路径

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 username password appid out_path"
    exit 1;
fi

username=$1
password=$2
appid=$3
out_path=$4

if [[ ! $username ]]; then
    echo "Can't find username!";
    exit 1;
fi

if [[ ! $password ]]; then
    echo "Can't find password!";
    exit 1;
fi

if [[ ! $appid ]]; then
    echo "Can't find appid!";
    exit 1;
fi

if [[ ! $out_path ]]; then
    echo "Can't find out_path!";
    exit 1;
fi

export FASTLANE_USER=$username
export FASTLANE_PASSWORD=$password
export FASTLANE_DONT_STORE_PASSWORD='1'

fastlane sigh --adhoc --force --skip_install --skip_certificate_verification -a $appid -o $out_path -u $username

