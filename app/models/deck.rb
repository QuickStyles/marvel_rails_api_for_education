class Deck < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many(
    :characters,
    {
      class_name: 'Character',
      join_table: 'deck_characters',
      association_foreign_key: 'character_id',
      foreign_key: 'deck_id'
    }
  )
end