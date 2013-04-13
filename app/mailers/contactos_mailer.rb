class ContactosMailer < ActionMailer::Base
  default :from => "info@stereosonicaradio.com"

  def confirmacion_de_contacto(contacto)
    @contacto = contacto
    mail(:to => "info@stereosonicaradio.com", :subject => "Mensaje desde la web")
  end

  def notificacion_de_contacto(contacto)
    @contacto = contacto
    mail(:to => contacto.email, :reply_to => contacto.email, :subject => "Mensaje Enviado Stereosonica Radio")
  end
end
