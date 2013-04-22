class Ability
  include CanCan::Ability

  def initialize(user)
    unless user
      can :read, :all
      can :manage, Comment
    else 
      can :manage, [User, Blog, Post, Comment, Subscription]
      can :access, :ckeditor
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile
      # using case to leave room for future roles/resources
      case user.role
      when 'admin'
        can :manage, :all #will be able to assign roles later
      end
    end
  end
end
