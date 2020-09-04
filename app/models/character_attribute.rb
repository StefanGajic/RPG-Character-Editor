# frozen_string_literal: true

# Character Attribute
class CharacterAttribute < ApplicationRecord
  belongs_to :character_type, inverse_of: :character_attributes
  has_one_attached :icon

  validates_presence_of :character_type

  validates :name, presence: true
  validates :value, presence: true
end
