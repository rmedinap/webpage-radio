class Soundcloud < ActiveRecord::Base
  attr_accessible :link
  belongs_to :noticia
end
