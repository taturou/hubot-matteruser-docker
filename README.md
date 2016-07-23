# これなに？

Mattermost用のHubot

# 必要なもの

* docker
* docker-compose
    * Version 2 file format を扱えるバージョンを使用してください。

# 初期設定

matteruser.env に記載します。

    $ cp matteruser-default.env matteruser.env

した後で変更してください。

## Hubot関連

* HUBOT_NAME : ボットの名前
* HUBOT_DESCRIPTION : ボットの概要
* HUBOT_OWNER : ボットのオーナー (メールアドレス)

## Matermost関連

[hubot-matteruser](https://www.npmjs.com/package/hubot-matteruser) を参照してください。

# 起動方法

docker-compose で起動します。

    $ docker-compose build
    $ docker-compose up -d

# 組み込みの外部スクリプト

標準の外部スクリプトに加えて、以下を組み込んでいます。

## hubot-reload-scripts

Hubotを再起動せずにスクリプトだけ読み込みます。
Mattermostから `@bot reload` で読み込ませることができます。

# オリジナルスクリプト

スクリプトの言語は Coffee Script です。
以下に .coffee を置いてください。

* ./volumes/scripts
