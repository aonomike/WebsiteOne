Feature: As a developer
  In order to be able to use the sites features
  I want to register as a user
  https://www.pivotaltracker.com/story/show/63047058

  Background:
    Given I am not logged in

  Scenario: Let a visitor register as a site user
    Given I am on the "registration" page
    And I submit "user@example.com" as username
    And I submit "password" as password
    And I click "Sign up" button
    Then I should be on the "home" page
    And I should see a successful sign up message
    And I should receive a "Welcome to AgileVentures.org" email
    And replies to that email should go to "info@agileventures.org"


  Scenario: User signs up with valid data
    When I sign up with valid user data
    Then I should see a successful sign up message

  Scenario: User signs up with invalid email
    When I sign up with an invalid email
    Then I should see an invalid email message

  Scenario: User signs up without password
    When I sign up without a password
    Then I should see a missing password message

  Scenario: User signs up without password confirmation
    When I sign up without a password confirmation
    Then I should see a missing password confirmation message

  Scenario: User signs up with mismatched password and confirmation
    When I sign up with a mismatched password confirmation
    Then I should see a mismatched password message

  Scenario: User signs up with a GitHub account
    Given I am on the "registration" page
    And I want to use third party authentications
    When I click "GitHub"
    Then I should see "Signed in successfully."

  Scenario: User signs up with a GitHub account having no public email (sad path)
    Given I am on the "registration" page
    And I want to use third party authentications without a public email
    When I click "GitHub"
    Then I should see "Email can't be blank"
