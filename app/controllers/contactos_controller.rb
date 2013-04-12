class ContactosController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:new, :create]
end
