# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kane     | string | null: false |
| first_name_kane    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchase_logs


# itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | text       | null: false                    |
| item_description      | integer    | null: false                    |
| item_detail_category  | integer    | null: false                    |
| item_detail_condition | integer    | null: false                    |
| delivery_charge       | integer    | null: false                    |
| delivery_user_area    | integer    | null: false                    |
| delivery_time         | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_logs


# purchase_logsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses


## addressesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| receiver_postal_code  | integer    | null: false                    |
| receiver_prefectures  | integer    | null: false                    |
| receiver_cities       | text       | null: false                    |
| receiver_address      | text       | null: false                    |
| receiver_phone_number | integer    | null: false                    |
| purchase_log          | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_log