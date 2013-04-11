class AddAttachmentImagenDjToDjs < ActiveRecord::Migration
  def self.up
    change_table :djs do |t|
      t.attachment :imagen_dj
    end
  end

  def self.down
    drop_attached_file :djs, :imagen_dj
  end
end
