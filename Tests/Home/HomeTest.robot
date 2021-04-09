***Settings***
Documentation           Test Home Screen

Resource                ../../Resources/base.robot

Test Setup              Start Session
Test Teardown           Finish Session


***Test Cases***
Scenario1: Search valid content
    Given that I want to search for "Blouse"
    When I search for this
    Then I must see the results 

Scenario2: No results search
    [Tags]      results
    Given that I want to search for "No results"
    When I search for this
    Then I must see the message "No results were found for your search "No results"" 

