# frozen_string_literal: true

# Create Character Attributes
class CreateCharacterAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :character_attributes do |t|
      t.references :character_type, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
