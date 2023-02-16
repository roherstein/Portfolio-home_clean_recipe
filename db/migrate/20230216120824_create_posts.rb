class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :introduction
      t.boolean :is_publish, null: false, default: "FALSE"
      t.timestamps
    end
  end
end
