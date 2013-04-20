class CreateSoundclouds < ActiveRecord::Migration
  def change
    create_table :soundclouds do |t|
      t.string :link
      t.integer :noticia_id

      t.timestamps
    end
  end
end
