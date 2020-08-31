class CharacterAttribute < ApplicationRecord
  belongs_to :character_type, optional: true, inverse_of: :character_attributes
  has_one_attached :icon

  validates_presence_of :character_type

end
