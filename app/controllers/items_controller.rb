class ItemsController < ApplicationController
  # 1. Obliga a que solo negocios logueados puedan entrar a estas rutas
  before_action :authenticate_business!
  before_action :set_item, only: %i[ show edit update destroy ]

  def index
    # 2. SEGURIDAD: En vez de Item.all, solo trae los productos de ESTE negocio
    @items = current_business.items
  end

  def show
  end

  def new
    # 3. Construye el ítem amarrado al negocio actual
    @item = current_business.items.new
  end

  def edit
  end

  def create
    @item = current_business.items.new(item_params)

    if @item.save
      redirect_to items_path, notice: "Producto creado con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "Producto actualizado con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Producto eliminado correctamente.", status: :see_other
  end

  private

  def set_item
    # 4. EL ESCUDO DEFINITIVO: Al buscar dentro de 'current_business.items',
    # si un negocio intenta poner en la URL la ID del producto de otra tienda,
    # Rails arrojará un error 404 (Not Found) automáticamente por seguridad.
    @item = current_business.items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to items_path, alert: "No tienes autorización "
  end

  def item_params
  # Agregamos :photo a la lista de permitidos
    params.require(:item).permit(:name, :description, :cost, :photo, categories: [])
  end
end