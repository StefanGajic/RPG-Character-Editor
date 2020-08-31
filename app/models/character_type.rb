class CharacterType < ApplicationRecord
  belongs_to :user, optional: true, inverse_of: :character_types
  has_one_attached :avatar
  has_many :character_attributes, dependent: :destroy, inverse_of: :character_type, :autosave => true

  accepts_nested_attributes_for :character_attributes, allow_destroy: true

  validates :name, uniqueness: true, presence: true

  paginates_per 5

end
