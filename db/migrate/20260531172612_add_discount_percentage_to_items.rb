class AddDiscountPercentageToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :discount_percentage, :integer
  end
end
