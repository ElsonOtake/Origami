require 'rails_helper'

RSpec.describe Icon, type: :model do
  before(:each) do
    @icon = Icon.new(name: 'Icon name', file_name: 'origami.png')
  end

  it 'is valid with valid attributes' do
    expect(@icon).to be_valid
  end

  it 'is not valid without a name' do
    @icon.name = nil
    expect(@icon).to_not be_valid
  end

  it 'is not valid without a file name' do
    @icon.file_name = nil
    expect(@icon).to_not be_valid
  end

  it 'Name must not be blank' do
    @icon.name = ' '
    expect(@icon).to_not be_valid
  end

  it 'File name must not be blank' do
    @icon.file_name = ' '
    expect(@icon).to_not be_valid
  end
end
