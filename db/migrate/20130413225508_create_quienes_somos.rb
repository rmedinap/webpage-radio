class CreateQuienesSomos < ActiveRecord::Migration
  def change
    create_table :quienes_somos do |t|
      t.text :descripcion
      t.string :slug

      t.timestamps
    end
  end
end
