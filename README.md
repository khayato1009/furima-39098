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
## usersテーブル

|Column            |Type    |Options                   |
|----------------- |------- |------------------------- |
| nickname         | string | null:false, unique: true |
| password         | string | null:false               |
| email            | string | null:false               |
| confirm password | string | null:false               | 
| date of birth    | string | null:false               |
| name             | string | null:false               |
| name kana        | string | null:false               |

##アソシエーション
has_many :items
has_many :buys

## itemsテーブル

|Column            |Type    |Options                            |
|----------------- |----------- |------------------------------ |
| user             | references | null:false, foreign_key: true |
| password         | string     | null:false                    |
| email            | string     | null:false                    |
| confirm password | string     | null:false                    | 
| date of birth    | string     | null:false                    |
| name             | string     | null:false                    |
| name kana        | string     | null:false                    |

##アソシエーション
has_many :buys
belongs_to :user

## buysテーブル

|Column            |Type    |Options                            |
|----------------- |----------- |------------------------------ |
| user             | references | null:false, foreign_key: true |
| address          | string     | null:false                    |

##アソシエーション
has_many :items
belongs_to :user
belongs_to :address

## addressesテーブル
|Column            |Type    |Options                            |
|----------------- |----------- |------------------------------ |
| municipality     | string     | null:false,                   |
| prefectures      | string     | null:false                    |
| address          | string     | null:false                    |
| post_code        | string     | null:false                    | 
| telephone_number | string     | null:false                    |
| building_name    | string     | null:false                    |

##アソシエーション
belongs_to :buy