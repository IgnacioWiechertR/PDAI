# app/models/shopping_cart.rb
class ShoppingCart < ApplicationRecord
  belongs_to :user
  
  # Relación muchos a muchos para poder hacer: items: [item1, item2]
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
end