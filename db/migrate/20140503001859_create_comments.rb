class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.string :com_user_type, null: false
      t.integer :com_user_id, null: false

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :com_user_id
  end
end
