class CreateCleaningTools < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaning_tools do |t|
      t.integer :post_id, null: false
      t.string :cleaning_tool_name, null: false
      t.timestamps
    end
  end
end
