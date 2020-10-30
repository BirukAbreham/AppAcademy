class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :artwork_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :comments, [:user_id, :artwork_id]
  end
end
