class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 'guest') # guest user (not logged in)

    if user.super_admin?
      can :manage, :all
      cannot :update, Comment do |comment|
        comment.try(:created_by_id) != user.id
      end

    elsif user.admin?
      can :manage, [Attachment, Post, Sidebar, Page, Link, VisitorComment, Event, Newsletter, Gallery, Slider]
      can :create, Comment
      can :update, Comment, created_by_id: user.id
      can :destroy, Comment do |comment|
        !comment.try(:created_by).super_admin?
      end
      can :read, :all

    elsif user.author?
      can :create, [Attachment, Post, Comment, VisitorComment]
      can :update, [Attachment, Post, Comment, VisitorComment], created_by_id: user.id
      can :read, [Attachment, Post, Comment, VisitorComment, Sidebar, Page, Link, Event]
    
    elsif user.registered?
      can :create, [Comment, VisitorComment]
      can :update, [Comment, VisitorComment], created_by_id: user.id
      can :read, [Attachment, Post, Comment, VisitorComment, Sidebar, Page, Link, Event]
    
    else
      can :create, VisitorComment
      can :read, [Attachment, Post, Comment, VisitorComment, Sidebar, Page, Link, Event]
    end  
  end

end
