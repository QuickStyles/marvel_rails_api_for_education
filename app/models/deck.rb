class Deck < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many(
    :cards,
    {
      class_name: 'Card',
      join_table: 'deck_cards',
      association_foreign_key: 'card_id',
      foreign_key: 'deck_id'
    }
  )
  # with the above association we get a few helper queries
  # d = Deck.new
  # d.characters = Characters.all
end