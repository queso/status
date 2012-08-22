Feature:
  As a visitor
  I want to see statuses
  So that I can understand if Litmus is up or down

  Scenario: Show the latest status
    Given a status of up with message of "Fixed the db"
    When I visit the status page
    Then I should see the top message listed as up with a message of "Fixed the db"

  Scenario: Show the last 10 messages
    Given 12 statuses exist
    When I visit the status page
    Then I should see a top message
    And I should see 10 older messages
