class Dia < ActiveRecord::Base
  attr_accessible :nombre

  has_and_belongs_to_many :programas

end
