class Foto < ActiveRecord::Base
  attr_accessible :imagen_foto
  
  belongs_to :noticia

  has_attached_file :imagen_foto, :styles => {
    index: {geometry: '40x40#'},
    show: {geometry: '960>x400'}
  }
end
