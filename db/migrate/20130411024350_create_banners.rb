class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :pie_de_foto

      t.timestamps
    end
  end
end
