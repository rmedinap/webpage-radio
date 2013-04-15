class Categoria < ActiveRecord::Base
  attr_accessible :nombre
  has_many :noticias

  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
