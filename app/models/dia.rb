class Dia < ActiveRecord::Base
  attr_accessible :nombre, :slug

  has_many :programas

  extend FriendlyId
  friendly_id :nombre, :use => :slugged
end
