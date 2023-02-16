class CreateCleaningRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaning_recipes do |t|
      t.integer :post_id, null: false
      t.text :cleaning_recipe, null: false
      t.timestamps
    end
  end
end
