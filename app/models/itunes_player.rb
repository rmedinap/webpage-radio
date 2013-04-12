class ItunesPlayer < ActiveRecord::Base
  attr_accessible :embed
  belongs_to :post
end
