# app-install

### 安装
安装工具，仅支持Linux
```bash
bash install.sh
```

### 账号授权
执行命令后，双重认证，获取账号的认证cookie，上传到服务器，cookie有效期为一个月
```bash
bash account_auth.sh 账号 密码
```

### 导出证书
将证书p12文件转化为pem和key，用于重签名
```bash
bash export_creds.sh 证书p12路径 文件导出路径
```

### 创建appID
在账号中创建appID，格式为：com.xxx
```bash
bash creat_appid.sh 应用ID 账号 密码 授权cookie
```

### 注册设备
在账号中注册设备的UDID
```bash
bash register_udid.sh 设备UDID 账号 密码 授权cookie
```

### 创建配置文件
创建指定应用ID的配置文件，并导出到指定路径
```bash
bash creat_profile.sh 应用ID 文件导出路径 账号 密码 授权cookie
```

### ipa重签名
使用新的证书，新的包名，新的配置文件，重签名ipa
```bash
bash re_signature.sh 应用ID 证书pem路径 证书key路径 配置文件路径 原始ipa路径 新ipa导出路径
```
