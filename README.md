# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| email               | string | null: false, unique: true | 
| password            | string | null: false               |
| nickname            | string | null: false, unique: true |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_reading | string | null: false               |
| first_name_reading  | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product         | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| shipping_charge | integer    | null: false                    |
| area            | integer    | null: false                    |
| days            | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :purchase

## orders

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone         | string     | null: false |

## Association
-belongs_to :purchase

## purchase
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

## Association

-belongs_to :user
-belongs_to :order
-belongs_to :item