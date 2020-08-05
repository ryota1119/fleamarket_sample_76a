# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# fleamarket_sample_76a

# DB設計
## ER Diagram
***
![Uploading bf4805b9d6f107f2bc42393c5314cbd0.png…]()

## usersテーブル
***
|Column|Type|Options|
|:-----|---:|:-----:|
|nickname|string|null: false|
|email|string|null: false, unipue: true|
|password|string|null: false, unipue: true|
|password_conform|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|data|null: false,|
### Association
***
- has_many :items, dependent:delete_all
- has_many :chats, dependent:delete_all
- has_many :favorites, dependent:delete_all
- has_one :address, dependent:delete
- has_one :credit_card, dependent:delete