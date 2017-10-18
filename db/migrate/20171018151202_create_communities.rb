class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :college_name
      t.string :campus_name
      t.integer :prefecture_id
      t.string :major

      t.timestamps
    end
  end
end
