class Book < ApplicationRecord
    # 本は一人のユーザー（user）に属している
  belongs_to :user
    # 【追加】バリデーションルール
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
