class Item < ApplicationRecord
  # Aquí especificamos que 'owner' hace referencia a la clase Business
  belongs_to :owner, class_name: 'Business', foreign_key: 'owner_id'
  
  # Relación con los carritos a través de la tabla intermedia
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  
  # Si estás guardando las categorías como un Array de strings (útil en PostgreSQL)
  serialize :categories, type: Array, coder: JSON
  
  # Esta línea permite adjuntar una imagen
  has_one_attached :photo
end