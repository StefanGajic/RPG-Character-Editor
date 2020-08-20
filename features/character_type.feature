Feature: Character Type
  Everybody can see all characters
  Logged in users have ability to create a new characters, edit and delete their characters

  Background:
    Given A valid user
    When I go to the homepage
    When I click and go to the login page
    And I fill in the login form
    When I am logged in
    And I go to the homepage

  Scenario: View all characters
    Given I go to the homepage
    Then I click and go to the characters page


  Scenario: User logs in and creates new character
    When I click on create new character
    When I have fill in for a valid character
    Then I have created a new character

  Scenario: Edit character
    Given I have fill in for a valid character
    When I click and go to the characters page
    And I click edit character
    When I fill in for for edit the character
    Then I change my character

  Scenario: Delete character
    Given I have fill in for a valid character
    When I have created a new character
    And I click to delete the character
    Then I should not see it anymore in characters page
