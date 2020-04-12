Feature: Automate
  As an Engr. Candidate
  I need to automate http://www.way2automation.com/angularjs-protractor/webtables/
  So I can show my automation capabilities

  Scenario: Add user and validate user added to table
    Given I navigate to the User Table
    And I add a user 'JonD'
    Then I verify user 'JonD' is added

   Scenario: Delete user novak and validate user is deleted
     Given I navigate to the User Table
     And I delete a user 'Novak'
     Then I verify user 'Novak' is deleted
