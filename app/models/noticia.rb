class Noticia < ActiveRecord::Base

  attr_accessible :autor, :contenido, :titulo, :fotos_attributes


  has_many :fotos
  has_many :itunes_players
  has_many :soundclouds
  has_many :videos

  belongs_to :categoria

  extend FriendlyId
  friendly_id :titulo, use: :slugged


  accepts_nested_attributes_for :fotos, :allow_destroy => true
end
