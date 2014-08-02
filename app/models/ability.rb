class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can :manage, [Comment, Post, Sidebar, StaticPage, Link]
    elsif user.author?
      can :manage, [Comment, Post]
      can :read, [Sidebar, StaticPage, Link]
    elsif user.registered?
      can :read, [Comment, Post, Sidebar, StaticPage, Link]
      can [:show, :create, :update], Comment
    else
      can :read, [Comment, Post, Sidebar, StaticPage, Link]
  end
end
