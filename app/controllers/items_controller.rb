class ItemsController < ApplicationController
  # 1. Obliga a que solo negocios logueados puedan entrar a estas rutas
  before_action :authenticate_business!
  before_action :set_item, only: %i[ show edit update destroy ]

  def index
    # Bloqueamos el index redirigiendo directo a la tienda del negocio
    redirect_to business_path(current_business)
  end

  def show
    # Bloqueamos el show redirigiendo directo a la tienda del negocio
    redirect_to business_path(current_business)
  end

  def new
    # Construye el ítem amarrado al negocio actual
    @item = current_business.items.new
  end

  def edit
  end

  def create
    @item = current_business.items.new(item_params)

    if @item.save
      # REDIRECCIÓN CAMBIADA: Ahora va a la vista de la tienda
      redirect_to business_path(current_business), notice: "Producto creado con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      # REDIRECCIÓN CAMBIADA: Ahora va a la vista de la tienda
      redirect_to business_path(current_business), notice: "Producto actualizado con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    # REDIRECCIÓN CAMBIADA: Ahora va a la vista de la tienda
    redirect_to business_path(current_business), notice: "Producto eliminado correctamente.", status: :see_other
  end

  private

  def set_item
    # EL ESCUDO DEFINITIVO
    @item = current_business.items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Si intentan buscar un producto que no es suyo, también los devuelve a su tienda
    redirect_to business_path(current_business), alert: "No tienes autorización."
  end

  def item_params
    permitted = params.require(:item).permit(:name, :description, :cost, :photo, :deal, :discount_percentage, :stock, tag_ids: [])
    permitted[:tag_ids] = permitted[:tag_ids].compact_blank if permitted[:tag_ids]
    permitted
  end
end