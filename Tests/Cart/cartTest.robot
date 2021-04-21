***Settings***
Documentation           Check Cart functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session

***Test Cases***
Scenario1: Add to Cart
    [Tags]          smoke
    [Setup]         Search Item     t-shirts    
    When I add this item to the cart
    And I proceed to checkout
    Then I must check this item "T-shirts" in the cart

Scenario1: Remove item in the Cart
    [Tags]          doing
    [Setup]         Search Item     t-shirts    
    When I add this item to the cart
    And I close the modal checkout
    And I open the cart
    And I check the item "T-shirts" in the cart
    And I remove it
    Then I must see the message "Your shopping cart is empty."

