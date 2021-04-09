***Settings***
Documentation           Check Search functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Check Home Page - 
    [Tags]      smoke    
    Then I must see the navigation bar
