# README

# Name  
![logo](https://user-images.githubusercontent.com/61217608/79215713-f3400d00-7e86-11ea-9662-73eb5761ab9f.png)

# Suteru
![24a8b25eb7b538af75e0a6ba10c1b927](https://user-images.githubusercontent.com/61217608/79213718-9a6f7500-7e84-11ea-909e-965f5aeaf945.jpg)

# Overview  
- Q＆Aサービス（画像+文字）

# Description 
- 海外の人が、自分の名前を日本人に日本語で命名してもらえるサービス。

# Test account  
- E-mail  : yoshi@gmail.com 
- Password: yoshi123

# Features
- 一覧表示、詳細表示の機能
- 投稿、編集、削除機能
- コメント機能
- 画像ファイルのアップロード機能（メッセージ投稿時、コメント投稿時）
- 投稿検索機能
- ページネーション機能
- 管理ユーザー登録機能
- 管理ユーザーログイン機能
- 単体テスト機能（ユーザー登録）
- 統合テスト機能（ルートアクセス→ログイン処理→投稿）

# Requirement
- Ruby, 2.5.1 | Rails, 5.2.3 | mysql2, 0.5.3 | Git | GitHub |AWS(S3) | heroku | carrierwave |
 mini_magick | kaminari | devise | pry-rails | rspec-rails | factory_bot_rails | capybara 2.15

# Author  
- Github: https://github.com/Yoshi-Kyoto5/

# Database creation 
## users-table  
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|
### Association 
- has_many  :messages
- has_many  :comments

## messages-table 
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string|
### Association 
- belongs_to :user
- has_many   :comments

## comments-table 
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|string|
|user_id|integer|
|message_id|integer|
### Association 
- belongs_to :user
- belongs_to :message