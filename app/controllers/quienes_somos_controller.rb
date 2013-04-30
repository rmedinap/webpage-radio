class QuienesSomosController < InheritedResources::Base

  before_filter :authenticate_admin!, :except => [:index]

  def index
    @quienes_somos_first = QuienesSomos.first
    @dj_list = Dj.all
  end

end
