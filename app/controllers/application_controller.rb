class ApplicationController < ActionController::Base
  protect_from_forgery

  def bodyid 
    @bodyid = params[:controller].parameterize
  end
  
  def bodyclass
    @action = params[:action].parameterize
  
    if params[:controller] == 'home'
      @front = 'front'
    else
      @front = 'not-front'
    end
  
    if current_admin
      @admin = 'logged-in'
    else
      @admin = 'not-logged-in'
    end
  
    @bodyclass = @action + ' ' + @front + ' ' + @admin
  end

  def diapositivas
    @diapositivas = Diapositiva.all
  end

  helper_method :bodyid
  helper_method :bodyclass
  helper_method :diapositivas
end
