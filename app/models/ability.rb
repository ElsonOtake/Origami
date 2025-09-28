class Ability
  include CanCan::Ability

  def initialize(customer)
    return unless customer.present?

    can :read, Customer
    can :create, Customer
    can(:update, Customer, customer:)
    can(:read, Category, customer:)
    can(:create, Category, customer:)
    can :read, Deal, author: customer
    can :create, Deal, author: customer
  end
end
