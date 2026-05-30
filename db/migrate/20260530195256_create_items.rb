class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :photo
      t.string :name
      t.text :description
      t.text :categories
      t.integer :cost
      t.references :owner, null: false, foreign_key: { to_table: :businesses }

      t.timestamps
    end
  end
end
