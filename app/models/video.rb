class Video < ActiveRecord::Base
  attr_accessible :link
  belongs_to :post
end
