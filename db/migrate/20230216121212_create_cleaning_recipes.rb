class CreateCleaningRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaning_recipes do |t|

      t.timestamps
    end
  end
end
