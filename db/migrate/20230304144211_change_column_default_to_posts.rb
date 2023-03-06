class ChangeColumnDefaultToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :is_publish, from: false, to: "true"
  end
end
