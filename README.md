# README

## usersテーブル

| Column          | Type       | Options               |
| --------------- | ---------- | --------------------- |
| nickname        | string     | null,false            |
| email           | string     | unique: true          |
| first_name      | string     | null,false            |
| last_name       | string     | null,false            |
| first_name_kana | string     | null,false            |
| last_name_kana  | string     | null,false            |
| birth_date      | date       | null,false            |

### Association
has_many :items
has_many :history

## itemsテーブル

| Column          | Type       | Options               |
| --------------- | ---------- | --------------------- |
| users           | references | foreign_key: true     |
| name            | string     | null,false            |
| price           | string     | null,false            |
| image           | text       | null,false            |
| region          | string     | null,false            |
| text            | string     | null,false            |
| situation_id    | integer    | null,false            |
| category _id    | integer    | null,false            |
| condition_id    | integer    | null,false            |
| shippingfee_id  | integer    | null,false            |
| shippingday_id  | integer    | null,false            |

### Association
belongs_to :user
has_one :history

## histories テーブル

| Column          | Type       | Options               |
| --------------- | ---------- | --------------------- |
| users           | references | foreign_key: true     |
| items           | references | foreign_key: true     |

### Association
has_many :users
has_one :item
has_one :shipping_address

## shipping_address テーブル

| Column          | Type       | Options               |
| --------------- | ---------- | --------------------- |
| history         | references | foreign_key: true     |
| postal_code     | string     | null,false            |
| region          | integer    | null,false            |
| city            | string     | null,false            |
| address         | string     | null,false            |
| building        | string     |                       |
| phone           | string     | null,false            |

### Association
belongs_to :history