class AuspiciadoresController < InheritedResources::Base
  before_filter :authenticate_admin!

  def index
    @auspiciadores_left = Auspiciador.where("lado = ?", "Izquierdo")
    @auspiciadores_right = Auspiciador.where("lado = ?", "Derecho")
  end

  def create
    create! {auspiciadores_path}
  end

  def update
    update! {auspiciadores_path}
  end

end
