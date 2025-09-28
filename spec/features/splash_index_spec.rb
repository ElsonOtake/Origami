require 'rails_helper'

RSpec.describe 'Splash page', type: :feature do
  describe 'without FactoryBot login' do
    before do
      visit root_path
    end

    it 'will present splash page' do
      expect(page).to have_current_path('/')
    end

    it 'will have page content' do
      expect(page).to have_content('Origami')
      expect(page).to have_content('Sign in')
      expect(page).to have_content('Sign up')
      expect(page).to have_xpath("//img[@alt='House of origami']")
    end

    it 'will have link to "Sign in"' do
      expect(page).to have_link('Sign in')
    end

    it 'will have link to "Sign up"' do
      expect(page).to have_link('Sign up')
    end

    it 'will have bulma classes' do
      expect(page).to have_css('.navbar')
      expect(page).to have_css('.section')
      expect(page).to have_css('.container')
      expect(page).to have_css('.image')
      expect(page).to have_css('.notice')
      expect(page).to have_css('.alert')
    end

    it 'will not have bootstrap classes' do
      expect(page).not_to have_css('.card-body')
      expect(page).not_to have_css('.card-title')
      expect(page).not_to have_css('.card-image')
    end
  end

  describe 'User logs in' do
    before do
      visit new_customer_session_path
    end

    it 'will be in the new_customer_session_path' do
      expect(page).to have_current_path(new_customer_session_path)
    end

    it 'will have Login page content' do
      expect(page).to have_content('Login')
    end

    it 'will have sign in page with button "Log In"' do
      expect(page).to have_button('Log In')
    end

    it 'will have sign in page with button "Back"' do
      expect(page).to have_content('Back')
    end

    it 'will have sign in page with link "Forgot your password?"' do
      expect(page).to have_link('Forgot your password?')
    end

    it 'will have sign in page with input fields' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end

    it 'will have sign in page with bulma classes' do
      expect(page).to have_css('.field')
      expect(page).to have_css('.control')
      expect(page).to have_css('.label')
    end

    it 'will have sign in page without classes for bootstrap forms' do
      expect(page).not_to have_css('.form-group')
      expect(page).not_to have_css('.form-control')
    end
  end

  describe 'User sign up' do
    before do
      visit new_customer_registration_path
    end

    it 'will go to sign up page' do
      expect(page).to have_current_path(new_customer_registration_path)
    end

    it 'will have sign up page content' do
      expect(page).to have_content('Sign up')
    end

    it 'will have sign up page with button "Back"' do
      expect(page).to have_content('Back')
    end

    it 'will have sign up page with input fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_field('Password confirmation')
      expect(page).to have_content('6 characters minimum')
    end

    it 'will have sign up page with bulma classes' do
      expect(page).to have_css('.field')
      expect(page).to have_css('.control')
      expect(page).to have_css('.label')
    end

    it 'will have sign up page without classes for bootstrap forms' do
      expect(page).not_to have_css('.form-group')
      expect(page).not_to have_css('.form-control')
    end
  end
end
