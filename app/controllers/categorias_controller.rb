class CategoriasController < InheritedResources::Base



  def show
    @categoria = Categoria.find(params[:id])
    @posts = @categoria.posts.all
  end
end
