# coding: utf-8
class ProgramasController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @dias = Dia.all
  end

end
