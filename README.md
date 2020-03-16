# README

<h1 align="center">Doc-style</h1>

## 機能:  資料の投稿、保存、拡大、検索、Bookmark、ユーザー登録
### 渉外業務でかさばる資料をすっきりさせて効率の良い営業を展開させましょう。
### Bookmark機能を用いて顧客に合わせた資料を事前に用意することで迅速な資料展開が可能です。
### 店舗の窓口に備えることで窓口係のサポートが見込めます。
### 純粋に日記などに使うのも良いと思います。
### ※ユーザー名は仮名です

<img width="1440" alt="スクリーンショット 2020-03-16 0 04 10" src="https://user-images.githubusercontent.com/59730607/76719823-4b97c800-677e-11ea-894e-8a4e4d83be3d.png">

## 制作に至った経緯
### 　営業活動で大変だったのは多くの資料（年金、投資信託、申込書、etc...）を持っていたため、探すのに時間が取られる場合があるのと、加えて営業カバンが非常に重くなるという点でした。お客様との会話では様々なニーズの原石が転がっておりますがそれをしっかり逃さないためにも素早い資料の提示は必要不可欠でした。
### 　このDoc-styleはそうした問題点を解消するために作成しました。私が前職で考えていた業務の効率を助けるためのアプリができたのはとても嬉しく思います。

## 意識した点
* ### Bookmarkのアイコンを星形からラベル型に変更。
  * ### 保険商品は保険金支払い実績などの資料があり、被災者の方々の心情を察するに星形のBookmarkでは配慮に欠けると判断しました。
* ### ログイン名の上側のアイコンは企業様のアイコンとホームページを想定して作成
  * ### 新規開拓において自分の会社の紹介に素早く対応できるため。よってこのアプリで既存、新規どちらの営業にも使えます。（現在はGoogleに遷移します。）
* ### シンプルかつ、わかりやすいように
  * ### あらゆる世代やPC熟練度の違いがあるはずですので、なるべくわかりやすく、一つの画面で情報が得られるように考えました。
    * ### placeholderに説明文を入れてみました。
    * ### スクリーンショットの方法など記載。

## 使用例
  * ### IPアドレス  
    * ### http://52.193.233.35/
  * ### Basic認証 
    * ### ID：admin
    * ### Pass：0053
 * ### テスト用アカウント(田中 次郎)
    * ### email：aaa@gmail.com
    * ### password：aaaaaa
* ### ※投稿する画像の容量によっては投稿できない場合があるかもしれません。
* ### ※あくまでも個人アプリです。決して動作確認以外の目的で利用しないでください。万が一機密情報の漏洩などの損失が発生してもこちらは一切責任を負いません。
![6358874a14cc1db21216678f614e09de](https://user-images.githubusercontent.com/59730607/76725395-67589980-6791-11ea-8a93-5273c1bf0133.gif)

## 今後、追加実装するならば
### pdfのアップロード機能
### 　今度は企業様へ目を向けます。理由は経費節減のためです。きっかけは会議資料を紙ベースでやっていたこと、非常に多くの印刷をするにもかかわらず、利用するのはその会議のみであったからです。この問題が解決できれば、紙、プリンターの費用、ホッチキスの費用、資料作りに携わる時間、シュレッダーやゴミ袋の費用などの節減が見込めるはずです。

***
<h2 align="center">献立お助け機能</h2>

## 機能:  ボタンを押すたびに料理名がランダムで出現
### 献立を考える時間の短縮   画面の右端3本バーのアイコンから「献立アプリ起動」を選択
### ※料理は開発者の独断と偏見です。あしからず。

## 制作に至った経緯
### 献立を考えながら買い物する時間がもったいないと考えていたため。

## 意識した点
* ### 表示サイズを資料閲覧範囲に合わせました。（画像の通り）
* ### 黄色の色合いを多く採用し、仕事のふとした息抜き、気持ちの切り替えのきっかけ作りに。

<img width="1440" alt="スクリーンショット 2020-03-16 0 06 31" src="https://user-images.githubusercontent.com/59730607/76719880-797d0c80-677e-11ea-9bae-46e991dfd23b.png">

## 使用例

![1eff6faaa03e446e27ab233e2d752b2b](https://user-images.githubusercontent.com/59730607/76724675-21023b00-678f-11ea-9c8d-4f497b1ffe1e.gif)

# DB設計
## bookmarksテーブル 

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null: false|
|document_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :document

## documentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null: false|
|title|string|null: false|
|comment|string||
|image|text||

### Association
- belongs_to :user
- has_many :bookmarks

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, add_index|
|email|string|null: false, unique: true, add_index|
|password|string|null: false|

### Association
- has_many :documents
- has_many :bookmarks
- has_many :bookmark_documents, through: :bookmarks

# Author
<li>
  <a href="https://github.com/naoya-miyashita198805">Github</a>
</li>
<li>
  <a href="https://twitter.com/Naoya_198805" rel="nofollw">Twitter</a>
</li>
<li>
  <a href="https://qiita.com/Naoya_198805" rel="nofollw">Qiita</a>
</li>
<li>
  <a href="https://naoya-198805.hatenablog.com/" rel="nofollw">はてなブログ</a>
</li>