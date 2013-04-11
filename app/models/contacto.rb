class Contacto < ActiveRecord::Base
  attr_accessible :email, :mensaje, :nombre
end
