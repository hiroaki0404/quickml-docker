# quickml-docker #
[quickml](http://0xcc.net/quickml/) のコンテナです。
port 10025で待ち受けますので、適当なportで公開してください。

## ファイル/ディレクトリ ##
*  /etc/quickml/authorized_creators メーリングリストを作成できる人のリスト
*  /var/lib/quickml/
 各メーリングリストの管理ファイルが置かれるディレクトリ

## 環境変数
* MAILNAME ドメインを指定します。必須。
* MAILHOST メールを送信するサーバを指定します。未指定の場合、docker hostが使用されます。
* CONFIRM_ML_CREATION メーリングリストの作成者を/etc/quickml/authorized_creators に記載されたユーザに限定します。

## 起動例
docker run -e MAILNAME=ml.example.jp -e MAILHOST=smtp.example.jp -p 10025:25 quickml-docker

## 注意
当然のことながら、無保証です。これらを使用したことによる一切の責任を負いません。自己責任でお使いください。