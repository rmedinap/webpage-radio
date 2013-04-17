class AddAttachmentImagenFotoToFotos < ActiveRecord::Migration
  def self.up
    change_table :fotos do |t|
      t.attachment :imagen_foto
      
    end
  end

  def self.down
    drop_attached_file :fotos, :imagen_foto
  end
end
