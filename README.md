# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
  DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|
### Association
- has_many  :messages
- has_many  :comments

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string|
### Association
- belongs_to :user
- has_many   :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|string|
|user_id|integer|
|message_id|integer|
### Association
- belongs_to :user
- belongs_to :message

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
