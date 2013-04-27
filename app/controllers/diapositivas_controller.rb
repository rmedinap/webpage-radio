class DiapositivasController < InheritedResources::Base

  def create
    create! { diapositivas_path }
  end

  def update
    update! { diapositivas_path }
  end

end
