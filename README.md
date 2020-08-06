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
***
## ER Diagram
![Uploading 153081739e4e6a6d1dbe19faf84fae11.png…]()
***

## Usersテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
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
|birthday|data|null: false|
### Association
- has_many :items, dependent:delete_all
- has_many :chats, dependent:delete_all
- has_many :items, through: :favorites
- has_many :favorites
- has_one :address, dependent:delete
- has_one :credit_card, dependent:delete
- has_many :sell_items, class_name: 'Item', foreign_key: seller_id
- has_many :buy_items, class_name: 'Item', foreign_key: buyer_id
***

## Itemsテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|string|null: false|
|description|text|null: false|
|brand|string|null: false|
|condition_id|references|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|send_price_id|references|null: false, foreign_key: true|
|ship_from_id|references|null: false, foreign_key: true|
|ship_day_id|references|null: false, foreign_key: true|
|price|intger|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- has_many :images, dependent:delete_all
- has_many :chats, dependent:delete_all
- has_many :users, through: :favorites
- has_many :favorites
- belongs_to :user
- belongs_to :ship_form
- belongs_to :status
- belongs_to :send_price
- belongs_to :ship_from
- belongs_to :ship_day
- belongs_to :category
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
***

## Addressesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|posta_code|string|null: false|
|prefecturs|string|null: false|
|municipalities|string|null: false|
|block_number|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
***

### Credit_cardsテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
***

### Faviritesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|user_id|references|null: false,foregin_key: true|
|item_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
- belongs_to :item
***

### Chatsテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|text|text|null :false|
|user_id|references|null: false,foregin_key: true|
|item_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
- belongs_to :item
***

### Ship_fromテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|string|null :false|
|item_id|references|null: false,foregin_key: true|
### Association
- has_many :items
***

### Statusテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|status|string|null :false|
|item_id|references|null: false,foregin_key: true|
### Association
- has_many :items
***

### Send_priceテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|price|string|null :false|
|item_id|references|null: false,foregin_key: true|
### Association
- has_many :items
***

### Ship_fromテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|string|null :false|
|item_id|references|null: false,foregin_key: true|
### Association
- has_many :items
***

### Ship_dayテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|dates|string|null :false|
|item_id|references|null: false,foregin_key: true|
### Association
- has_many :items
***

### Categoriesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|string|null :false|
|item_id|references|null: false,foregin_key: true|
### Association
- has_many :items
***