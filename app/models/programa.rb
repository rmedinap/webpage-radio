class Programa < ActiveRecord::Base
  attr_accessible :contenido, :titulo

  has_many :dias
end
