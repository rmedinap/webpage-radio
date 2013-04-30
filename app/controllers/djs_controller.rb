class DjsController < InheritedResources::Base

  before_filter :authenticate_admin!

  def create
    create! { djs_path }
  end

  def update
    update! { djs_path }
  end

end
