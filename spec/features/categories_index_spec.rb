require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @customer = FactoryBot.create(:customer)
      @icon = 'fast-food.png'
      @fast_food = Category.create(name: 'Fast Food', icon: @icon, customer: @customer)
      sign_in @customer
      visit categories_path
    end

    it 'will present categories page' do
      expect(page).to have_current_path('/categories')
    end

    it 'will have page content' do
      expect(page).to have_content('Categories')
      expect(page).to have_content('Sign out')
      expect(page).to have_content('Edit profile')
      expect(page).to have_content('Fast Food')
      expect(page).to have_content('$0.00')
      expect(page).to have_content('Add category')
      expect(page).to have_xpath("//img[@alt='Fast Food']")
    end

    it 'will have link to "Add category"' do
      expect(page).to have_link('Add category')
    end

    it 'will not have classes for bootstrap cards' do
      expect(page).not_to have_css('.card-body')
      expect(page).not_to have_css('.card-title')
      expect(page).not_to have_css('.card-text')
    end

    it 'will have bulma classes' do
      expect(page).to have_css('.section')
      expect(page).to have_css('.container')
      expect(page).to have_css('.title')
      expect(page).to have_css('.subtitle')
      expect(page).to have_css('.columns')
      expect(page).to have_css('.column')
      expect(page).to have_css('.media')
      expect(page).to have_css('.image')
      expect(page).to have_css('.has-text-info')
      expect(page).to have_css('.has-text-link-dark')
      expect(page).to have_css('.is-one-fifth')
    end
  end

  describe 'with FactoryBot login' do
    before(:each) do
      @customer = FactoryBot.create(:customer)
      sign_in @customer
      visit new_category_path
    end

    it 'will go to add a new category page when click on button' do
      expect(page).to have_current_path('/categories/new')
    end

    it 'will have new category page content' do
      expect(page).to have_content('Create category')
    end

    it 'will have new category page with button "Save"' do
      expect(page).to have_button('Save')
    end

    it 'will have new Category page with input fields' do
      expect(page).to have_field('Name')
    end

    it 'will have new Category page with bulma form classes' do
      expect(page).to have_css('.field')
      expect(page).to have_css('.label')
      expect(page).to have_css('.control')
    end

    it 'will have new Category page without bootstrap forms classes' do
      expect(page).not_to have_css('.form-group')
      expect(page).not_to have_css('.form-control')
      expect(page).not_to have_css('.form-check-label')
      expect(page).not_to have_css('.form-check-inline')
    end
  end

  describe 'with FactoryBot login' do
    before(:each) do
      @customer = FactoryBot.create(:customer)
      @icon = 'fast-food.png'
      @fast_food = Category.create(name: 'Fast Food', icon: @icon, customer: @customer)
      sign_in @customer
      visit category_deals_path(@fast_food)
    end

    it 'will go to transactions page when click on category name' do
      expect(page).to have_current_path("/categories/#{@fast_food.name.parameterize}/deals")
    end
  end

  describe 'with FactoryBot login' do
    before(:each) do
      @customer = FactoryBot.create(:customer)
      sign_in @customer
      visit edit_customer_registration_path
    end

    it 'will go to edit profile page when click on navbar link' do
      expect(page).to have_current_path('/customers/edit')
    end

    it 'will have edit profile page content' do
      expect(page).to have_content('Edit profile')
      expect(page).to have_content('Unhappy?')
    end

    it 'will have edit profile page with button "Edit profile"' do
      expect(page).to have_button('Edit profile')
    end

    it 'will have edit profile page with input fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_field('Password confirmation')
      expect(page).to have_field('Current password')
    end

    it 'will have edit profile page with bulma form classes' do
      expect(page).to have_css('.field')
      expect(page).to have_css('.label')
      expect(page).to have_css('.control')
    end

    it 'will not have edit profile page with bootstrap form classes' do
      expect(page).not_to have_css('.form-group')
      expect(page).not_to have_css('.form-control')
    end
  end
end
