# coding: utf-8
class ProgramasController < InheritedResources::Base
  # before_filter :authenticate_user!, :except => [:index, :show]

  def create
    create! {programas_path}
  end

  def update
    update! {programas_path}
  end

  def destroy
    destroy! {programas_path}
  end

end
