class Categoria < ActiveRecord::Base
  attr_accessible :nombre, :color
  has_many :noticias

  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
