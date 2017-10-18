class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :content
      t.integer :good_num
      t.integer :user_id

      t.timestamps
    end
  end
end
