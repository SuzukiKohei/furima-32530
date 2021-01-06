# README

## users_table

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name_kanji_sei     | string | null: false |
| name_kanji_mei     | string | null: false |
| name_kana_sei      | string | null: false |
| name_kana_mei      | string | null: false |
| birthday           | date   | null: false |

### Association

has_many :items
has_many :purchase_history

## items_table

| Column                 | Type       | Options     |
|------------------------|------------|-------------|
| name                   | string     | null: false |
| explanation            | text       | null: false |
| show_category_id       | integer    | null: false |
| show_state_id          | integer    | null: false |
| shipping_fee_bearer_id | integer    | null: false |
| shipping_prefecture_id | integer    | null: false |
| shipping_day_id        | integer    | null: false |
| price                  | integer    | null: false |
| user                   | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one    :purchase_history

## purchase_histories_table

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one    :address

## addresses_table

| Column                 | Type       | Options     |
|------------------------|------------|-------------|
| postal_code            | string     | null: false |
| shipping_prefecture_id | integer    | null: false |
| city                   | string     | null: false |
| address_line           | string     | null: false |
| building               | string     |             |
| phone_number           | string     | null: false |
| purchase_history       | references | null: false, foreign_key: true |

### Association

belongs_to :purchase_history