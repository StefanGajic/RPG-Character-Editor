class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.present?
      can [:manage], CharacterType, user_id: user.id
      can [:create, :update, :destroy], CharacterAttribute, :character_type => { user_id: user.id }
    end
  end
end
