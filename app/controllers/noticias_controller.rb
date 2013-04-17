# coding: utf-8
class NoticiasController < InheritedResources::Base
  def index
    @categorias = Categoria.all
    @maximo_noticias = Noticia.all.size
  end

 # def create
 #   create!{ categoria_noticia_path(noticia.categoria, noticia) }
 # end
end
