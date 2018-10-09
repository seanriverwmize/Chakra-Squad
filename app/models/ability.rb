class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    can :read, :all
    if user.present?
      can :manage, Comment, user_id: user.id
    end
    if user.admin?
      can :manage, :all
    end
  end
end
