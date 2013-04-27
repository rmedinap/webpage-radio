# coding = utf-8
class Programa < ActiveRecord::Base
  attr_accessible :contenido, :titulo, :dia

  DIAS = %w(domingo lunes martes miércoles jueves viernes sábado)

end
