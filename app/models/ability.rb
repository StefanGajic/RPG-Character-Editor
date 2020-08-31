# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.present?
      can [:new, :create, :read, :edit, :update, :destroy], CharacterType, user_id: user.id
    end

    if user.present?
      can [:create, :update, :destroy], CharacterAttribute, :character_type => { user_id: user.id }
    end

  end
end
