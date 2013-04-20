class CreateDias < ActiveRecord::Migration
  def change
    create_table :dias do |t|
      t.string :nombre
      t.string :slug

      t.timestamps
    end
  end
end
