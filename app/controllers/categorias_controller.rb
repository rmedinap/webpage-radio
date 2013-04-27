class CategoriasController < InheritedResources::Base

  def update
    update! {categorias_path}
  end

  def create
    create!{categorias_path}
  end

end
