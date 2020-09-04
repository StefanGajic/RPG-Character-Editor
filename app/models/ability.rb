# frozen_string_literal: trueexclude

# Ability class
class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    return unless user.present?

    can :manage, CharacterType, user_id: user.id
    can :manage, CharacterAttribute, character_type: { user_id: user.id }
  end
end
