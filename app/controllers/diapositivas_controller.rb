class DiapositivasController < InheritedResources::Base

  before_filter :authenticate_admin!

  def create
    create! { diapositivas_path }
  end

  def update
    update! { diapositivas_path }
  end

end
