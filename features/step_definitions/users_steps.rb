# frozen_string_literal: true

Given('I go to the homepage') do
  visit '/'
end

Given('I click sign up button and fill in the form') do
  click_on 'sign-up'

  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_username', with: 'test_username'
  fill_in 'user_password', with: 'super_secret'
  fill_in 'user_password_confirmation', with: 'super_secret'
end

Given('I am signed in') do
  visit '/'
end

Given('A valid user') do
  @user = FactoryBot.create(:user,
                            email: 'test@test.com',
                            username: 'test_username',
                            password: 'super_secret')
end

When('I click and go to the login page') do
  click_on 'login'

  visit '/users/sign_in'
end

And('I fill in the login form') do
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: 'super_secret'
  click_button 'Log in'
end

Given('I am logged in') do
  visit '/'
end

When('I click the log out button') do
  click_on 'logout'
end
