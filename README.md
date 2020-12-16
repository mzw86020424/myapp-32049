# DB設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### 画像はActiveStorageを使用

### Association

- has_many :posts
- has_many :zines


## zines テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| release | boolean    | default: false, null: false    |
| year    | string     | null: false                    |
| month   | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :posts


## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| url     | text       | null: false                    |
| year    | string     | null: false                    |
| month   | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
| zine_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :zine