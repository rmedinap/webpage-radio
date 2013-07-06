# coding = utf-8
class Programa < ActiveRecord::Base
  attr_accessible :contenido, :titulo

  has_and_belongs_to_many :dias

  def agregado_en?(dia)
    self.dias.include?(dia)
  end

  def dias_libre
    Dia.find(:all) - self.dias
  end

end
