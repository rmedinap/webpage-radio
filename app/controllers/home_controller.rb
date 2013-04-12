class HomeController < ApplicationController
  def index
    @diapositivas = Diapositiva.all
  end
end
