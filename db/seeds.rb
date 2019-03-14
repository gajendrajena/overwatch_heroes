# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
heroes = JSON.parse(File.read("#{Rails.root}/config/data/heros.json"))

heroes['data'].each do |h|
  hero = {
    id: h['id'],
    name: h['attributes']['name'],
    slug: h['attributes']['slug'],
    image_portrait: h['attributes']['image_portrait'],
    image_splash: h['attributes']['image_splash'],
    image_card_background: h['attributes']['image_card_background']
  }
  Hero.create(hero)
end
puts '*' *  100

