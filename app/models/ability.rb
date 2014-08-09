class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can :manage, [Comment, Post, Sidebar, StaticPage, Link, VisitorComment, Event]
      can :read, :all
    elsif user.author?
      can :create, [Post, Comment, VisitorComment]
      can :update, [Post, Comment, VisitorComment], :user_id => user.id    
      can :read, [Post, Comment, VisitorComment, Sidebar, StaticPage, Link, Event]        
    elsif user.registered?
      can :create, [Comment, VisitorComment]
      can :update, [Comment, VisitorComment], :user_id => user.id
      can :read, [Post, Comment, VisitorComment, Sidebar, StaticPage, Link, Event]      
    else
      can :read, [Post, Comment, VisitorComment, Sidebar, StaticPage, Link, Event]
    end
  end
end
