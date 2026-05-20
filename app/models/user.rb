class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # 1対Nの関係（UserはたくさんのBookを持つ）
  has_many :books, dependent: :destroy

  # プロフィール画像の紐付け
  has_one_attached :profile_image

  # 【追加】バリデーションルール
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  
  validates :email_address, presence: true, uniqueness: true
end