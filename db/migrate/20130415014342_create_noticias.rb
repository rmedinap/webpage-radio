class CreateNoticias < ActiveRecord::Migration
  def change
    create_table :noticias do |t|
      t.string :titulo
      t.text :contenido
      t.string :autor
      t.integer :categoria_id
      t.string :slug

      t.timestamps
    end
  end
end
