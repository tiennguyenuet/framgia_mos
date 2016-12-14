class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new
    if namespace == "Admin" && user.admin?
      can :manage, :all
    elsif namespace == ""
      can :read, :all
    end
    can :manage, Post, user_id: user.id
  end
end
