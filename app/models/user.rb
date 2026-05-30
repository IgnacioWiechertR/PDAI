class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :shopping_cart, dependent: :destroy

  # Esto asegura que apenas se registre, se cree su carrito vacío:
  after_create :create_automatic_shopping_cart

  validates :username, presence: true, uniqueness: true

  private

  def create_automatic_shopping_cart
    create_shopping_cart
  end
end