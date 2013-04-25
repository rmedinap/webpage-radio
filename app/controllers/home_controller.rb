# coding: utf-8
class HomeController < ApplicationController
  def index
  
    @categorias = Categoria.limit(3)
    @maximo_noticias = 1
    @auspiciadores = Auspiciador.all
  end
end
