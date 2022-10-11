require 'rails_helper'

RSpec.describe Deal, type: :model do
  before(:each) do
    @author = User.new(name: 'Name Surname', email: 'deal@origami.com', password: 'password')
    @deal = Deal.new(name: 'Deal name', amount: 25, author: @author)
  end

  it 'is valid with valid attributes' do
    expect(@deal).to be_valid
  end

  it 'is not valid without a name' do
    @deal.name = nil
    expect(@deal).to_not be_valid
  end

  it 'is not valid without an amount' do
    @deal.amount = nil
    expect(@deal).to_not be_valid
  end

  it 'is not valid without an author' do
    @deal.author = nil
    expect(@deal).to_not be_valid
  end

  it 'Name must not be blank' do
    @deal.name = ' '
    expect(@deal).to_not be_valid
  end

  it 'Amount must not be a negative number' do
    @deal.amount = -25
    expect(@deal).to_not be_valid
  end
end
