class CreateNitifications < ActiveRecord::Migration[5.1]
  def change
    create_table :nitifications do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :confirm_flag

      t.timestamps
    end
  end
end
