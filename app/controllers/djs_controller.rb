class DjsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index]

end
