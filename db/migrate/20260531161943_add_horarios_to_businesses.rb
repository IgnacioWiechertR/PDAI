class AddHorariosToBusinesses < ActiveRecord::Migration[8.0]
  def change
    add_column :businesses, :horario_inicio, :integer
    add_column :businesses, :horario_termino, :integer
  end
end
