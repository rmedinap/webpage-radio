class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :titulo
      t.text :contenido
      t.integer :dia_id

      t.timestamps
    end
  end
end
