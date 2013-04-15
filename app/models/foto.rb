class Foto < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :noticia

  has_attached_file :imagen_foto, :styles => {
    index: {geometry: '40x40#'}
  }
end
