module NoticiasHelper
  def fecha_noticia(date)
    date.strftime("%m, %b %H:%M %Y")
  end
end
