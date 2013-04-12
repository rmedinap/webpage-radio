class Post < ActiveRecord::Base
  attr_accessible :contenido, :titulo
  has_many :fotos
  has_many :itunes_players
  has_many :soundclouds
  has_many :videos

  belongs_to :categoria

  extend FriendlyId
  friendly_id :titulo, use: :slugged
end
