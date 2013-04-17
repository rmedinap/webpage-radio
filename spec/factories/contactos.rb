require 'faker'

FactoryGirl.define do
  factory :contacto do
    nombre { Faker::Name.name }
    email { Faker::Internet.email }
    mensaje { Faker::Lorem.paragraph }
  end
end
