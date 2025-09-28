require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:each) do
    @customer = Customer.new(name: 'Name Surname', email: 'customer@origami.com', password: 'password')
  end

  it 'is valid with valid attributes' do
    expect(@customer).to be_valid
  end

  it 'is not valid without a name' do
    @customer.name = nil
    expect(@customer).to_not be_valid
  end

  it 'is not valid without an email' do
    @customer.email = nil
    expect(@customer).to_not be_valid
  end

  it 'is not valid without a password' do
    @customer.password = nil
    expect(@customer).to_not be_valid
  end

  it 'Name must not be blank' do
    @customer.name = ' '
    expect(@customer).to_not be_valid
  end

  it 'Email must not be blank' do
    @customer.email = ' '
    expect(@customer).to_not be_valid
  end

  it 'Password must not be blank' do
    @customer.password = ' '
    expect(@customer).to_not be_valid
  end
end
