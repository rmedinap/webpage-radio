# coding: utf-8
class ProgramasController < InheritedResources::Base

  def create
    create! {programas_path}
  end

  def update
    update! {programas_path}
  end

end
