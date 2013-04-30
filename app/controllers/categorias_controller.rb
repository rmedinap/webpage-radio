class CategoriasController < InheritedResources::Base
  before_filter :authenticate_admin!

  def update
    update! {categorias_path}
  end

  def create
    create!{categorias_path}
  end

end
