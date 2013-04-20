class Dia < ActiveRecord::Base
  attr_accessible :nombre, :slug

  belongs_to :programa

  extend FriendlyId
  friendly_id :nombre, :use => :slugged
end
