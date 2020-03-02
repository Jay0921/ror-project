# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user&.role
    when 'admin'
      can :manage, :all
    else
      can :read, :all
      cannot :manage, :swagger
    end
  end
end
