class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :destroy, :edit, :to => :modify #users should be able to edit and destroy their own posts, so create a custom attribute shortcut for this
    alias_action :modify, :to => :manage
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :VIP #ie moderator, called 'VIP' to work with current code
      can :read, :all
      can :manage, Poem
      #can :manage, Comment
    elsif user.has_role? :user #normal user
      can :create, Poem
      #can :create, Comment
      can :modify, Poem, :user_id => user.id #user can only modify their own poems
      #can :modify, Comment, :user_id => user.id
    elsif user.has_role? :banned
      can :read, Poem
      #can :read, Comment
    else #Guest, read-only permissions
      can :read, Poem
      #can :read, Comment
      #add additional models...
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
