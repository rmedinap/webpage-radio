# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

quienes_somos = File.read(File.join(Rails.root, '/public/support/quienes_somos.txt'))
noticia1 = File.read(File.join(Rails.root, '/public/support/noticia-1.txt'))
noticia2 = File.read(File.join(Rails.root, '/public/support/noticia-2.txt'))
noticia3 = File.read(File.join(Rails.root, '/public/support/noticia-3.txt'))

ipsum = File.read(File.join(Rails.root, '/public/support/ipsum.txt'))
nombre = File.read(File.join(Rails.root, '/public/support/nombre.txt'))

Diapositiva.delete_all
Diapositiva.create [{:pie_de_foto => 'Título 1', :diapositiva_picture => File.open(File.join(Rails.root, '/public/img-slider.jpg'))}]
Diapositiva.create [{:pie_de_foto => 'Título 2', :diapositiva_picture => File.open(File.join(Rails.root, '/public/img-slider.jpg'))}]
#
#Diapositiva.create [{:pie_de_foto => 'Programming', :diapositiva_picture => File.open(File.join(Rails.root, '/public/img-slider.jpg'))},
#                {:pie_de_foto => 'Event'},
#                {:pie_de_foto => 'Travel'},
#                {:pie_de_foto => 'Music'},
#                {:pie_de_foto => 'TV'}]

QuienesSomos.delete_all
QuienesSomos.create [{:descripcion => quienes_somos }]

Categoria.delete_all
cate1 = Categoria.create ({:nombre => 'Próximo lanzamiento', :color => '#000000'})
cate2 = Categoria.create ({:nombre => 'Lanzamiento - single', :color => '#542533'})
cate3 = Categoria.create ({:nombre => 'Reseña de disco', :color => '#712121'})
  # categoria has_many noticias
noti1 = cate1.noticias.create ({:titulo => 'Demons: adelanto de próximo disco de The National', :contenido => noticia1, :autor => 'Emilio Legonía'})
noti2 = cate2.noticias.create ({:titulo => 'Kiosko: el regreso de Porter', :contenido => noticia2, :autor => 'Emilio Legonía'})
noti3 = cate3.noticias.create ({:titulo => 'The Strokes: Comedown Machine (2013)', :contenido => noticia3, :autor => 'Emilio Legonía'})

Dia.delete_all
['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'].each do |dia|
  Dia.create ({:nombre => dia})
end


Dj.delete_all
Dj.create [{:nombre => 'Pedro Lopez', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]
Dj.create [{:nombre => 'LuisAlberto Fernandez', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]
Dj.create [{:nombre => 'Horacio Manuel Villamarín', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]
Dj.create [{:nombre => 'Enrique Enriquez', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]



Programa.delete_all
Programa.create [{:titulo => 'Entrevistas a grupos nacionales', :contenido => ipsum}]
Programa.create [{:titulo => 'Indie Dance y Nu Disco', :contenido => ipsum}]
Programa.create [{:titulo => 'Indie Actual', :contenido => ipsum}]
Programa.create [{:titulo => 'Indie Dance y Nu Disco', :contenido => ipsum}]
