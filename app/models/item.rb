class Item < ApplicationRecord
  # Aquí especificamos que 'owner' hace referencia a la clase Business
  belongs_to :owner, class_name: 'Business', foreign_key: 'owner_id'
  
  # Relación con los carritos a través de la tabla intermedia
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
  
  # Si estás guardando las categorías como un Array de strings (útil en PostgreSQL)
  serialize :categories, type: Array, coder: JSON
  
  # Esta línea permite adjuntar una imagen
  has_one_attached :photo

  scope :vigentes, -> {
    # Obtenemos la hora actual en Santiago de Chile (entero de 0 a 23)
    hora_actual = Time.current.in_time_zone("Santiago").hour

    joins(:owner).where(
      "items.deal = ? OR (items.deal = ? AND businesses.horario_termino > ?)",
      false, true, hora_actual
    )
  }
end