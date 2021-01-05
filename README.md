# README

## users_table

| Column      | Type   | Options     |
|-------------|--------|-------------|
| email       | string | null: false |
| password    | string | null: false |
| nickname    | string | null: false |
| name_kanji  | string | null: false |
| name_kana   | string | null: false |
| birthday    | string | null: false |

### Association

has_many :items
has_many :comments
has_many :purchase_history

## items_table

| Column              | Type       | Options     |
|---------------------|------------|-------------|
| name                | string     | null: false |
| explanation         | text       | null: false |
| show_category       | string     | null: false |
| show_state          | string     | null: false |
| shipping_fee_bearer | string     | null: false |
| shipping_prefecture | string     | null: false |
| price               | string     | null: false |
| user                | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_many   :comments
has_one    :purchase_history

## purchase_histories_table

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
belongs_to :address

## addresses_table

| Column       | Type       | Options     |
|--------------|------------|-------------|
| postal_code  | string     | null: false |
| state        | string     | null: false |
| city         | string     | null: false |
| address_line | string     | null: false |
| building     | string     |             |
| phone_number | string     | null: false |
| price        | string     | null: false |
| purchase_history | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
belongs_to :purchase_history

## comments_table

| Column | Type   | Options     |
|--------|--------|-------------|
| text   | string | null: false |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item