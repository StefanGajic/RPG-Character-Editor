class CharacterAttribute < ApplicationRecord
  belongs_to :character_type
  has_one_attached :icon

end
