class RadioOnlineController < ApplicationController
  def index
    @auspiciadores = Auspiciador.all

    respond_to do |format|
      format.html { render layout: 'layout_radio'}  
    end
  end
end
