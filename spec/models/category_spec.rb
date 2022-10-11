require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.new(name: 'Name Surname', email: 'category@origami.com', password: 'password')
    @icon = Icon.new(name: 'Icon name', file_name: 'origami.png')
    @category = Category.new(name: 'Category name', icon: @icon, user: @user)
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without an icon' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without an user' do
    @category.user = nil
    expect(@category).to_not be_valid
  end

  it 'Name must not be blank' do
    @category.name = ' '
    expect(@category).to_not be_valid
  end

  it 'has the "Category name" as name' do
    expect(@category.name).to eq('Category name')
  end
end
