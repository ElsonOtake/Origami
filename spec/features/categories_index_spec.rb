require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @icon = Icon.create(name: 'fast food', file_name: 'fast-food.png')
      Category.create(name: 'Fast Food', icon: @icon, user: @user)
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
  end
end
