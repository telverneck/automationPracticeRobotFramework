***Settings***
Documentation           Check Search functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Check Home Page - Navigation Bar
    [Tags]      smoke    
    Then I must see the navigation bar with options "Contact us", "Sign in"

Scenario2: Go to Contact us
    [Tags]      doing  
    When I access the navigation bar link "Contact us"
    Then I must see the page with the header "CONTACT US"

Scenario3: Go to Sign in
    [Tags]      doing  
    When I access the navigation bar link "Sign in"
    Then I must see the page with the header "AUTHENTICATION"