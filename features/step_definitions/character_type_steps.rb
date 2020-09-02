# frozen_string_literal: true

Then('I click and go to the characters page') do
  click_on 'all-characters'

  visit '/character_types'
end

When('I click on create new character') do
  click_on 'new-character'

  visit '/character_types/new'
end

When('I have fill in for a valid character') do
  @character_type = FactoryBot.create(:character_type,
                                      user: @user,
                                      name: 'Test')
end

Then('I have created a new character') do
  visit '/character_types'
  expect(page).to have_content('Test')
end

And('I click edit character') do
  click_on 'edit-character'
end

When('I fill in for for edit the character') do
  fill_in 'character_type_name', with: 'Test edit'

  click_on 'update-character'
end

Then('I change my character') do
  expect(page).to have_content('Test edit')
end

And('I click to delete the character') do
  visit '/character_types'
  click_on 'delete-character'
end

Then('I should not see it anymore in characters page') do
  expect(page).to_not have_content('Test')
end
