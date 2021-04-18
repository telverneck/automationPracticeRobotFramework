***Settings***
Documentation           Check Search functionality 

Resource                ../../Resources/Base.robot

Test Setup              Start Session
Test Teardown           Finish Session



***Test Cases***
Scenario1: Register a new user
    home navigation bar     Sign in     AUTHENTICATION
    When I submit a valid random email
    And I submit all personal information
    Then I must see my account area