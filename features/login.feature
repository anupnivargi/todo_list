Feature: Login for users of the system
  In order to user the system
  As a existing user of the system
  I want to login

  Scenario: Successful Login
    Given I am on the signin page
    When I fill in "email" with "john@gmail.com"
    And I fill in "password" with "temp123"
    And I press "Sign In"
    Then I should see "Logged In"
    And I should see "Listing users"

