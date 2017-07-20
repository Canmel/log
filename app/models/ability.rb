class Ability
  include CanCan::Ability

  def initialize(user)
    no_role

    if user.has_role? :admin
      can :manage, :all
    end

  end

  private

  def no_role
    can :manage, HomeController
  end
end
