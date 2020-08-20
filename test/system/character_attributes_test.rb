require "application_system_test_case"

class CharacterAttributesTest < ApplicationSystemTestCase
  setup do
    @character_attribute = character_attributes(:one)
  end

  test "visiting the index" do
    visit character_attributes_url
    assert_selector "h1", text: "Character Attributes"
  end

  test "creating a Character attribute" do
    visit character_attributes_url
    click_on "New Character Attribute"

    fill_in "Name", with: @character_attribute.name
    fill_in "Value", with: @character_attribute.value
    click_on "Create Character attribute"

    assert_text "Character attribute was successfully created"
    click_on "Back"
  end

  test "updating a Character attribute" do
    visit character_attributes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @character_attribute.name
    fill_in "Value", with: @character_attribute.value
    click_on "Update Character attribute"

    assert_text "Character attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Character attribute" do
    visit character_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character attribute was successfully destroyed"
  end
end
