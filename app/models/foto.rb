class Foto < ActiveRecord::Base
  attr_accessible :imagen_foto
  
  belongs_to :noticia

  has_attached_file :imagen_foto, :styles => {
    index: {geometry: '504x400#'},
    show: {geometry: '940>x400'}
  }
end
