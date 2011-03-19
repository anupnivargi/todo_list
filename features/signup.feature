Feature: Register to the system
  In order to use the system
  As a non existing user of the system
  I want to register

  Scenario: Successful Signup
    Given I am on the signup page
    When I fill in "user_first_name" with "Rock"
    And I fill in "user_email" with "rock@gmail.com"
    And I fill in "user_last_name" with "Balboa"
    And I fill in "user_password" with "temp123"
    And I fill in "user_password_confirmation" with "temp123"
    And I press "Create User"
    Then I should see "Login to Your Account"

