class AddAttachmentDiapositivaPictureToDiapositivas < ActiveRecord::Migration
  def self.up
    change_table :diapositivas do |t|
      t.attachment :diapositiva_picture
    end
  end

  def self.down
    drop_attached_file :diapositivas, :diapositiva_picture
  end
end
