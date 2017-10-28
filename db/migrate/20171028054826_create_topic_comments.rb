class CreateTopicComments < ActiveRecord::Migration[5.1]
  def change
    create_table :topic_comments do |t|
      t.string :content
      t.integer :good_num
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
