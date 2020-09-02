# frozen_string_literal: true

# Character Type
class CharacterType < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_many :character_attributes, dependent: :destroy, inverse_of: :character_type, autosave: true

  accepts_nested_attributes_for :character_attributes, allow_destroy: true

  validates :name, uniqueness: true, presence: true

  paginates_per 5
end
