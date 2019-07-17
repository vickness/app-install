#!/usr/bin/env bash

appid=$1
username=$2
password=$3
session=$4
appname="AppID"

if [[ ! $appid ]]; then
    echo "Can't find appid!";
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

fastlane run produce app_identifier:$appid app_name:$appname username:$username skip_itc:true
