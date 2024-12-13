## Users

| Column                | Type       | Options                     |
|-----------------------|------------|-----------------------------|
| nickname              | string     | null: false                 |
| email                 | string     | null: false, unique: true   |
| password              | string     | null: false                 |
| last_name             | string     | null: false                 |
| first_name            | string     | null: false                 |
| last_name_kana        | string     | null: false                 |
| first_name_kana       | string     | null: false                 |
| birthday              | string     | null: false                 |


### Association
has_many :items
has_many :orders


## Items

| Column               | Type       | Options                      |
|----------------------|------------|------------------------------|
| user_id              | reference  | foreign_key: true            |
| item_name            | string     | null: false                  |
| item_info            | string     | null: false                  |
| category_id          | integer    | null: false                  |
| condition_id         | integer    | null: false                  |
| prefecture_id        | integer    | null: false                  |
| shipping_id          | integer    | null: false                  |
| shipping_day_id      | integer    | null: false                  |
| price                | string     | null: false                  |


### Association
belongs_to :user
has_one :order


## Orders

| Column               | Type       | Options                      |
|----------------------|------------|------------------------------|
| user_id              | reference  | foreign_key: true            |
| item_id              | reference  | foreign_key: true            |


### Association
belongs_to :user
belongs_to :item
has_one :address

## Addresses

| Column               | Type       | Options                      |
|----------------------|------------|------------------------------|
| order_id             | reference  | foreign_key: true            |
| postal_code          | string     | null: false                  |
| prefecture_id        | integer    | null: false                  |
| city                 | string     | null: false                  |
| house_number         | string     | null: false                  |
| building             | string     | null: false                  |
| phone                | string     | null: false                  |


### Association
belongs_to :order