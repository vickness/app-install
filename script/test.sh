#!/usr/bin/env bash

username="cdvzbs@sina.com"
password="Hsxs15699"
appid="com.xmcptest21"
udid="AC34BB41413ECB023D6063947C984DE29F9E790B"
session='---\n- !ruby/object:HTTP::Cookie\n  name: DES50d8828f161ef871187608d1e3718e0a5\n  value: HSARMTKNSRVXWFlatX40T5/NK+9F5wur2N8WuGCy3DFjTm/SL7oqUuSqouzhzmdau+/oxFIIEt5p1ZIIO0aV4rfTLc8J9jv5kqpXRvD0wcD/2YKpxKQ0cKuNFfCf4DE/ZqU5OJybn57lItZWsA==SRVX\n  domain: idmsa.apple.com\n  for_domain: true\n  path: "/"\n  secure: true\n  httponly: true\n  expires: \n  max_age: 2592000\n  created_at: &1 2019-08-26 11:28:43.250921000 +08:00\n  accessed_at: *1\n- !ruby/object:HTTP::Cookie\n  name: myacinfo\n  value: DAWTKNV25e62f1b5b249dd5642ca0e52d9a26a7419883460ee6493cb0515b580fcb5c84888a4fd012de86503db86dbbe5d790a99d5c8be59abd7569fcaf496652257bf7110bedb4f86a00c3d6aa01a939d6d4b551a0d7138494b0bf3425c90923c410b0a05b6ecadb1d913ee489c68e6e035a24713be1da02da03e8e235f18496ea94f50183d5ec6ea333da6172ce47761f543c23b9a876f252e4ddf65b57772f4e76913fa034deb81d25df17dbbb6b0643aeb9020ed6c0e9bcd44ee16c4b45001c86f886766a44a1629edf520894382e9287534f3e8a93f368d356337a2351060baa340bb80034d95c000e59bab2e9d8f7ff7334136ef82e6ce1e7116b082d38ad357f30b74bcdfa19129f8dc2ed832c4aaf62c589f6d0b6ad96e1d788c9c5fdac384741bbc44354b4ca65bb1bacbec7c07ad39021db60d62e09bfb18c89783ce98dd1b4dc1524189b91c994fd04bdcac8804024ec07ff23e38ba0aa32aff28c690cd0e589848c28adcfaf1b50d320c183723ba63366664613762306335383039383339313535666131643736396139393161303631613661656230MVRYV2\n  domain: apple.com\n  for_domain: true\n  path: "/"\n  secure: true\n  httponly: true\n  expires: \n  max_age: \n  created_at: 2019-08-26 11:28:43.251202000 +08:00\n  accessed_at: 2019-08-26 11:28:43.270228000 +08:00\n- !ruby/object:HTTP::Cookie\n  name: dqsid\n  value: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NjY3OTAxMjMsImp0aSI6IjZBS3BJS1FwLWVGcWlFNkNBaGV3TFEifQ.DP4HQ2iWGhIjt7g_wI2UHPF_1w3IM24aHpEUpviy4Lk\n  domain: appstoreconnect.apple.com\n  for_domain: false\n  path: "/"\n  secure: true\n  httponly: true\n  expires: \n  max_age: 1800\n  created_at: &2 2019-08-26 11:28:44.004165000 +08:00\n  accessed_at: *2\n'
p12_path="../cers/cer.p12"
cer_path="../cers/certificate.pem"
key_path="../cers/key.pem"
profile_path="../profile"
in_path="../apps/test1.ipa"
out_path="../apps/"$appid".ipa"

# 导出证书
bash export_creds.sh $p12_path "../cers"

# 创建appid
bash creat_appid.sh $appid $username $password "${session}"

# 注册udid
bash register_udid.sh $udid $username $password "${session}"

# 创建配置文件
bash creat_profile.sh $appid $profile_path $username $password "${session}"

# 重签名
bash re_signature.sh $appid $cer_path $key_path $profile_path $in_path $out_path
