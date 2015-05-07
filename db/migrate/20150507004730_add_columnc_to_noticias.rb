class AddColumncToNoticias < ActiveRecord::Migration
  def change
    add_column :noticias, :active, :boolean
  end
end
