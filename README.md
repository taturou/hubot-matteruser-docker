# これなに？

Mattermost 用の Hubot です。

Hubot が Mattermost に登録済みのユーザとしてログインします。Webhook でのアクセスではないので Hubot が居ることがわかりやすいですし、プライベートチャンネルでもそのユーザを招待すれば Hubot にアクセスできます。

なお、Mattermost は https でアクセスできる必要があります (http ではダメです)。

# 必要なもの

* [docker](https://www.docker.com/)
* [docker-compose](https://github.com/docker/compose)
    * Version 2 file format を扱えるバージョンを使用してください。

# 設定

`./matteruser.env` に記載します。

    $ cp ./matteruser-default.env ./matteruser.env

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

# スクリプト
## 組み込みの外部スクリプト

標準の外部スクリプトに加えて、以下を組み込んでいます。

### hubot-reload-scripts

Hubot を再起動せずにスクリプトだけ読み込みます。
Mattermost から `@bot reload` で読み込ませることができます。

## オリジナルスクリプト

スクリプトの言語は Javascript と Coffee Script です。
以下に置いてください。

* ./volumes/scripts/

## データ永続化

brain に Redis を使用して永続化します。
Redis のデータは以下に保存されます。

* ./volumes/redis/

# おまけ

## 他のアダプタ (Slack など) を使用する方法

Slack など、Mattermost 以外のチャットツールに接続するときは、Hubot のアダプタを変更すれば良いです。

まず、`./app/Dockerfile` の以下の行を修正してください。
文字列「matteruser」(3箇所) を、使用するアダプタの名前に置き換えることで、Hubot の設定が変わります。

    RUN npm install -g yo generator-hubot coffee-script hubot-matteruser

    RUN yo hubot --name="bot" --description="bot" --owner="bot@example.com" --adapter="matteruser" --defaults

    CMD bin/hubot --name "${HUBOT_NAME}" --adapter "matteruser"

次に、`matteruser.env` に定義してある `MATTERMOST_XXX` の代わりに、使用するアダプタが求める環境変数を記載してください。

以上で Mattermost 以外のチャットツールにも接続できるようになるはずです。
