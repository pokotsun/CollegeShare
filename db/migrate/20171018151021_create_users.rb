class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :profile_img
      t.string :major

      t.timestamps
    end
  end
end
