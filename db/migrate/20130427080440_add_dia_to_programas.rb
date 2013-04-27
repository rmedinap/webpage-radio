class AddDiaToProgramas < ActiveRecord::Migration
  def change
    add_column :programas, :dia, :integer
  end
end
