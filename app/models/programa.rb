class Programa < ActiveRecord::Base
  attr_accessible :contenido, :titulo

  belongs_to :dia
end
