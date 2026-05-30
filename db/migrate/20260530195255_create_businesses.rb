class CreateBusinesses < ActiveRecord::Migration[8.0]
  def change
    create_table :businesses do |t|
      t.string :username
      t.string :comuna
      t.string :email
      t.string :password_digest
      t.string :category

      t.timestamps
    end
  end
end
