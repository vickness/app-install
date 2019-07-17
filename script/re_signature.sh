#!/usr/bin/env bash

appid=$1
cer_path=$2
key_path=$3
profile_path=$4
in_path=$5
out_path=$6

if [[ ! $appid ]]; then
    echo "Can't find appid!";
    exit 1;
fi

if [[ ! $cer_path ]]; then
    echo "Can't find cer_path!";
    exit 1;
fi

if [[ ! $key_path ]]; then
    echo "Can't find key_path!";
    exit 1;
fi

if [[ ! $profile_path ]]; then
    echo "Can't find profile_path!";
    exit 1;
fi

if [[ ! $in_path ]]; then
    echo "Can't find in_path!";
    exit 1;
fi

if [[ ! $out_path ]]; then
    echo "Can't find out_path!";
    exit 1;
fi

profile_path=$profile_path"/AdHoc_"$appid".mobileprovision"

isign -i CFBundleIdentifier=$appid -c $cer_path -k $key_path -p $profile_path -o $out_path $in_path
