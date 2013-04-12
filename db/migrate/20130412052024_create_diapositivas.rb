class CreateDiapositivas < ActiveRecord::Migration
  def change
    create_table :diapositivas do |t|
      t.string :pie_de_foto

      t.timestamps
    end
  end
end
