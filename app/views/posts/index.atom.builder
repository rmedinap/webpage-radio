atom_feed do |feed|
  feed.title "Stereosonica Radio noticias"
  feed.updated @posts.maximum(:updated_at)
  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.titulo
      entry.content post.contenido
      entry.author do |author|
        author.name post.autor
      end
    end
  end
end
