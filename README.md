# アプリケーション名
GEKKAN MYSCRAP（月刊マイスクラップ）
<br>
<br>

# アプリケーション概要
これは、気に入ったページを集めてスクラップブックを作成するアプリケーションです。  
オリジナルのスクラップブックを、できるだけユーザーの手間をかけず、手軽に作成してもらうことを目的としています。
<br>
<br>

# URL	
https://my-app-32049.herokuapp.com/
<br>
<br>

# テスト用アカウント	
- nickname：`taro`
- email：`taro@test`
- password：`tarotaro`
<br>
<br>

# 利用方法
- 気に入った投稿・ニュース・動画などの様々なページを「SCRAP!」ボタン一つで保存できます。
- 保存したページは、「POST（リンク付きサムネイル画像）」としてTOPページに自動で追加されていきます。
- POSTの削除や並べ替えも、クリックやドラッグ&ドロップで簡単に実行できます。
- POSTの集まりは「SCRAP」として月別にアーカイブされ、いつでも閲覧ができます。
- SCRAPごとに公開/非公開を設定し、全ユーザーが閲覧可能な公開SCRAP一覧に掲載することができます。
<br>
<br>

# 目指した課題解決
### ターゲットとして仮定したペルソナ
- ２０代後半女性
- 大手〜中規模程度の広告代理店で営業職
- 趣味は海外ドラマ、映画鑑賞、サウナ巡り、自転車、フェス
- 一つを深掘りするより、いろんなことに幅広く興味がある性格
### 想定される課題
1. いろいろなお気に入りページをまとめたいが、プラットフォームやSNSを跨ってしまうのが面倒
2. 時期によっていろいろな方向に興味・趣味趣向が変化していく様子を残したい
3. 通勤中・移動中・就寝前など思いついたらいつでも気軽に残したい
4. 自分の興味・関心度合いの優先順位を視覚的につけたい
### 各課題を解決するための実装内容
1. プラットフォームなどに関わらず、お気に入りのページを１つのビューでまとめて閲覧できる機能
2. 保存したページが、自動で月別に分けてアーカイブされていく機能
3. タグづけやタイトル付け、ジャンル分けなどの面倒な手続きなしで、直感的に保存できる機能
4. ドラッグ&ドロップで手軽にページをカスタマイズできる機能
<br>
<br>

# 要件定義
| 機能 | 目的 | 詳細 | ストーリー(ユースケース) |
| ------- | ---------- | ------------------------------ |--------------------------- |
| ポスト機能 | 気になったニュース・呟き・動画・商品など、いろいろなページを手軽に保存したい | 片手スマホで手軽に保存が完了する機能 |気になったページを、1.URLをコピーする 2.入力欄にペーストする 3.Enter（またはボタン押下） だけで最短で保存（できれば非同期で） |
| ポスト一覧機能 | 様々な気になる動画・記事・投稿を一覧したい | ポストしたリンクがサムネイル画像で一覧表示される。pinterest、tmblrをスクラップブック的にしたようなビューをイメージ | トップページ=一覧画面（今月のSCRAP）。縦スクロールでスクラップブックを読むようにポストを閲覧。クリックすると別タブでリンク先へジャンプする |
| 月別アーカイブ機能 | ポストしたお気に入りページを月別にまとめることで、その当時の自分の興味関心や世相・トレンドを視覚的に残したい | 月刊雑誌のような体で、SCRAPとしてアーカイブを一覧表示　例）2020年12月号 | TOPページのメニューに月別アーカイブ一覧があり、そこから飛べる |
| ユーザー管理機能 | ログインした特定のユーザーにポストや月別アーカイブを紐づけたい | インスタやツイッターなどのSNSとは異なり、ベースはあくまで自分だけが見る用のスクラップブック。ログインユーザーだけが投稿し、自分の投稿を閲覧できる仕様 |アカウント作成必須の仕様。アクセス後は必ずログインページにとび、アカウントのないユーザーは新規登録ページに移動する |
| SCRAP（アーカイブ）の公開機能 | 他人の興味関心も、時間軸で視覚的に見たい | 公開SCRAPのページがあり、ログインしていれば誰でも閲覧できる | 月別アーカイブしたSCRAPは、公開・非公開の設定が可能。公開にした物は一般公開ページに表示 |
| 並べ替え機能 | お気に入りページを、スクラップブックのように自分の関心度合いによって手軽に入れ替えたい | ドラッグ&ドロップで、ポスト一覧の順番を入れ替えることができる | ポストの一部または全体をドラッグして、並び替えができる。並び替えた順番は非同期で保存される |
| ライク機能 | 公開SCRAPの中から、好きな物をお気に入りに入れ、いつでも見られるようにしたい | 気に入った公開SCRAPにライクをつけられる | 公開CSRAPにはライクボタンがある。ライクしたSCRAPはお気に入りSCRAPページにストックされる |
| ソート・検索機能 | 目当ての公開SCRAPを見つけやすくしたい | 新着順・ライク数順で公開SCRAPを並べ替えたり、月別・ユーザー名で絞った検索もできる | 公開CSRAPに、検索ボックスとプルダウンで選べるソート機能がある |
<br>
<br>

# 実装済み機能説明
## ユーザー登録
全てのユーザーは自動でログインページに移動します。初めてのユーザーは新規登録ページに移動してユーザー登録をします。  
その時点で自動的にその月のSCRAPが作成され、POSTが投稿されるまではチュートリアル画面が表示されます。  

