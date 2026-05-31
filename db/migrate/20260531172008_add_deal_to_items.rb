class AddDealToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :deal, :boolean
  end
end
