# アプリケーション名
ペット管理アプリ

# アプリケーションの概要
・自分の飼っているペットを登録し、そのペットごとに毎日の体重・体温・食事量を記録できる。<br>
・ペットとの日常を画像と一緒に記録することができる。<br>
・ペットの種類は問わず、複数のペットを登録できるため、多頭飼いの場合でも問題ありません。

# URL
https://petapp.herokuapp.com/

# 技術スタック
・フロントエンド： erb,html5,css3,javascript<br>
・バックエンド： Ruby3.1.2, Rails7.0.3<br>
・インフラ： heroku, Docker

# 主要機能一覧
・自分の飼っているペットの情報（名前・年齢・性別）を入力できる。<br>
・各ペットの名前をクリックすると、そのペットの情報ページに遷移。<br>
　そこで体重・体温・食事量を記録でき、記録した時間も表示される。<br>
・日記の投稿（N＋1問題解決）と、いいね機能<br>
・各モデルの基本的なCRUD
