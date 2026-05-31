class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  # Opcional: Esto te permite buscar "quiénes tienen este tag"
  has_many :items, through: :taggings, source: :taggable, source_type: 'Item'
  has_many :businesses, through: :taggings, source: :taggable, source_type: 'Business'
  has_many :users, through: :taggings, source: :taggable, source_type: 'User'
end