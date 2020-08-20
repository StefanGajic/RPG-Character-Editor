class CharacterType < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_many :character_attributes, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  paginates_per 5

end
