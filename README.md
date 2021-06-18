# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kane     | string | null: false               |
| first_name_kane    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_logs


# itemsテーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| description              | text       | null: false                    |
| detail_category_id       | integer    | null: false                    |
| detail_condition_id      | integer    | null: false                    |
| delivery_charge_id       | integer    | null: false                    |
| user_area_id             | integer    | null: false                    |
| delivery_time_id         | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_log


# purchase_logsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| receiver_postal_code   | string     | null: false                    |
| user_area_id           | integer    | null: false                    |
| receiver_cities        | string     | null: false                    |
| receiver_address       | string     | null: false                    |
| receiver_building_name | string     |                                |
| receiver_phone_number  | string     | null: false                    |
| purchase_log           | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_log