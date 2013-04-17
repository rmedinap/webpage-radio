class Contacto < ActiveRecord::Base
  attr_accessible :email, :mensaje, :nombre
  validates :nombre, :email, :mensaje, :presence => true
end
