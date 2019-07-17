#!/usr/bin/env bash

# username  账号名称
# password  账号密码
# udid      设备UDID

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 username password udid"
    exit 1;
fi

username=$1
password=$2
udid=$3

if [[ ! $username ]]; then
    echo "Can't find username!";
    exit 1;
fi

if [[ ! $password ]]; then
    echo "Can't find password!";
    exit 1;
fi

if [[ ! $udid ]]; then
    echo "Can't find udid!";
    exit 1;
fi

export FASTLANE_USER=$username
export FASTLANE_PASSWORD=$password
export FASTLANE_DONT_STORE_PASSWORD='1'

fastlane run register_device name:$udid udid:$udid username:$username
