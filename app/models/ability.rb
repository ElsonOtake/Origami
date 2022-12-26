class Ability
  include CanCan::Ability

  def initialize(customer)
    customer ||= Customer.new

    can :read, Customer
    can :create, Customer
    can(:update, Customer, customer:)
    can(:read, Category, customer:)
    can(:create, Category, customer:)
    can :read, Deal, author: customer
    can :create, Deal, author: customer

    # Define abilities for the customer here. For example:
    #
    #   return unless customer.present?
    #   can :read, :all
    #   return unless customer.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the customer
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the customer can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the customer can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
