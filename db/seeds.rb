# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
file = File.open "#{__dir__}/../data/page_0.json";

# data is an array of all our characters
data = JSON.load file

data.each { |character|
  Character.create(
    character_id: character['id'],
    name: character['name'],
    description: character['description'],
    thumbnail_url: "#{character['thumbnail']['path']}.#{character['thumbnail']['extension']}",
    durability: character['attributes']['durability'],
    energy: character['attributes']['energy'],
    fighting_skills: character['attributes']['fighting skills'],
    intelligence: character['attributes']['intelligence'],
    speed: character['attributes']['speed'],
    strength: character['attributes']['strength']
  )
}


file.close