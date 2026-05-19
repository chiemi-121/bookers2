# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  
  has_many :books, dependent: :destroy
  has_many :sessions, dependent: :destroy
  has_many :books, dependent: :destroy
  # 追記：プロフィール画像を1枚紐付ける（Active Storageの機能）
  has_one_attached :profile_image
 
  validates :email_address, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  # 追記：Bookers2の要件（自己紹介は最大50文字まで）
  validates :introduction, length: { maximum: 50 }

end