# coding: utf-8
class HomeController < ApplicationController
  def index
    @diapositivas = Diapositiva.all
  
    @categorias = Categoria.limit(3)
    @maximo_noticias = 1
  end
end
