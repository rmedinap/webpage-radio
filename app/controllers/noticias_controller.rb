# coding: utf-8
class NoticiasController < InheritedResources::Base
  def index
    @noticias_banda = Categoria.find_by_nombre('Banda de la Semana').noticias.all
   # @noticias_album = Categoria.find_by_nombre('Álbum de la Semana').noticias.all
   # @noticias_resena = Categoria.find_by_nombre('Reseñas').noticias.all
  end
end
