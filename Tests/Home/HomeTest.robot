***Settings***
Documentation           Home screen functionalities - Banners, Best offers, Navigation and Product sessions

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

Scenario6: Check Best offers - Best Sellers tab
    When I go to "Best Sellers" tab
    Then I see the product list

Scenario7: See home slider and offers
    Then I see the Home slider    
    And banner offers
    And I can navigate throught home slider images

Scenario8: Product Menu - navigation Women 
    [Tags]      doing  
    [Template]      Product Menu Navigation
    Women   T-shirts 

Scenario9: Product Menu - navigation Women
    [Tags]      doing  
    [Template]      Product Menu Navigation
    Women   Blouses 

Scenario10: Product Menu - navigation Women
    [Tags]      doing  
    [Template]      Product Menu Navigation
    Women   Casual Dresses

Scenario11: Product Menu - navigation Women
    [Tags]      doing  
    [Template]      Product Menu Navigation
    Women   Evening Dresses

Scenario12: Product Menu - navigation Women
    [Tags]      doing  
    [Template]      Product Menu Navigation
    Women   Summer Dresses
