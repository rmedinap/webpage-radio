# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

quienes_somos = File.read(File.join(Rails.root, '/public/support/quienes_somos.txt'))

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

Dj.delete_all
Dj.create [{:nombre => 'Pedro Lopez', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]
Dj.create [{:nombre => 'LuisAlberto Fernandez', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]
Dj.create [{:nombre => 'Horacio Manuel Villamarín', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]
Dj.create [{:nombre => 'Enrique Enriquez', :imagen_dj => File.open(File.join(Rails.root, '/public/support/dj-pic.jpg'))}]
