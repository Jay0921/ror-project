# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user&.role
    when 'super_admin'
      can :manage, :all
    when 'admin'
      can :manage, :all
      cannot :manage, Miscellaneous::RakeTask
    else
      can :read, :all
      cannot :manage, :swagger
    end
  end
end
