Feature: Users sign up
  User come to website and make account using email and password, also chooses username

  Scenario: Sign up
    Given I go to the homepage
    When I click sign up button and fill in the form
    Then I am signed in

  Scenario: Login
    Given A valid user
    And I go to the homepage
    When I click and go to the login page
    And I fill in the login form
    Then I am logged in

  Scenario: User Logs Out
    Given A valid user
    And I go to the homepage
    When I click and go to the login page
    And I fill in the login form
    And I go to the homepage
    When I click the log out button
    Then I go to the homepage
