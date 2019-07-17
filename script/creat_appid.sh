#!/usr/bin/env bash

# username  账号名称
# password  账号密码
# appname   应用名称
# appid     应用包名

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 username password appname appid"
    exit 1;
fi

username=$1
password=$2
appname=$3
appid=$4

if [[ ! $username ]]; then
    echo "Can't find username!";
    exit 1;
fi

if [[ ! $password ]]; then
    echo "Can't find password!";
    exit 1;
fi

if [[ ! $appname ]]; then
    echo "Can't find appname!";
    exit 1;
fi

if [[ ! $appid ]]; then
    echo "Can't find appid!";
    exit 1;
fi

export FASTLANE_USER=$username
export FASTLANE_PASSWORD=$password
export FASTLANE_DONT_STORE_PASSWORD='1'

fastlane run produce app_identifier:$appid app_name:$appname username:$username skip_itc:true
