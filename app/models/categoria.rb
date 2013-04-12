class Categoria < ActiveRecord::Base
  attr_accessible :nombre
  has_many :posts

  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
