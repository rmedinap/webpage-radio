# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Diapositiva.delete_all
Diapositiva.create [{:pie_de_foto => 'Programming', :diapositiva_picture => File.open(File.join(Rails.root, '/public/img-slider.jpg'))}]
#
#Diapositiva.create [{:pie_de_foto => 'Programming', :diapositiva_picture => File.open(File.join(Rails.root, '/public/img-slider.jpg'))},
#                {:pie_de_foto => 'Event'},
#                {:pie_de_foto => 'Travel'},
#                {:pie_de_foto => 'Music'},
#                {:pie_de_foto => 'TV'}]
