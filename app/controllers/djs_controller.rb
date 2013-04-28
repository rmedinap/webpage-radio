class DjsController < InheritedResources::Base

  def create
    create! { djs_path }
  end

  def update
    update! { djs_path }
  end

end
