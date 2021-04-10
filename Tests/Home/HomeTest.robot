***Settings***
Documentation           Check Search functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Check Home Page - Navigation Bar
    [Tags]      smoke    
    Then I must see the navigation bar with options "Contact us" and "Sign in"

Scenario2: Navigation Bar - Go to Contact us
    [Template]  home navigation bar
    Contact us      CONTACT US

Scenario3: Navigation Bar - Go to Sign in
     
    [Template]  home navigation bar
    Sign in     AUTHENTICATION

Scenario4: Check Home Page - Best offers
    Then I must see the tabs "Popular" and "Best Sellers"

Scenario5: Check Best offers - Popular tab 
    When I go to "Popular" tab
    Then I see the product list

Scenario5: Check Best offers - Best Sellers tab
    When I go to "Best Sellers" tab
    Then I see the product list

Scenario5: See home slider and offers
    [Tags]  doing
    Then I see the Home slider    
    And banner offers
    And I can navigate throught home slider images