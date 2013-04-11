class AddAttachmentLogoToAuspiciadores < ActiveRecord::Migration
  def self.up
    change_table :auspiciadores do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :auspiciadores, :logo
  end
end
