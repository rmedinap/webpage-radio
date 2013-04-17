class CategoriasController < InheritedResources::Base



  def show
    @categoria = Categoria.find(params[:id])
    @noticias = @categoria.noticias.all
  end
end
