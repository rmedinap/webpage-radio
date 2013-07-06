class CreateDiasProgramasJoinTable < ActiveRecord::Migration
  def up
    create_table :dias_programas, :id => false do |t|
      t.integer :dia_id
      t.integer :programa_id
    end
  end

  def down
    drop_table :dias_programas
  end
end
