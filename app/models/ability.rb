class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can :manage, [Comment, Post, Sidebar, StaticPage, Link, VisitorComment]
      can :read, :all
    elsif user.author?
      can [:create, :update], [Post, Comment, VisitorComment], :user_id => user.id    
      can :read, [Post, Comment, VisitorComment, Sidebar, StaticPage, Link]        
    elsif user.registered?
      can [:create, :update], Comment, :user_id => user.id
      can [:create, :update], VisitorComment, :email => user.email
      can :read, [Post, Comment, VisitorComment, Sidebar, StaticPage, Link]      
    else
      can :read, [Post, Comment, VisitorComment, Sidebar, StaticPage, Link]
      can :create, VisitorComment
    end
  end
end
