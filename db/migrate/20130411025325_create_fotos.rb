class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.integer :noticia_id

      t.timestamps
    end
  end
end
