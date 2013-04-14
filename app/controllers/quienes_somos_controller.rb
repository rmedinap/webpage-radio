class QuienesSomosController < InheritedResources::Base

  def index
    @quienes_somos_first = QuienesSomos.first
    @dj_list = Dj.all
  end

end
