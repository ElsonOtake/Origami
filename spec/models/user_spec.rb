require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Name Surname', email: 'user@origami.com', password: 'password')
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'Name must not be blank' do
    @user.name = ' '
    expect(@user).to_not be_valid
  end

  it 'Email must not be blank' do
    @user.email = ' '
    expect(@user).to_not be_valid
  end

  it 'Password must not be blank' do
    @user.password = ' '
    expect(@user).to_not be_valid
  end
end
