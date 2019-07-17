#!/usr/bin/env bash

udid=$1
username=$2
password=$3
session=$4

if [[ ! $udid ]]; then
    echo "Can't find udid!";
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

fastlane run register_device name:$udid udid:$udid username:$username
