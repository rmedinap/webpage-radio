class CreateItunesPlayers < ActiveRecord::Migration
  def change
    create_table :itunes_players do |t|
      t.text :embed
      t.integer :noticia_id

      t.timestamps
    end
  end
end
