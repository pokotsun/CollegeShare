class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :major, :string
    add_column :users, :profile_img, :string
    add_column :users, :account_id, :string
  end
end
