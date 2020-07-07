class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :character_id
      t.string :name
      t.text :description
      t.string :thumbnail_url
      t.integer :durability
      t.integer :energy
      t.integer :fighting_skills
      t.integer :intelligence
      t.integer :speed
      t.integer :strength

      t.timestamps
    end
  end
end
