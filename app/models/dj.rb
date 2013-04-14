class Dj < ActiveRecord::Base
  attr_accessible :nombre, :imagen_dj

  has_attached_file :imagen_dj, styles: {
    index: {geometry: '190x190'}
  }  
end
