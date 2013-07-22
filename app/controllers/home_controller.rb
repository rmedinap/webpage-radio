# coding: utf-8
class HomeController < ApplicationController
  def index

    @categorias = Categoria.all
    @maximo_noticias = 2

    # @auspiciadores_left = Auspiciador.where("lado = ?", "Izquierdo")
    # @auspiciadores_right = Auspiciador.where("lado = ?", "Derecho")
  end
end
