#!/usr/bin/env bash

# p12_path      p12输入路径
# target_dir    输出路径

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 exported.p12 [target_directory]"
    exit 1;
fi

p12_path=$1
target_dir=$2

if [[ ! -e $p12_path ]]; then
    echo "Can't find $p12_path!";
    exit 1;
fi

mkdir -p $target_dir

target_cert_path=$target_dir/certificate.pem
target_key_path=$target_dir/key.pem

chmod 600 $p12_path

openssl pkcs12 -in $p12_path -passin pass:"" -out $target_cert_path -clcerts -nokeys
openssl pkcs12 -in $p12_path -passin pass:"" -out $target_key_path -nocerts -nodes
chmod 600 $target_key_path


