module Tandem
  module ApplicationControllerConfig
    def current_user
      puts 'here:user'
      User.find(session['user_id']) unless session['user_id'].blank?
    end
  end

  module AbilityConfig
    def initialize(user)
      puts 'here:ability'
      can :manage, :all
      #can :manage, Page
      #can :read, Page

      #can :manage, Content
      #can :update, Content
      #can :read, Content

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
end
