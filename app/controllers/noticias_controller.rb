# coding: utf-8
class NoticiasController < InheritedResources::Base

  before_filter :authenticate_admin!, :except => [:index, :show]

  def index
    @categorias = Categoria.all
    @maximo_noticias = Noticia.all.size
    @noticias = Noticia.all
  end

end
