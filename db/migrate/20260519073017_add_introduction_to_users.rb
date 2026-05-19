class AddIntroductionToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :introduction, :text, if_not_exists: true
  end
end
