class Book < ApplicationRecord
    # 本は一人のユーザー（user）に属している
  belongs_to :user

end
