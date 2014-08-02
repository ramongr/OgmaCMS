class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.role == "super_admin"
      can :manage, :all
    elsif user.role == "admin"
      can :manage, [Comment, Post, Sidebar, StaticPage, Link]
    elsif user.role == "author"
      can :manage, [Comment, Post]
      can :read, [Sidebar, StaticPage, Link]
    elsif user.role == "registered"
      can :read, [Comment, Post, Sidebar, StaticPage, Link]
      can [:show, :create, :update], Comment
    else
      can :read, [Comment, Post, Sidebar, StaticPage, Link]
  end
end
