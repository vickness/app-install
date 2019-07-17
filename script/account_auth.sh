#!/usr/bin/env bash

username=$1
password=$2

if [[ ! $username ]]; then
    echo "Can't find username!";
    exit 1;
fi

if [[ ! $password ]]; then
    echo "Can't find password!";
    exit 1;
fi

export FASTLANE_PASSWORD=$password

fastlane spaceauth -u $username
