# coding: utf-8
class HomeController < ApplicationController
  def index

    @categorias = Categoria.limit(3)
    @maximo_noticias = 1

    # @auspiciadores_left = Auspiciador.where("lado = ?", "Izquierdo")
    # @auspiciadores_right = Auspiciador.where("lado = ?", "Derecho")
  end
end
