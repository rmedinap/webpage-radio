class Video < ActiveRecord::Base
  attr_accessible :link
  belongs_to :noticia

  auto_html_for :link do
    youtube(:width => 940, :height => 529)
    vimeo(:width => 940, :height => 529)
  end
end
