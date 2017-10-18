class CreateNitifications < ActiveRecord::Migration[5.1]
  def change
    create_table :nitifications do |t|
      t.int :sender_id
      t.int :receiver_id
      t.boolean :confirm_flag

      t.timestamps
    end
  end
end
