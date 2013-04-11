class CreateItunesPlayers < ActiveRecord::Migration
  def change
    create_table :itunes_players do |t|
      t.text :embed

      t.timestamps
    end
  end
end
