# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :trades_as_user1, class_name: 'Trade', foreign_key: 'user1_id'
- has_many :trades_as_user2, class_name: 'Trade', foreign_key: 'user2_id'

## items テーブル

| Column             | Type       | Options        |
| ------------------ | ---------- | -------------- |
| title              | string     | null: false    |
| description        | text       | null: false    |
| category_id        | integer    | null: false    |
| condition_id       | integer    | null: false    |
| delivery_id        | integer    | null: false    |
| address_id         | integer    | null: false    |
| day_id             | integer    | null: false    |
| price              | integer    | null: false    |
| user               | references | null: false, foreign_key: true |
| tradeable          | boolean    | null: false, default: true |

### Association

- belongs_to :user
- has_one :order
- has_many :trades_as_item1, class_name: 'Trade', foreign_key: 'item1_id'
- has_many :trades_as_item2, class_name: 'Trade', foreign_key: 'item2_id'

## shippings テーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false  |
| order              | references | null: false, foreign_key: true |
| address_id         | integer    | null: false  |
| city               | string     | null: false  |
| street             | string     | null: false  |
| building           | string     |              |
| phone              | string     | null: false  |

### Association

- belongs_to :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

## trades テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item1_id           | references | null: false, foreign_key: { to_table: :items } |
| item2_id           | references | null: false, foreign_key: { to_table: :items } |
| user1_id           | references | null: false, foreign_key: { to_table: :users } |
| user2_id           | references | null: false, foreign_key: { to_table: :users } |
| status             | string     | null: false, default: 'pending' |

### Association

- belongs_to :item1, class_name: 'Item'
- belongs_to :item2, class_name: 'Item'
- belongs_to :user1, class_name: 'User'
- belongs_to :user2, class_name: 'User'