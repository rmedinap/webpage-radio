class Auspiciador < ActiveRecord::Base
  attr_accessible :link, :logo

  has_attached_file :logo, :styles => {
    index: {geometry: '150x150#'}
  }
end
