class AddAttachmentImagenBannerToBanners < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.attachment :imagen_banner
    end
  end

  def self.down
    drop_attached_file :banners, :imagen_banner
  end
end
