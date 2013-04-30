class CreateAuspiciadores < ActiveRecord::Migration
  def change
    create_table :auspiciadores do |t|
      t.string :link
      t.string :lado

      t.timestamps
    end
  end
end
