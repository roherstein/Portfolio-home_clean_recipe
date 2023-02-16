class CreateCleaningTools < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaning_tools do |t|

      t.timestamps
    end
  end
end
