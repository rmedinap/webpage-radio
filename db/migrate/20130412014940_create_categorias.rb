class CreateCategorias < ActiveRecord::Migration
  def change
    create_table :categorias do |t|
      t.string :nombre
      t.string :slug

      t.timestamps
    end
    add_index :categorias, :slug, unique: true
  end
end
