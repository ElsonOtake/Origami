require 'rails_helper'

RSpec.describe 'Deals page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @customer = FactoryBot.create(:customer)
      @icon = 'fast-food.png'
      @fast_food = Category.create(name: 'Fast Food', icon: @icon, customer: @customer)
      @pizza_hut = @fast_food.deals.create(name: 'Pizza Hut', amount: 12.5, author: @customer)
      @donkin_donuts = @fast_food.deals.create(name: 'Donkin Donuts', amount: 25, author: @customer)
      sign_in @customer
      visit category_deals_path(@fast_food)
    end

    it 'will present transactions page' do
      expect(page).to have_current_path("/categories/#{@fast_food.name.parameterize}/deals")
    end

    it 'will have page content' do
      expect(page).to have_content('Transactions - Fast Food')
      expect(page).to have_content('Total: $37.50')
      expect(page).to have_content('Pizza Hut')
      expect(page).to have_content('Donkin Donuts')
      expect(page).to have_content('$12.50')
      expect(page).to have_content('$25.00')
      expect(page).to have_content('Add transaction')
    end

    it 'will have link to "Add transaction"' do
      expect(page).to have_link('Add transaction')
    end

    it 'will not have classes for bootstrap cards' do
      expect(page).not_to have_css('.card-body')
      expect(page).not_to have_css('.card-title')
      expect(page).not_to have_css('.card-text')
    end

    it 'will have bulma classes' do
      expect(page).to have_css('.section')
      expect(page).to have_css('.container')
      expect(page).to have_css('.columns')
      expect(page).to have_css('.column')
      expect(page).to have_css('.title')
      expect(page).to have_css('.subtitle')
      expect(page).to have_css('.media')
      expect(page).to have_css('.is-one-fifth')
      expect(page).to have_css('.has-text-info')
      expect(page).to have_css('.has-text-warning-dark')
      expect(page).to have_css('.has-text-primary-dark')
    end
  end

  describe 'with FactoryBot login' do
    before(:each) do
      @customer = FactoryBot.create(:customer)
      @icon = 'fast-food.png'
      @fast_food = Category.create(name: 'Fast Food', icon: @icon, customer: @customer)
      sign_in @customer
      visit new_category_deal_path(@fast_food)
    end

    it 'will go to add a new transaction page when click on link' do
      expect(page).to have_current_path("/categories/#{@fast_food.name.parameterize}/deals/new")
    end

    it 'will have new transaction page content' do
      expect(page).to have_content('Create transaction')
    end

    it 'will have new transaction page content' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Amount')
    end

    it 'will have new transaction page with button "Save"' do
      expect(page).to have_button('Save')
    end

    it 'will have new transaction page with input fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Amount')
    end

    it 'will have new transaction page with bulma form classes' do
      expect(page).to have_css('.field')
      expect(page).to have_css('.label')
      expect(page).to have_css('.control')
    end

    it 'will have new transaction page without classes for bootstrap forms' do
      expect(page).not_to have_css('.form-group')
      expect(page).not_to have_css('.form-control')
      expect(page).not_to have_css('.form-check')
      expect(page).not_to have_css('.form-check-label')
      expect(page).not_to have_css('.form-check-inline')
    end
  end
end
