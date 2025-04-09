# README

---
# テーブル設計

---
## users テーブル

| Column            	| Type   	| Options     |
| ------------------	| -----------	| ----------- |
| nickname          	| string	| null: false |
| email             	| string| null: false, unique: true |
| encrypted_password	| string	| null: false |
| last-name		| string	| null: false |
| first-name		| string	| null: false |
| last-name-kana	| string	| null: false |
| first-name-kana	| string	| null: false |
| birth-date		| date		| null: false |

### Association

- has_many :items
- has_many :orders

---
## items テーブル

| Column		| Type	| Options    	|
| ------ 		| -----	| ----------	|
| item-name		|string	| null: false	|
| item-info		|text	| null: false	|
| item-image		|string	| null: false	|
| item-category	|string	| null: false	|
| item-shipping-fee-status| string| null: false|
| item-prefecture	|string	| null: false	|
| item-scheduled-delivery| string| null: false|
| item-price		|integer| null: false	|
| item-sales-status	|boolean| null: false	|
| user_id		| references | null: false, foreign_key: true |


### Association

- has_one :order
- belongs_to :user

---
## shipping_addresses テーブル

| Column	| Type	| Options    	|
| ------ 	| -----	| ----------	|
| postal-code	|string	| null: false	|
| prefecture	|string	| null: false	|
| city		|string	| null: false	|
| address	|string	| null: false	|
| building	|string	| 		|
| phone-number	|string	| null: false	|
| order_id	| references | null: false, foreign_key: true |


### Association

- belongs_to :order

---
## orders テーブル

| Column 	| Type       | Options                        |
| ------ 	| ---------- | ------------------------------ |
| user_id	| references | null: false, foreign_key: true |
| item_id	| references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address
