class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 'guest') # guest user (not logged in)

    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can :manage, [Attachment, Comment, Post, Sidebar, Page, Link, VisitorComment, Event, Newsletter, Gallery, Slider]
      can :read, :all
    elsif user.author?
      can :create, [Attachment, Post, Comment, VisitorComment]
      can :update, [Attachment, Post, Comment, VisitorComment], user_id: user.id
      can :read, [Attachment, Post, Comment, VisitorComment, Sidebar, Page, Link, Event]
    elsif user.registered?
      can :create, [Comment, VisitorComment]
      can :update, [Comment, VisitorComment], user_id: user.id
      can :read, [Attachment, Post, Comment, VisitorComment, Sidebar, Page, Link, Event]
    else
      can :read, [Attachment, Post, Comment, VisitorComment, Sidebar, Page, Link, Event]
    end
  end
end
