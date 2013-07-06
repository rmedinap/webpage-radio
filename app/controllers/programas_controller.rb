# coding: utf-8
class ProgramasController < InheritedResources::Base
  before_filter :authenticate_admin!, :except => [:index]

  def index
    @programas = Programa.all
    @dias = Dia.all
  end

  def create
    create! { dias_programa_path(@programa) }
  end

  def update
    update! { lista_programas_path }
  end

  def destroy
    destroy! { lista_programas_path }
  end

  def edit
    @programa = Programa.find(params[:id])
    @dias = @programa.dias
  end

  def lista
    @programas = Programa.all
  end

  def dias
    @programa = Programa.find(params[:id])
    @dias = @programa.dias
  end

  def agregar_dia
    @programa = Programa.find(params[:id])
    @dia = Dia.find(params[:dia])
    unless @programa.agregado_en?(@dia)
      @programa.dias << @dia
      flash[:notice] = 'día agregado'
    else
      flash[:notice] = 'día ya esta agregado'
    end
    redirect_to :action => :edit, :id => @programa
  end

  def eliminar_dia
    @programa = Programa.find(params[:id])

    dia_ids = params[:dias]

    unless dia_ids.blank?
      dia_ids.each do |dia_id|
        dia = Dia.find(dia_id)
        if @programa.agregado_en?(dia)
          logger.info "Eliminando programas del día #{dia.id}"
          @programa.dias.delete(dia)
          flash[:notice] = 'Días eliminado'
        end
      end
    end
    redirect_to :action => :edit, :id => @programa
  end

end
