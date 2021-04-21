***Settings***
Documentation           Check Contact Us functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Send a message
    [Tags]      smoke
    Given that I access the "Contact us" and check the header "CUSTOMER SERVICE - CONTACT US"
    When I send a message    
    Then I must see a sucess alert with text: "Your message has been successfully sent to our team."
