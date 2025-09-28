require 'rails_helper'

RSpec.describe Deal, type: :model do
  before(:each) do
    @yoga = 'yoga.png'
    @entertainment = 'entertainment.png'
    @camping = 'camping.png'
    @author = Customer.new(name: 'Name Surname', email: 'deal@origami.com', password: 'password')
    @deal = Deal.new(name: 'Deal name', amount: 25, author: @author)
  end

  it 'the join table has size 1' do
    @deal.categories.new(name: 'Yoga', customer: @author, icon: @yoga)
    expect(@deal.categories.size).to be(1)
  end

  it 'the join table has size 2' do
    @deal.categories.new(name: 'Yoga', customer: @author, icon: @yoga)
    @deal.categories.new(name: 'Entertainment', customer: @author, icon: @entertainment)
    expect(@deal.categories.size).to be(2)
  end

  it 'the join table has size 3' do
    @deal.categories.new(name: 'Yoga', customer: @author, icon: @yoga)
    @deal.categories.new(name: 'Entertainment', customer: @author, icon: @entertainment)
    camping = Category.new(name: 'Camping', customer: @author, icon: @camping)
    @deal.categories.push(camping)
    expect(@deal.categories.size).to be(3)
  end

  it 'the join table has size 1' do
    yoga = Category.new(name: 'Yoga', customer: @author, icon: @yoga)
    yoga.deals.new(name: 'Mr. Jones', amount: 100.5, author: @author)
    expect(yoga.deals.size).to be(1)
  end

  it 'the join table has size 2' do
    yoga = Category.new(name: 'Yoga', customer: @author, icon: @yoga)
    yoga.deals.new(name: 'Mr. Jones', amount: 100.5, author: @author)
    tennis_shop = Deal.new(name: 'Tennis shop', amount: 34.56, author: @author)
    yoga.deals.push(tennis_shop)
    expect(yoga.deals.size).to be(2)
  end
end
