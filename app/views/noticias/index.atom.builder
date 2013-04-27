atom_feed do |feed|
  feed.title "Stereosonica Radio noticias"
  @noticias.each do |noticia|
    feed.entry noticia do |entry|
      entry.title noticia.titulo
      entry.content noticia.contenido
      entry.author do |author|
        author.name noticia.autor
      end
    end
  end
end