***PC操作画面***  
![1 sign_up_pc](https://user-images.githubusercontent.com/72555480/103011628-98b29100-457d-11eb-830c-fa8e861b6f04.gif)  

***スマホ操作画面***  
![1 sign_up_sm](https://user-images.githubusercontent.com/72555480/103012084-5dfd2880-457e-11eb-8793-ec56d966fb9b.gif)

## 新規ポスト/ポスト一覧表示
共通ヘッダーのURL欄にURLを貼り付け「SCRAP!」ボタンを押すだけで、投稿が完了します。
投稿したポストはスクラップブックのように、トップ画面（今月のSCRAP）に一覧表示されます。
***PC操作画面***  
![2 post_pc](https://user-images.githubusercontent.com/72555480/103012095-65243680-457e-11eb-9b7f-d782085dc865.gif)
***スマホ操作画面***  
![2 post_sm](https://user-images.githubusercontent.com/72555480/103012120-6ead9e80-457e-11eb-9714-fa29814380e7.gif)
## ポスト並び替え/削除
投稿したポストは、右上の「しおり」をドラッグ&ドロップすることで、並び替えができます。  
また、右下の「ゴミ箱」をクリックすると、SCRAPからすぐに削除ができます。
***PC操作画面***  
![3 drag drop_pc](https://user-images.githubusercontent.com/72555480/103012138-7705d980-457e-11eb-9c93-371cf8844f0a.gif)
***スマホ操作画面***  
![3 drag drop_sm](https://user-images.githubusercontent.com/72555480/103012154-7cfbba80-457e-11eb-9a80-574185394385.gif)
## 月別SCRAP閲覧
投稿した日時を元に、SCRAPは月別にアーカイブされていきます。  
ヘッダーのプルダウンから、アーカイブしたSCRAPを見にいくことができます。
***PC操作画面***  
![4 archive_pc](https://user-images.githubusercontent.com/72555480/103012499-0f03c300-457f-11eb-9cf2-1c3657056cff.gif)
***スマホ操作画面***  
![4 archive_sm](https://user-images.githubusercontent.com/72555480/103012588-2773dd80-457f-11eb-863d-4da969bb8648.gif)

## 公開・非公開設定公開SCRAP一覧
ユーザーは、自分のSCRAPの公開/非公開を選択できます。  
公開を選んだSCRAPは、全ユーザーが閲覧できる公開SCRAP一覧に表示されます。
公開SCRAPが、各月でユーザーごとに一覧表示されています。  
クリックすると、それぞれのSCRAPの中身を見ることができます。  
ユーザー本人ではない場合、公開/非公開設定機能・ポスト並び替え機能・ポスト削除機能は非表示となります。
***PC操作画面***  
![5 private_pc](https://user-images.githubusercontent.com/72555480/103012616-30fd4580-457f-11eb-9673-0b8536d9dbb4.gif)
***スマホ操作画面***  
![5 private_sm](https://user-images.githubusercontent.com/72555480/103012633-378bbd00-457f-11eb-8611-f4353e4c46d1.gif)


<br>
<br>

# 実装予定の機能
要件に記載したうちの下記２点、2020/12/23現在未実装です。
- ライク機能
- ソート・検索機能
<br>
<br>

# ローカルでの動作に必要なライブラリ・外部API・gemとその導入方法
### pry-rails (0.3.9)
- 導入方法：gemfileに記述済みなので、ターミナルでbundle installを実行
### rubocop (1.6.1)
- 導入方法：
1. gemfileに記述済みなので、ターミナルでbundle installを実行
2. ターミナルでtouch .rubocop.ymlを実行
### JQuery (3.5.1)
- 導入方法：ターミナルでyarn add jqueryを実行
### Bootstrap (4.5.3) 
- 導入方法：ターミナルでyarn add bootstrapを実行
### popper.js (1.16.1)
- 導入方法：ターミナルでyarn add popperを実行
### devise (4.7.3)
- 導入方法：
1. gemfileに記述済みなので、ターミナルでbundle installを実行
2. ターミナルでrails g devise:installを実行
### ImageMagick
- 導入方法：ターミナルでbrew install imagemagickを実行
### mini_magick (4.11.0)
- 導入方法：gemfileに記述済みなので、ターミナルでbundle installを実行
### image_processing (1.12.1)
- 導入方法：gemfileに記述済みなので、ターミナルでbundle installを実行
### activestorage (6.0.3.4) 
- 導入方法：Railsに統合済みなので、ターミナルでrails active_storage:installを実行
### thumbalizr (1.0.1)
- 導入方法：
1. [オフィシャルページ](https://www.thumbalizr.com/)でアカウントを作成
2. MY_KEYとMY_SECRETを取得し、

`/Users/mizusawayuta/projects/myapp-32049/config/initializers/thumbalizr.rb`

のなかに

```ThumbalizrClient.config("MY_KEY", "MY_SECRET")```

のように記述する

### rspec-rails (4.0.0)
- 導入方法：gemfileに記述済みなので、ターミナルでbundle installを実行
### factory_bot (6.1.0)
- 導入方法：gemfileに記述済みなので、ターミナルでbundle installを実行
### Faker (2.15.1)
- 導入方法：gemfileに記述済みなので、ターミナルでbundle installを実行

<br>
<br>

# データベース設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

*※画像はActiveStorageを使用*

### Association

- has_many :posts
- has_many :zines


## zines テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| private | boolean    | default: true, null: false    |
| year    | string     | null: false                    |
| month   | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :posts


## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| url     | text       | null: false                    |
| year    | string     | null: false                    |
| month   | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
| zine_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :zine