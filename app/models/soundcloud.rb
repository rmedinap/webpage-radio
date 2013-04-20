class Soundcloud < ActiveRecord::Base
  attr_accessible :link
  belongs_to :noticia

  auto_html_for :link do
    soundcloud
  end
end
