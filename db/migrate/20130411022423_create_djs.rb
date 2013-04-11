class CreateDjs < ActiveRecord::Migration
  def change
    create_table :djs do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
