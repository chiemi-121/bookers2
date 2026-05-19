class AddUserIdToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :user_id, :integer, if_not_exists: true
  end
end
