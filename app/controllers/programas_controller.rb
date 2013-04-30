# coding: utf-8
class ProgramasController < InheritedResources::Base
  before_filter :authenticate_admin!, :except => [:index]

  def create
    create! {programas_path}
  end

  def update
    update! {programas_path}
  end

end
