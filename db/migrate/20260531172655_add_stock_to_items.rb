class AddStockToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :stock, :integer
  end
end
