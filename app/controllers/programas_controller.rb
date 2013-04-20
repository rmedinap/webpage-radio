# coding: utf-8
class ProgramasController < InheritedResources::Base
  # before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @dias = Dia.all
  end

  def new
    @dia = Dia.find(params[:dia_id])
    @programa = Programa.new
  end

  def create
    @dia = Dia.find(params[:dia_id])
    @programa = @dia.programas.build(params[:programa])
    if @programa.save
      redirect_to programas_path
    else
      redirect_to programas_path
    end
  end

  def update
    update!{programas_path}
  end

  def destroy
    destroy!{programas_path}
  end


end
