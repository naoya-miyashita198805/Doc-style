# README

<h1 align="center">Doc-style</h1>

## 機能:  資料の投稿、拡大、保存、検索、BookMark、ユーザー登録
### ※ユーザー名は仮名です

<img width="1440" alt="スクリーンショット 2020-02-29 17 56 36" src="https://user-images.githubusercontent.com/59730607/75604531-ece71300-5b1c-11ea-8c19-54aed38ad8b3.png">


<h2 align="center">献立お助けアプリ</h2>

## 機能:  ボタンを押すたびに料理名がランダムで出現　
### 献立を考える時間の短縮   画面の右端3本バーのアイコンから「献立アプリ起動」を選択
### ※料理は開発者の独断と偏見です。あしからず。

<img width="100%" alt="スクリーンショット 2020-02-29 16 40 33" src="https://user-images.githubusercontent.com/59730607/75603520-69282900-5b12-11ea-9d7c-8d13f39ed329.png">

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
|user_id|integer||
|title|string||
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