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
Character.destroy_all
Deck.destroy_all
User.destroy_all

PASSWORD = 'supersecret'

super_user = User.create({
  username: 'brandon',
  email: 'js@winterfell.gov',
  password: PASSWORD
})

10.times do 
  u = User.create({
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: PASSWORD
  })
  2.times do
    Deck.create({
      name: Faker::Artist.name,
      user_id: u.id
    })
  end
end

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

cards = Character.all

NUMBER_OF_CARDS_PER_DECK = 5
decks = Deck.all
decks.each do |deck|
  NUMBER_OF_CARDS_PER_DECK.times do
    deck.characters << cards.sample
  end
end

file.close