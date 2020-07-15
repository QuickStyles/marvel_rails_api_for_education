class Character < ApplicationRecord

  has_and_belongs_to_many(
    :decks,
    {
      class_name: 'Deck',
      join_table: 'deck_characters',
      association_foreign_key: 'deck_id',
      foreign_key: 'character_id'
    }
  )
end
