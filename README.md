# docker_laravel10_skeleton
* Docker x Laravel10 の 一発環境構築

## Install

* git clone 不要 以下のコマンドでインストール できます。
* 今の所 Macを 想定。

```
/bin/bash -ec "$(curl -fsSL https://raw.githubusercontent.com/iitenkida7/docker_laravel10_skeleton/main/install.sh)"
```

* ブラウザでSSL証明書エラーでアクセスできない場合は、以下のコマンドを実行 （パスは適宜変更）

```
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain project/docker/nginx/ssl/server.crt
```
