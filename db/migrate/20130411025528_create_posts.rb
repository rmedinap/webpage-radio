class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.text :contenido
      t.integer :categoria_id
      t.string :slug

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
