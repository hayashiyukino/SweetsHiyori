# Sweets日和

## サイト概要
～当アプリケーションはDMM WEBCAMP受講中PFとして製作したアプリケーションです。
　掲載情報はサンプルですので、実在する場所等とは無関係です。～

### サイトテーマ
コンビニスイーツからホテルスイーツまで幅広いジャンルや価格帯のスイーツ紹介したり、気になった商品はいいねできるレビューサイト

### ターゲットユーザ
- スイーツが好きな人
- スイーツの情報を知りたい人
- お土産や差し入れ等に向いているスイーツを知りたい人
- スイーツの情報を発信したい・広めたい人

### 主な利用シーン
- 趣味としてスイーツの情報を投稿する
- 地元の商品や旅行先でみんなにおすすめしたいスイーツがあるときに投稿する
- タグからスイーツを絞りこんで、買いたいスイーツの候補を絞る
- とにかくスイーツの情報を知りたいとき
- お土産や差し入れで悩んだ時に参考にできる
- 口コミを参考に商品の購入意思を決断する
- フォロー機能を実装した場合：気になる投稿をしている人をフォローすることで、その人の投稿をまとめてみれる

### テーマを選んだ理由
元々スイーツが好きでよく買っています。最近ではSNS等でも紹介されていることが多く、そこで気になるスイーツを見つけたりする事もありました。
ですが他の様々な情報に紛れているので見逃してしまうこともありました。なのでスイーツに特化したサイトがあれば便利だと考えこのテーマにしました。
今回のサイトではとっても身近なコンビニスイーツからデパ地下のスイーツ、個人店や観光地の名物など、とにかくスイーツを対象としたレビューサイトとなっています。
投稿時には最低限、スイーツの名前・価格・お店のアクセス先の入力してもらい、さらにタグを付け多くの選択肢から選べるようにして、あてはまるものにチェックをしてもらいます。
そうすることで、ユーザーは求めている情報にマッチしているスイーツを探すことができます。
また、みんなに広めたい、知ってほしいスイーツがある場合も同様に投稿し、いいねが多くつくことで、そこから知名度が上がる可能性もあります。

## 設計書
<会員側>
- 新規登録
- 　名前/ニックネーム/メールアドレス/パスワードで登録
- ログイン
- 　ニックネーム・パスワードでログインできる
- 　ログインユーザーのみ利用可能な機能が使える
- ログアウト
- 　ログアウトできる
- 会員情報編集
- 　名前/ニックネーム/メールアドレス/アイコン画像/自己紹介コメントの編集が行える
- 　退会処理が行える
- 退会
- 　それまでの投稿情報や会員情報が無くなり、再びログインできなくなる
- 　会員側で確認した際に、表示されなくなり退会した会員のページに遷移できなくなる
- 　管理者側の会員一覧で確認した際に、ステータスが"退会"となる
- 投稿
- 　スイーツの情報を共有することが出来る
- 　名前/価格/ジャンル/5段階評価は必須項目
- 　その他に画像/コメント/店舗名/購入場所/タグを入力することでより詳しく情報共有できる
- 投稿編集
- 　投稿内容を編集できる
- 　ただし5段階評価は編集不可
- いいね機能とコメント機能
- 　投稿記事にいいねできる
- 　投稿記事にコメントをかける
- フォロー機能
- 　他の会員をフォローできる
- 投稿検索
- 　検索から投稿記事を絞り込んで表示できる
- 　ジャンル検索/タグ検索（複数選択可能)/両方から検索可能
- ゲストログイン
- 　登録をせずにアプリケーションを使える
<管理者側>
- ログイン
- 　メールアドレスとパスワードでログインできる
- 投稿情報確認
- 　投稿内容を確認し、不適切な投稿には閲覧制限をかけられる
- 　会員側では閲覧制限がかけられた記事は見れない
- 会員情報確認
- 　会員情報を確認できる
- 　不適切な投稿が多い会員を退会処理することができる
- 　会員側では退会した会員はみれない
- ジャンル/タグの追加・編集
- 　投稿時につけるジャンル/タグの追加・削除ができる
- 　タグは編集も可能


## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- Font Awesome
- Bootstrap4.5 サンプルコード Carousel
