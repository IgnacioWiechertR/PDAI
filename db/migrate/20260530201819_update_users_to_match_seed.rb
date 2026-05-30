class UpdateUsersToMatchSeed < ActiveRecord::Migration[7.1]
  def change
    # 1. Eliminamos las columnas que ya no usamos (ni password en texto plano, ni roles)
    remove_column :users, :password, :string
    remove_column :users, :role, :integer
    remove_column :users, :badges, :integer

    # 2. Agregamos las columnas nuevas que pide tu seed
    add_column :users, :age, :integer
    add_column :users, :comuna, :string

    # 3. Ajustamos el email para que cumpla con los estándares estrictos de Devise
    change_column_default :users, :email, ""
    change_column_null :users, :email, false
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
  end
end