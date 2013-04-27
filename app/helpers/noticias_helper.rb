module NoticiasHelper
  def fecha_noticia(date)
    # date.strftime("%m, %b %H:%M %Y")
    distance_of_time_in_words(date, Time.now)
  end
end
