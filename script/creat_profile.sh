#!/usr/bin/env bash

appid=$1
out_path=$2
username=$3
password=$4
session=$5

if [[ ! $appid ]]; then
    echo "Can't find appid!";
    exit 1;
fi

if [[ ! $out_path ]]; then
    echo "Can't find out_path!";
    exit 1;
fi

if [[ ! $username ]]; then
    echo "Can't find username!";
    exit 1;
fi

if [[ ! $password ]]; then
    echo "Can't find password!";
    exit 1;
fi

if [[ ! $session ]]; then
    echo "Can't find session!";
    exit 1;
fi

export FASTLANE_USER=$username
export FASTLANE_PASSWORD=$password
export FASTLANE_DONT_STORE_PASSWORD='1'
export FASTLANE_SESSION=$session

fastlane sigh --adhoc --force --skip_install --skip_certificate_verification -a $appid -o $out_path -u $username

