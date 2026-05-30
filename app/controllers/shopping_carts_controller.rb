class ShoppingCartsController < ApplicationController
  before_action :authenticate_user! # Solo usuarios registrados tienen carrito
  before_action :set_shopping_cart, only: %i[ show empty ]

  def show
    # CONTROL DE SEGURIDAD: Evita que un usuario vea el carrito de otro cambiando la ID en la URL
    if @shopping_cart.user != current_user
      redirect_to root_path, alert: "No tienes permisos para acceder a este carrito."
    end
  end

  # ACCIÓN PARA VACIAR EL CARRITO
  def empty
    if @shopping_cart.user == current_user
      # Borra las conexiones de los productos con este carrito
      if @shopping_cart.respond_to?(:cart_items)
        @shopping_cart.cart_items.destroy_all
      elsif @shopping_cart.respond_to?(:line_items)
        @shopping_cart.line_items.destroy_all
      else
        @shopping_cart.items.clear
      end
      
      redirect_to shopping_cart_path(@shopping_cart), notice: "El carrito se ha vaciado correctamente."
    else
      redirect_to root_path, alert: "Acción no autorizada."
    end
  end

  def add_item
    @item = Item.find(params[:item_id])
    
    # 1. Buscamos el carrito del usuario actual. Si por alguna razón no tiene uno, se lo creamos al instante.
    @shopping_cart = current_user.shopping_cart || current_user.create_shopping_cart

    # 2. Añadimos el producto a la colección de ítems del carrito
    @shopping_cart.items << @item

    # 3. Redirigimos de vuelta a la página del negocio con un lindo mensaje de éxito
    redirect_back fallback_location: root_path, notice: "¡#{@item.name} se agregó al carrito! 🛒"
  end

  private

  def set_shopping_cart
    @shopping_cart = ShoppingCart.find(params[:id])
  end
end