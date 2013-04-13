class Diapositiva < ActiveRecord::Base
  attr_accessible :pie_de_foto
  attr_accessible :diapositiva_picture

  has_attached_file :diapositiva_picture, styles:  {
    index: {geometry:  '960x450#'},
    thumbs: {geometry: '96x45#'}
  }

end
