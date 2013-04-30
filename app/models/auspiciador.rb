class Auspiciador < ActiveRecord::Base
  attr_accessible :link, :logo, :lado

  has_attached_file :logo, :styles => {
    index: {geometry: '225x165#'}
  }

  LADOS = ["Izquierdo", "Derecho"]
end
