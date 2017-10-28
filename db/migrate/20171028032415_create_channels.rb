class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :title
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
