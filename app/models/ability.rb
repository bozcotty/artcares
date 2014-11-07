class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member
      can :manage, Campaign, user_id: user.id
      can :manage, Artwork, user_id: user.id
    end

    can :manage, :all if user.role? :admin
  end
end
