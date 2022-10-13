require 'rails_helper'

RSpec.describe 'Deals page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @icon = 'fast-food.png'
      @fast_food = Category.create(name: 'Fast Food', icon: @icon, user: @user)
      @pizza_hut = @fast_food.deals.create(name: 'Pizza Hut', amount: 12.5, author: @user)
      @donkin_donuts = @fast_food.deals.create(name: 'Donkin Donuts', amount: 25, author: @user)
    end

    it 'will present transactions page' do
      sign_in @user
      visit "/categories/#{@fast_food.id}/deals"
      expect(current_path).to eq(category_deals_path(@fast_food))
    end

    it 'will have page content' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      expect(page).to have_content('TRANSACTION - Fast Food')
      expect(page).to have_content('Total: $37.50')
      expect(page).to have_content('Pizza Hut')
      expect(page).to have_content('Donkin Donuts')
      expect(page).to have_content('$12.50')
      expect(page).to have_content('$25.00')
      expect(page).to have_content('Add a new transaction')
    end

    it 'will have link to "Add a new transaction"' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      expect(page).to have_link('Add a new transaction')
    end

    it 'will have classes for bootstrap cards' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      expect(page).to have_css('.card')
      expect(page).to have_css('.card-body')
      expect(page).to have_css('.card-title')
      expect(page).to have_css('.card-text')
    end

    it 'will go to add a new transaction page when click on link' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      click_link 'Add a new transaction'
      expect(current_path).to eq(new_category_deal_path(@fast_food))
    end

    it 'will have new transaction page content' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      click_link 'Add a new transaction'
      expect(page).to have_content('ADD A TRANSACTION')
    end

    it 'will have new transaction page with button "Save"' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      click_link 'Add a new transaction'
      expect(page).to have_button('Save')
    end

    it 'will have new transaction page with input fields' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      click_link 'Add a new transaction'
      expect(page).to have_field('Transaction name')
      expect(page).to have_field('Amount')
    end

    it 'will have new transaction page with classes for bootstrap forms' do
      sign_in @user
      visit category_deals_path(@fast_food.id)
      click_link 'Add a new transaction'
      expect(page).to have_css('.form-group')
      expect(page).to have_css('.form-control')
      expect(page).to have_css('.form-check')
      expect(page).to have_css('.form-check-label')
      expect(page).to have_css('.form-check-inline')
    end
  end
end
