#!/usr/bin/env bash

in_path=$1
out_path=$2

if [[ ! -e $in_path ]]; then
    echo "Can't find $in_path!";
    exit 1;
fi

mkdir -p $out_path

target_cert_path=$out_path/certificate.pem
target_key_path=$out_path/key.pem

chmod 600 $in_path
openssl pkcs12 -in $in_path -passin pass:"" -out $target_cert_path -clcerts -nokeys
openssl pkcs12 -in $in_path -passin pass:"" -out $target_key_path -nocerts -nodes
chmod 600 $target_key_path


