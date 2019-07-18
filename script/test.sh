#!/usr/bin/env bash

username="cdvzbs@sina.com"
password="Hsxs15699"
appid="com.xmcptest15"
udid="4bcd080ce0005fe68efe9c79e1cfbdad81ef1c15"
session='---\n- !ruby/object:HTTP::Cookie\n  name: DES50d8828f161ef871187608d1e3718e0a5\n  value: HSARMTKNSRVXWFlaVjuTGNoXM4mTZ51c0oxoy+vm2JY3kITtN/7mzlChq9FSMrwzGSAJQ7Yjk5YKh+tRtu4TJePtiAcz5OWxUNF3pVkcXCfBLxObubvh/eLBxmQUKFgLAA4C3OxX1CFnQQ==SRVX\n  domain: idmsa.apple.com\n  for_domain: true\n  path: "/"\n  secure: true\n  httponly: true\n  expires: \n  max_age: 2592000\n  created_at: &1 2019-07-17 05:57:12.080626382 -04:00\n  accessed_at: *1\n- !ruby/object:HTTP::Cookie\n  name: myacinfo\n  value: DAWTKNV2a465d2272620e872df7501610b1ceead0c6f466b338dfb69301f7a487864feb17f857cfb56687310dd2d545eb793d764b8d75a14ce2a7613a18ce51f4b917f2dc9d0a1b3bc422047fddc66063705a4aea877be1a64b17387cf3c60fc18850c5c865de901ed5184bba8d905655fc205c45ad3755f8e769776d5777b9b013f008529259f25ba01582da9ac82c838010de0f071297dea07ce379d370f1b1a519d816d460a24fcb6dd58ab4bb7bbe0dd9acd7ef8306655a5b81cfb1290b010cec5355ae336ddabdd19fd52ab69c8cd70094031c87fb31e7188f5e1f7069c953d8808d56379d9dea4a802a05894d48b198a66de41dbb853789d2d40bb3178fd3f43591a904427e6b64029772d4ff9b878c75f7eadb4750b78180005be264bdbdb8d0417d7c0a4aaf03910a773d750c2304c4a0e95199ec84ed6bd6390a787596d39970bfc6c9f9e655cb69f5a12faa95cc7e4f42af02193ec6ca1bd6ff89ed087d5aae9add0adec5ee479d5b3a3e352b1031b65613464306435363865316163643338623130323463633331353836313630646137336534353064MVRYV2\n  domain: apple.com\n  for_domain: true\n  path: "/"\n  secure: true\n  httponly: true\n  expires: \n  max_age: \n  created_at: 2019-07-17 05:57:12.080747492 -04:00\n  accessed_at: 2019-07-17 05:57:12.085905314 -04:00\n- !ruby/object:HTTP::Cookie\n  name: dqsid\n  value: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NjMzNTM3NzgsImp0aSI6IkdhQU03VGZfOFVERnljanlZbFhSYWcifQ.TDoyXuBcJewlnrUe_EpsPVH0P47Uj7oANpsL3X1NehQ\n  domain: appstoreconnect.apple.com\n  for_domain: false\n  path: "/"\n  secure: true\n  httponly: true\n  expires: \n  max_age: 1800\n  created_at: &2 2019-07-17 05:57:12.716841288 -04:00\n  accessed_at: *2\n'

p12_path="../cers/cer.p12"
cer_path="../cers/certificate.pem"
key_path="../cers/key.pem"
profile_path="../profile"
in_path="../apps/test.ipa"
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
