# coding: utf-8
class ContactosController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:new, :create]
  
  def create
    @contacto = Contacto.new(params[:contacto])

    create! do |success, failure|
      success.html do
        ContactosMailer.confirmacion_de_contacto(@contacto).deliver
        ContactosMailer.notificacion_de_contacto(@contacto).deliver

        flash[:notice] = "Tu mensaje fue enviado con exito."
        redirect_to new_contacto_path
      end

      failure.html do
        flash[:notice] = "No se envió el mensaje, corrige los campos y vuelve a intentar."
        render :action => "new"
      end

    end
  end

  protected
    def collection
      @contactos ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
    end
end
