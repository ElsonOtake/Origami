require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @customer = Customer.new(name: 'Name Surname', email: 'category@origami.com', password: 'password')
    @icon = 'origami.png'
    @category = Category.new(name: 'Category name', icon: @icon, customer: @customer)
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

  it 'is not valid without an customer' do
    @category.customer = nil
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
