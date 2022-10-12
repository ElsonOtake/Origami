require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @icon = Icon.create(name: 'fast food', file_name: 'fast-food.png')
      @fast_food = Category.create(name: 'Fast Food', icon: @icon, user: @user)
    end

    it 'will present categories page' do
      sign_in @user
      visit '/categories'
      expect(current_path).to eq(categories_path)
    end

    it 'will have page content' do
      sign_in @user
      visit categories_path
      expect(page).to have_content('CATEGORIES')
      expect(page).to have_content('Sign out')
      expect(page).to have_content('Edit profile')
      expect(page).to have_content('Fast Food')
      expect(page).to have_content('$0.00')
      expect(page).to have_content('Add a new category')
      expect(page).to have_xpath("//img[@alt='fast food']")
    end

    it 'will have link to "Add Category"' do
      sign_in @user
      visit categories_path
      expect(page).to have_link('Add a new category')
    end

    it 'will have classes for bootstrap cards' do
      sign_in @user
      visit categories_path
      expect(page).to have_css('.card')
      expect(page).to have_css('.card-body')
      expect(page).to have_css('.card-title')
      expect(page).to have_css('.card-text')
    end

    it 'will go to add a new category page when click on button' do
      sign_in @user
      visit categories_path
      click_link 'Add a new category'
      expect(current_path).to eq(new_category_path)
    end

    it 'will have new category page content' do
      sign_in @user
      visit categories_path
      click_link 'Add a new category'
      expect(page).to have_content('ADD A CATEGORY')
    end

    it 'will have new category page with button "Save"' do
      sign_in @user
      visit categories_path
      click_link 'Add a new category'
      expect(page).to have_button('Save')
    end

    it 'will have new Category page with input fields' do
      sign_in @user
      visit categories_path
      click_link 'Add a new category'
      expect(page).to have_field('Category name')
      expect(page).to_not have_checked_field('fast-food.png')
    end

    it 'will have new Category page with classes for bootstrap forms' do
      sign_in @user
      visit categories_path
      click_link 'Add a new category'
      expect(page).to have_css('.form-group')
      expect(page).to have_css('.form-control')
      expect(page).to have_css('.form-check-label')
      expect(page).to have_css('.form-check-inline')
    end

    it 'will go to transactions page when click on category name' do
      sign_in @user
      visit categories_path
      click_link 'Fast Food'
      expect(current_path).to eq(category_deals_path(@fast_food.id))
    end

    it 'will go to edit profile page when click on header option' do
      sign_in @user
      visit categories_path
      click_link 'Edit profile'
      expect(current_path).to eq(edit_user_registration_path)
    end

    it 'will have edit profile page content' do
      sign_in @user
      visit categories_path
      click_link 'Edit profile'
      expect(page).to have_content('EDIT PROFILE')
      expect(page).to have_content('Unhappy?')
    end

    it 'will have edit profile page with button "Update"' do
      sign_in @user
      visit categories_path
      click_link 'Edit profile'
      expect(page).to have_button('Update')
    end

    it 'will have edit profile page with input fields' do
      sign_in @user
      visit categories_path
      click_link 'Edit profile'
      expect(page).to have_field('Email')
      expect(page).to have_field("Password (6 characters minimum) (leave blank if you don't want to change it)")
      expect(page).to have_field('Password (6 characters minimum)')
      expect(page).to have_field('Current password (we need your current password to confirm your changes)')
    end

    it 'will have edit profile page with classes for bootstrap forms' do
      sign_in @user
      visit categories_path
      click_link 'Edit profile'
      expect(page).to have_css('.form-group')
      expect(page).to have_css('.form-control')
    end

    it 'will log out when click on Sign out' do
      sign_in @user
      visit categories_path
      click_button 'Sign out'
      expect(current_path).to_not eq(categories_path)
      expect(current_path).to eq('/')
    end
  end
end
